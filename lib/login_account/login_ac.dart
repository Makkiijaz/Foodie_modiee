import 'package:flutter/material.dart';
import 'package:food_app/login_account/login_provider.dart';
import 'package:food_app/login_account/textfield/text_field_design.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Welcome Back',
                    style: GoogleFonts.inter(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  )),
              const SizedBox(
                height: 5,
              ),
              Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Please Enter Your Details',
                    style: GoogleFonts.inter(
                        fontSize: 12,
                        color: Colors.black),
                  )),
              const SizedBox(height: 18,),
              Text(
                'Phone Number',
                style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              const SizedBox(
                height: 7,
              ),
              TextFieldDesign(
                controller: phoneController,
                hintText: 'Phone Number',
                obscure: false,
                keyBoardType: TextInputType.phone,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Password',
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 7,
              ),
              TextFieldDesign(
                  controller: passwordController,
                  hintText: 'Password',
                  keyBoardType: TextInputType.visiblePassword,
                  obscure: true),
              const SizedBox(
                height: 7,
              ),
              const Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(fontSize: 15),
                  )),
              const SizedBox(
                height: 30,
              ),
              InkWell(
                onTap: () {
                  if (phoneController.text.isEmpty || passwordController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Text('Please Enter Details'),
                        backgroundColor: Colors.deepOrange.shade300,
                        duration: const Duration(seconds: 3),
                        elevation: 10,
                        action: SnackBarAction(
                          label: 'Ok',
                          onPressed: () {},
                        ),
                        animation: CurvedAnimation(
                          parent: kAlwaysDismissedAnimation,
                          curve: Curves.bounceIn,
                        ),
                        behavior: SnackBarBehavior.floating,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    );
                  } else {
                    loginProvider.login(
                        phoneController.text.toString(), passwordController.text.toString(), context);
                  }
                },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.deepOrangeAccent,
                  ),
                  child: Center(
                    child: loginProvider.loading
                        ? const CircularProgressIndicator(
                      color: Colors.white,
                    )
                        : Text(
                      'Login',
                      style: GoogleFonts.inter(
                          fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
