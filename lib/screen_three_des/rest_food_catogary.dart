import 'package:flutter/cupertino.dart';

class ResFoodCatogary extends StatelessWidget{
  final String name;
  final String image;
  final String price;

  const ResFoodCatogary({super.key, required this.name , required this.image,required this.price});

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 155,
      width: 149,
      decoration: const BoxDecoration(
        color: Color(0xffF5F5F5),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child:  Column(
        children: [
          Text(name,
              style: const TextStyle(
                  color: Color(0xff36888A),
                  fontSize: 14,
                  fontFamily: 'inter_bo')),
          Image(
              image: AssetImage(image),
              width: 97,
              height: 77),
          const Spacer(),
          Text(price,
              style: const TextStyle(
                  color: Color(0xff36888A),
                  fontFamily: 'inter_bo',
                  fontSize: 14)),
        ],
      ),
    );
  }
}