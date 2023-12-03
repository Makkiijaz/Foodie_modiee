import 'package:flutter/material.dart';
import 'package:food_app/constants/card_container.dart';
import 'package:food_app/constants/text_sizes.dart';
import 'package:food_app/login_account/login_provider.dart';
import 'package:provider/provider.dart';

class UserDataContainer extends StatefulWidget {
  const UserDataContainer({super.key});

  @override
  State<UserDataContainer> createState() => _UserDataContainerState();
}

class _UserDataContainerState extends State<UserDataContainer> {
  @override
  void initState() {
    super.initState();
    Provider.of<LoginProvider>(context, listen: false).getUserInfo();
  }

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context);
    final user = loginProvider.user;
    final userImage =
        'https://foodie.junaidali.tk/storage/app/public/profile/${user.response?.image}';
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          alignment: Alignment.bottomCenter,
          children: [
            const SizedBox(
              height: 165,
              width: 160,
            ),
            Positioned(
              top: 2,
              child: Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: NetworkImage(userImage),fit: BoxFit.cover)),
              ),
            ),
             InkWell(onTap: () {
            },child: const Positioned(child: Icon(Icons.camera_alt,color: Colors.grey,)))
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        CardContainer(
          height: 100,
          width: double.infinity,
          cardColor: Colors.white,
          headLine: 'Name',
          textName: user.response?.fName ?? 'Welcome',
        ),
        CardContainer(
          height: 100,
          width: double.infinity,
          cardColor: Colors.white,
          headLine: 'Email',
          textName: user.response?.email ?? 'Email',
        ),
        const CardContainer(
          height: 100,
          width: double.infinity,
          cardColor: Colors.white,
          headLine: 'Password',
          textName: '************',
        ),
        CardContainer(
          height: 100,
          width: double.infinity,
          cardColor: Colors.white,
          headLine: 'Phone Number',
          textName: user.response?.phone ?? 'Phone Number',
        ),
        const SizedBox(
          height: 10,
        ),
        const Align(
          alignment: Alignment.topLeft,
          child: PrimaryTextSize(
            textName: 'Connected Accounts',
            textSize: 18,
          ),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          height: 100,
          width: double.infinity,
          decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(20)
          ),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PrimaryTextSize(
                  textName: 'Accounts',
                  textColor: Colors.black45,
                  textSize: 12),
              Spacer(),
              Row(
                children: [
                  Image(image: AssetImage('assets/ic_google.png'),width: 24,height: 24,),
                  SizedBox(width: 10,),
                  PrimaryTextSize(textName: 'Google',textSize: 18,),
                  Spacer(),
                  Icon(Icons.gpp_good_sharp,color: Colors.green,)
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
