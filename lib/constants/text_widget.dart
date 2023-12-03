import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextName extends StatelessWidget{
 final String textName;

  const TextName({super.key, required this.textName});

  @override
  Widget build(BuildContext context) {
    return Text(textName,style: GoogleFonts.inter(fontSize: 12,color: Colors.black),);
  }
}
class HeadLineText extends StatelessWidget{
  final String headlineText;
  const HeadLineText({super.key, required this.headlineText});
  @override
  Widget build(BuildContext context) {
    return Text(headlineText,style: GoogleFonts.inter(fontSize: 18,color: Colors.black,fontWeight: FontWeight.bold),);
  }}

class ContainerForDrawer extends StatelessWidget{
final Color containerColor;
final String containerText;

const ContainerForDrawer({super.key,
  required this.containerColor,
  required this.containerText
});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: containerColor,
      ),
      child: TextName(textName: containerText),
    );
  }

}