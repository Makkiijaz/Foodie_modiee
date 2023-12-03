import 'package:flutter/material.dart';
import 'package:food_app/animation/fade_anim.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../create_login_main/tabs_main_screen.dart';

class RestProduct extends StatelessWidget {
  final String productImage;
  final String productName;
  final String productSubTitle;
  final String productRs;

  const RestProduct(
      {super.key,
      required this.productName,
      required this.productImage,
      required this.productRs,
      required this.productSubTitle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 95,
        padding: const EdgeInsets.all(6),
        width: double.infinity,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Color(0xffF5F5F5),
        ),
        child: Row(
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image(image: AssetImage(productImage), width: 97, height: 77),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(productName,
                          style: const TextStyle(
                              fontFamily: 'inter_ebo',
                              fontSize: 14,
                              color: Color(0xff36888A))),
                      Text(productSubTitle,
                          style: const TextStyle(
                              color: Color(0xff908D8D),
                              fontSize: 11,
                              fontFamily: 'inter_bo')),
                      const Spacer(),
                      Text(productRs,
                          style: const TextStyle(
                              fontFamily: 'inter_bo',
                              fontSize: 14,
                              color: Color(0xff36888A))),
                    ],
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: GestureDetector(
                onTap: () {
                  LoginOrNot(context);
                },
                child: Container(
                  height: 34,
                  width: 32,
                  decoration: const BoxDecoration(
                    color: Color(0xff36888A),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: const Icon(Icons.add, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  void LoginOrNot(BuildContext context)async{
    var sharePrefs = await SharedPreferences.getInstance();
    var token = sharePrefs.getString('token');
    if(token !.isEmpty){
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return  AlertDialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            backgroundColor: Colors.white,
            title: const Text('ALert'),
            content: const Text('Please Login Before Access of Restaurants'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Close'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacement(context, FadeRoute(page: const Tabs()));
                },
                child: const Text('Login'),
              ),
            ],
          );
        },
      );
    }else{
      print(token);
    }
  }
}
