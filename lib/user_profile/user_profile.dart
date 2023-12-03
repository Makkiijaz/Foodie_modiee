import 'package:flutter/material.dart';
import 'package:food_app/constants/text_sizes.dart';
import 'package:food_app/user_profile/user_data_container.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.deepOrangeAccent.shade100,
          title: const Center(child: PrimaryTextSize(textName: 'User Profile')),
          elevation: 0),
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                UserDataContainer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
