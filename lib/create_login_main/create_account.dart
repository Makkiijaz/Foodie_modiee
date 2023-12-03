import 'package:flutter/material.dart';
import 'package:food_app/login_account/login_provider.dart';
import 'package:food_app/login_account/textfield/text_field_design.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController EmailController = TextEditingController();
  TextEditingController ConfirmController = TextEditingController();
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
              Text('Email Address',style: GoogleFonts.inter(fontSize: 14,fontWeight: FontWeight.bold,color:Colors.black),),
              const SizedBox(height: 7,),
              TextFieldDesign(
                  controller: EmailController,
                  hintText: 'Email Address',
                  keyBoardType: TextInputType.emailAddress,
                  obscure: false),
              const SizedBox(height: 20,),
              Text('Phone Number',style: GoogleFonts.inter(fontSize: 14,fontWeight: FontWeight.bold,color:Colors.black),),
              const SizedBox(height: 7,),
              TextFieldDesign(
                  controller: phoneController,
                  hintText: 'Phone Number',
                  keyBoardType: TextInputType.phone,
                  obscure: false),
              const SizedBox(
                height: 20,
              ),
              Text('Password',style: GoogleFonts.inter(fontSize: 14,fontWeight: FontWeight.bold,color:Colors.black),),
              const SizedBox(height: 7,),
              TextFieldDesign(
                  controller: passwordController,
                  hintText: 'Password',
                  keyBoardType: TextInputType.visiblePassword,
                  obscure: true),
              const SizedBox(
                height: 20,
              ),
              Text('Confirm Password',style: GoogleFonts.inter(fontSize: 14,fontWeight: FontWeight.bold,color:Colors.black),),
              const SizedBox(height: 7,),
              TextFieldDesign(
                  controller: ConfirmController,
                  hintText: 'Confirm Password',
                  keyBoardType: TextInputType.visiblePassword,
                  obscure: true),
              const SizedBox(
                height: 30,
              ),
              InkWell(
                onTap: () {
                  if (phoneController.text.isEmpty ||
                      passwordController.text.isEmpty) {
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
                        phoneController.text.toString(),
                        passwordController.text.toString(),
                        context);
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
                        :  Text(
                      'Signup',
                      style:GoogleFonts.inter(fontSize: 20,color: Colors.white),
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
