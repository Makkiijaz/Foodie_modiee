import 'package:flutter/material.dart';

class FoodsItems extends StatelessWidget{
  final String imagePath;
  final String productName;

  const FoodsItems({super.key,
   required this.imagePath,
   required this.productName,
});

  @override
  Widget build(BuildContext context) {
   return Column(
     children: [
       Container(
         height: 70,
         width: 76,
         decoration: const BoxDecoration(
             borderRadius:
             BorderRadius.all(Radius.circular(12)),
             color: Color(0xffF5F5F5)),
         child:  Padding(
           padding: const EdgeInsets.all(10.0),
           child: Column(
             children: [
               Image(
                 image:
                 AssetImage(imagePath),
                 height: 49,
                 width: 64,
               ),
             ],
           ),
         ),
       ),
       const SizedBox(
         height: 5,
       ),
        Text(
         productName,
         style: const TextStyle(
             fontSize: 12,
             fontFamily: 'inter_bo',
             color: Color(0xff424040)),
       ),
     ],
   );
  }

}
