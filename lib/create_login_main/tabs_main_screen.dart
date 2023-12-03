import 'package:flutter/material.dart';
import 'package:food_app/create_login_main/create_account.dart';
import 'package:food_app/login_account/login_ac.dart';
import 'package:google_fonts/google_fonts.dart';

class Tabs extends StatefulWidget {
  const Tabs({super.key});

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Container(
              height: 250,
             decoration: const BoxDecoration(
               image: DecorationImage(image: AssetImage('assets/login_screen_bg.png'),fit: BoxFit.cover),
               borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30))
             ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20,top: 10),
              child: TabBar(
                  indicatorSize: TabBarIndicatorSize.label,
                  indicatorColor: const Color(0xffFBBE36),
                  indicatorWeight: 2.0,
                  tabs: [
                    Tab(
                      child: Text(
                        'Login',
                        style: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xffFBBE36)),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Signup',
                        style: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xffFBBE36)),
                      ),
                    ),
                  ]),
            ),
            const Expanded(
              child: TabBarView(children:[
                LoginScreen(),
                SignupScreen()
              ]),
            )
          ],
        ),
      ),
    );
  }
}
