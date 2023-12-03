import 'package:flutter/material.dart';
import 'package:food_app/Screenthree.dart';
import 'package:food_app/all_restaurants_location_map.dart';
import 'package:food_app/animation/fade_anim.dart';
import 'package:food_app/models/restaurants.dart';

class ProfilePicture extends StatelessWidget {
  String latitude;
  String longitide;
  String profile;
  String restAddress;
  String restImage;
  String restName;
  ProfilePicture(
      {super.key,
      required this.profile,
      required this.latitude,
      required this.longitide,
      required this.restImage,
      required this.restAddress,
      required this.restName});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 137,
      width: double.infinity,
      child: Column(
        children: [
          Stack(
            children: [
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        FadeRoute(
                            page: Screenthree(
                          latitude: latitude,
                          longitude: longitide,
                          restAddress: restAddress,
                          restImage: restImage,
                          restName: restName,
                        )));
                  },
                  child: Container(
                    height: 137,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        profile,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: 137, // Fixed height to maintain aspect ratio
                      ),
                    ),
                  )),
              Positioned(
                top: 10,
                right: 10,
                child: Container(
                  height: 23,
                  width: 23,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.8),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                  child: const Icon(
                    Icons.favorite_outline_rounded,
                    color: Color(0xffF97F35),
                  ),
                ),
              ),
              Positioned(
                bottom: 10,
                left: 10,
                child: Container(
                  height: 20,
                  width: 62,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.8),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                  child: const Row(
                    children: [
                      SizedBox(width: 2),
                      Image(
                        image: AssetImage('assets/rider1.png'),
                        width: 17,
                        height: 13,
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      Text(
                        '12 mins',
                        style: TextStyle(
                          fontSize: 10,
                          fontFamily: 'inter_re',
                          color: Color(0xffF97F35),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ProfileName extends StatelessWidget {
  String name;

  ProfileName({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 15,
        fontFamily: 'inter_bo',
        color: Color(0xff36888A),
      ),
    );
  }
}

class ProfileDescription extends StatelessWidget {
  String description;
  ProfileDescription({super.key, required this.description});
  @override
  Widget build(BuildContext context) {
    return Text(
      description,
      style: const TextStyle(
        color: Color(0xff908D8D),
        fontSize: 11,
        fontFamily: 'inter_bo',
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class restType extends StatelessWidget {
  String type;
  String distance;
  String latitude;
  String longitude;
  List<Restaurants> restList;
  restType(
      {super.key,
      required this.type,
      required this.distance,
      required this.longitude,
      required this.restList,
      required this.latitude});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Image(
          image: AssetImage('assets/market.png'),
          height: 12,
          width: 13,
        ),
        const SizedBox(
          width: 2,
        ),
        Text(
          type,
          style: const TextStyle(
            fontFamily: 'inter_bo',
            fontSize: 10,
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        InkWell(
          onTap: () {
            Navigator.push(
                context,
                FadeRoute(
                    page: AllRestaurantLocation(
                      restList : restList,
                )));
          },
          child: const Icon(
            Icons.location_on_outlined,
            size: 11,
          ),
        ),
        Text(
          distance,
          style: const TextStyle(
            fontFamily: 'inter_bo',
            fontSize: 10,
          ),
        ),
      ],
    );
  }
}

class Ratings extends StatelessWidget {
  String ratings;
  String hmRatings;
  Ratings({super.key, required this.ratings, required this.hmRatings});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.star,
          color: Colors.amber,
          size: 15,
        ),
        Text(ratings),
        Text(hmRatings),
      ],
    );
  }
}
