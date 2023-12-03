import 'package:flutter/material.dart';
import 'package:food_app/home_screen/home_screen_design.dart';
import 'package:food_app/models/user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../app_apis/app_apis.dart';

class LoginProvider with ChangeNotifier {
  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  User _user = User();
  User get user => _user;

  setUser(String user1) {
    _user = User.fromJson(jsonDecode(user1));
    notifyListeners();
  }

  Future<void> login(String phone, String password,
      BuildContext context) async {
    setLoading(true);
    try {
      final response = await http.post(
        Uri.parse(AppUrl.userLogin),
        body: {
          'phone': phone,
          'password': password,
        },
      );
      if (response.statusCode == 200) {
        final responseBody = json.decode(response.body);
        final statusCode = responseBody['status_code'];
        if (statusCode == 1) {
          final token = responseBody['response']['token'];
          if (token != null) {
            final sharedPreferences = await SharedPreferences.getInstance();
            sharedPreferences.setString('token', token);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: const Text(
                  'Login Successful',
                ),
                backgroundColor: Colors.deepOrange.shade300,
                duration: const Duration(seconds: 3),
                elevation: 10, // Shadow
                action: SnackBarAction(
                  label: 'Ok',
                  onPressed: () {
                  },
                ),
                animation: CurvedAnimation(
                  parent: kAlwaysDismissedAnimation,
                  curve: Curves.easeInOut,
                ),
                behavior: SnackBarBehavior.floating, // Floating behavior
                shape: RoundedRectangleBorder( // Custom border shape
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            );
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) =>  HomeScreen(colorBox: Colors.red.withOpacity(0.5),TextLogin: 'LogOut',)));
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Error fetching user info'),
                backgroundColor: Colors.red,
                duration: Duration(seconds: 3),
              ),
            );
          }
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Login failed'),
              backgroundColor: Colors.teal,
              duration: Duration(seconds: 3),
            ),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text(
              'Please Enter Valid Details',
            ),
            backgroundColor: Colors.deepOrange.shade300, // Background color
            duration: const Duration(seconds: 3), // Display duration
            elevation: 10, // Shadow
            action: SnackBarAction(
              label: 'Retry',
              onPressed: () {
              },
            ),
            animation: CurvedAnimation( // Animation curve
              parent: kAlwaysDismissedAnimation,
              curve: Curves.easeInOut,
            ),
            behavior: SnackBarBehavior.floating, // Floating behavior
            shape: RoundedRectangleBorder( // Custom border shape
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        );
      }
    } catch (e) {
      print(e.toString());
    } finally {
      setLoading(false);
    }
  }

  Future<void> getUserInfo() async {
    final sharePrefs = await SharedPreferences.getInstance();
    var token = sharePrefs.getString('token');
    if (token == null) {
      sharePrefs.setString('token', '');
    } else {
      final userInfoResponse = await http.get(
        Uri.parse(AppUrl.userInfo),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );
      if (userInfoResponse.statusCode == 200) {
        final userInfo = userInfoResponse.body;
        setUser(userInfo);
      }
    }
  }
}

