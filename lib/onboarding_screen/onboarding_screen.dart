import 'package:flutter/material.dart';
import 'package:food_app/animation/fade_anim.dart';
import 'package:food_app/constants/colors.dart';
import 'package:food_app/constants/image_strings.dart';
import 'package:food_app/home_screen/home_screen_design.dart';
import 'package:food_app/models/onboarding_screen_model.dart';
import 'package:food_app/onboarding_screen/onboarding_design.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int currentPage = 0;
  final controller = LiquidController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final pages = [
      OnBoardingDesign(
          model: OnBoardingModel(
              image: onBoardingImage01,
              title: 'Choose Your Meal',
              bgColor: onBoardingColor01,
              subTitle:
                  'LoremIpsumLoremIpsumLoremIpsumLoremIpsumLoremIpsumLoremIpsum',
              height: size.height)),
      OnBoardingDesign(
          model: OnBoardingModel(
              image: onBoardingImage02,
              title: 'Choose Your Payment',
              bgColor: onBoardingColor02,
              subTitle:
                  'LoremIpsumLoremIpsumLoremIpsumLoremIpsumLoremIpsumLoremIpsum',
              height: size.height)),
      OnBoardingDesign(
          model: OnBoardingModel(
              image: onBoardingImage03,
              title: 'Fast Delivery',
              bgColor: onBoardingColor03,
              subTitle:
                  'LoremIpsumLoremIpsumLoremIpsumLoremIpsumLoremIpsumLoremIpsum',
              height: size.height)),
    ];
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          LiquidSwipe(
            enableLoop: false,
            pages: pages,
            liquidController: controller,
            onPageChangeCallback: OnPageChangeCallback,
            slideIconWidget: const Icon(Icons.arrow_back_ios_new_outlined),
            enableSideReveal: true,
          ),
          Positioned(
              top: 20,
              right: 20,
              child: TextButton(
                onPressed: () => controller.jumpToPage(page: 2),
                child: const Text(
                  'Skip',
                  style: TextStyle(color: Colors.black),
                ),
              )),
          Positioned(
              bottom: 40,
              child: ElevatedButton(
                style: const ButtonStyle(
                  fixedSize: MaterialStatePropertyAll(Size(120, 40)),
                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)))),
                  backgroundColor:
                      MaterialStatePropertyAll(Colors.deepOrangeAccent),
                ),
                onPressed: () async {
                  controller.currentPage + 1;
                  controller.animateToPage(page: currentPage + 1);
                  if (controller.currentPage == 2) {
                    Navigator.pushReplacement(
                        context,
                        FadeRoute(
                            page: HomeScreen(
                                TextLogin: 'Login',
                                colorBox: Colors.green.withOpacity(0.5))));
                  }else{
                    return;
                  }
                },
                child: const Text('Next'),
              )),
          Positioned(
              bottom: 20,
              child: AnimatedSmoothIndicator(
                activeIndex: controller.currentPage,
                count: 3,
                effect: WormEffect(
                    activeDotColor: Colors.deepOrangeAccent,
                    dotColor: Colors.deepOrangeAccent.withOpacity(0.5),
                    dotHeight: 5.0),
              ))
        ],
      ),
    );
  }

  void OnPageChangeCallback(int activeIndex) {
    setState(() {
      currentPage = activeIndex;
    });
  }
}
