import 'package:flutter/material.dart';
import 'package:food_app/constants/text_sizes.dart';

class CardContainer extends StatelessWidget {
  final double height;
  final double width;
  final String headLine;
  final Color cardColor;
  final String textName;

  const CardContainer(
      {super.key,
      required this.height,
      required this.width,
      required this.cardColor,
      this.textName = 'Welcome User',
      required this.headLine});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        padding: const EdgeInsets.all(10),
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: cardColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                PrimaryTextSize(
                    textName: headLine,
                    textColor: Colors.black45,
                    textSize: 12),
                const Spacer(),
                const Icon(
                  Icons.mode_edit_outline,
                  color: Colors.deepOrangeAccent,
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            PrimaryTextSize(
                textName: textName,
                textSize: 15,
                textColor: Colors.black,
                textWeight: FontWeight.w600),
          ],
        ),
      ),
    );
  }
}
