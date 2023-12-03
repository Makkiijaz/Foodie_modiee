import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TextFieldDesign extends StatefulWidget {
  final String hintText;
  final bool obscure;
  final TextEditingController controller;
  final TextInputType keyBoardType;

  const TextFieldDesign({super.key,
    required this.hintText,
    required this.controller,
    required this.obscure,
    required this.keyBoardType,

  });

  @override
  _TextFieldDesignState createState() => _TextFieldDesignState();
}

class _TextFieldDesignState extends State<TextFieldDesign> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: widget.obscure && _obscureText,
      style:const TextStyle(fontSize: 15,color: Colors.black),
      autocorrect: true,
      keyboardType: widget.keyBoardType,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: const TextStyle(color: Colors.black),
        enabled: true,
        suffixIcon: widget.obscure
            ? IconButton(
          icon: FaIcon(
            _obscureText
                ? FontAwesomeIcons.eye
                : FontAwesomeIcons.eyeSlash,
          ),
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
          iconSize: 15,
        )
            : null,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0xffBEC5D1)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0xffBEC5D1)),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.red),
        ),
      ),
    );
  }
}
