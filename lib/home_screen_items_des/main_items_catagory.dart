import 'package:flutter/material.dart';

class MainItems extends StatelessWidget{
  final String imagePath;
  final String productName;

  const MainItems({super.key,
    required this.imagePath,
    required this.productName,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 90,
          width: 90,
          decoration: const BoxDecoration(
            color: Color(0xffF5F5F5),
            borderRadius:
            BorderRadius.all(Radius.circular(10)),
          ),
          child:  Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Image(
                  image: AssetImage(imagePath),
                  height: 48.57,
                  width: 61.31,
                ),
                const Spacer(),
                Text(productName,
                    style: const TextStyle(
                        color: Color(0xff36888A),
                        fontFamily: 'inter_ebo',
                        fontSize: 12))
              ],
            ),
          ),
        ),
      ],
    );
  }
}

