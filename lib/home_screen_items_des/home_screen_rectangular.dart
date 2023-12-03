import 'package:flutter/material.dart';

class RectangleItem extends StatelessWidget {
  final String bcPath;
  final String imagePath;
  final String productName;
  final String productDescription;
  final String productPrice;
  final Color txtcolor;
  final Color boxcolor;
  final Color iconcolor;

  const RectangleItem(
      {super.key,
      required this.bcPath,
      required this.imagePath,
      required this.productName,
      required this.productDescription,
      required this.productPrice,
      required this.boxcolor,
      required this.iconcolor,
      required this.txtcolor});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 210,
      width: 145,
      decoration:   BoxDecoration(
        image: DecorationImage(image: AssetImage(bcPath)),
      ),
      child: Column(
        children: [
          Padding(
            padding:  const EdgeInsets.all(15.0),
            child: Column(children: [
               Image(
                image: AssetImage(imagePath),
                height: 100,
                width: 90,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   Text(
                      productName,
                    style:  TextStyle(
                        color:txtcolor,
                        fontSize: 15,
                        fontFamily: 'ab',
                        fontWeight: FontWeight.bold),
                  ),
                   const SizedBox(
                    height: 5,
                  ),
                   Text(
                   productDescription,
                    style:  TextStyle(
                        color: txtcolor,
                        fontSize: 10,
                        fontFamily: 'ab',
                        fontWeight: FontWeight.bold),
                  ),
                   const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                       Text(
                        productPrice,
                        style:  TextStyle(
                            color: txtcolor,
                            fontSize: 12,
                            fontFamily: 'ab',
                            fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                          height: 16,
                          width: 16,
                          decoration:  BoxDecoration(
                            color:boxcolor,
                            borderRadius: const BorderRadius.all(Radius.circular(6)),
                          ),
                          child:  Icon(
                            Icons.add,
                            color: iconcolor,
                            size: 13,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
