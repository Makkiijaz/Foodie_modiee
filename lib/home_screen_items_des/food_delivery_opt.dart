import 'package:flutter/material.dart';
import 'package:food_app/Screentwo.dart';
import '../animation/fade_anim.dart';

class FoodDelivery extends StatelessWidget {
  const FoodDelivery({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: ()  {
        Navigator.push(context, FadeRoute(page:  const Screentwo()));
        },
        child: Container(
          height: 132,
          width: double.infinity,
          decoration: const BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.all(Radius.circular(12)),
            color: Color(0xffF5F5F5),
          ),
          child: const Padding(
            padding: EdgeInsets.all(10.0),
            child: Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Food Delivery',
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'inter_ebo',
                            fontWeight: FontWeight.bold,
                            color: Color(0xff36888A),
                          ),
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Text(
                          'Order everything at your door step',
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: 'inter_bo',
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    Image(
                      image: AssetImage('assets/rider3.png'),
                      height: 92,
                      width: 99,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
