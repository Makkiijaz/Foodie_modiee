import 'dart:async';
import 'package:flutter/material.dart';
import 'package:food_app/animation/fade_anim.dart';
import 'package:food_app/onboarding_screen/onboarding_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../home_screen/home_screen_design.dart';
import '../login_account/login_provider.dart';

class GetStartedScreen extends StatefulWidget {
  const GetStartedScreen({super.key});

  @override
  State<GetStartedScreen> createState() => GetStartedScreenState();
}

class GetStartedScreenState extends State<GetStartedScreen> {
  @override
  void initState() {
    super.initState();
    homeStart();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.orange.shade100,
      body:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Center(child: Image(image: AssetImage('assets/app_logo.png'))),
          Text('Food Finder', style: GoogleFonts.aBeeZee(color: Colors.black,fontSize: 28,fontWeight: FontWeight.w600),)
        ],
      )
    );
  }

  Future<void> homeStart() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool onboardingShown = prefs.getBool('onboardingShown') ?? false;
    var token = prefs.getString('token');
    await Provider.of<LoginProvider>(context, listen: false).getUserInfo(); // Load user data

    if (onboardingShown) {
      if (token!.isEmpty) {
        Timer(const Duration(seconds: 3), () {
          Navigator.pushReplacement(
            context,
            FadeRoute(
              page: HomeScreen(
                TextLogin: 'Login',
                colorBox: Colors.green.withOpacity(0.5),
              ),
            ),
          );
        });
      } else {
        Timer(const Duration(seconds: 3), () {
        Navigator.pushReplacement(
          context,
          FadeRoute(
            page: HomeScreen(
              TextLogin: 'Logout',
              colorBox: Colors.red.withOpacity(0.5),
            ),
          ),
        );
      });
      }
    
    } else {
      Timer(const Duration(seconds: 3), () {
        prefs.setBool('onboardingShown', true); // Mark onboarding as shown
        Navigator.pushReplacement(context, FadeRoute(page: const OnBoardingScreen()));
      });
    }
  }

}
