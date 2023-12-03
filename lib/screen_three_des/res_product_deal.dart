import 'package:flutter/material.dart';

class ResDeals extends StatelessWidget {
  final String dealName;
  final String dealImage;
  final String dealPrice;
  final int gradient1;
  final int gradient2;

  const ResDeals(
      {super.key,
      required this.dealName,
      required this.dealImage,
      required this.dealPrice,
      required this.gradient1,
      required this.gradient2});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          SizedBox(
            height: 120,
            width: double.infinity,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 3,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                child: Container(
                  height: 120,
                  width: double.infinity,
                  decoration:  BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    gradient: LinearGradient(
                      colors: [
                        Color(gradient1), // F67E34 color
                        Color(gradient2) // F67E34 color
                        // White color
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                             Text(
                              dealName,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontFamily: 'inter_ebo'),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                             Text(
                              dealPrice,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontFamily: 'inter_bo'),
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            Container(
                              width: 62,
                              height: 20,
                              decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(5)),
                                color: Colors.white.withOpacity(0.8),
                              ),
                              child: const Center(
                                child: Text(
                                  '12min',
                                  style:
                                      TextStyle(color: Colors.deepOrangeAccent),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                         Image(
                            image: AssetImage(dealImage),
                            height: 85,
                            width: 125),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
