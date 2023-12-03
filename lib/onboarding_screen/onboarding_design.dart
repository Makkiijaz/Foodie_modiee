import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/onboarding_screen_model.dart';

class OnBoardingDesign extends StatelessWidget {
  const OnBoardingDesign({
    super.key,
    required this.model,
  });

  final OnBoardingModel model;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(13),
      color: model.bgColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image(image: AssetImage(model.image), height: size.height * 0.5),
          Column(
            children: [
              Text(
                model.title,
                style: GoogleFonts.inter(
                    textStyle: Theme.of(context).textTheme.headlineMedium),
              ),
              Text(
                model.subTitle,
                style: GoogleFonts.inter(fontSize: 15),
                textAlign: TextAlign.center,
              )
            ],
          ),
          const SizedBox(
            height: 80,
          ),
        ],
      ),
    );
  }
}
