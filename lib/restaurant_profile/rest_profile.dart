import 'package:flutter/material.dart';
import 'package:food_app/models/restaurants.dart';
import 'package:food_app/restaurant_profile/rest_profile_des.dart';

class RestProfile extends StatelessWidget {
  String profile;
  String name;
  String description;
  String type;
  String distance;
  String hmRatings;
  String ratings;
  String restName;
  String restAddress;
  String restImage;
  String latitude;
  String longitude;
  List<Restaurants> restList;
  RestProfile(
      {super.key,
      required this.profile,
      required this.name,
      required this.description,
      required this.type,
      required this.hmRatings,
      required this.ratings,
      required this.restAddress,
      required this.restImage,
      required this.restName,
      required this.latitude,
      required this.longitude,
      required this.restList,
      required this.distance});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProfilePicture(
              profile: profile,
              latitude: latitude,
              longitide: longitude,
              restName: restName,
              restImage: restImage,
              restAddress: restAddress,
            ),
            ProfileName(name: name),
            ProfileDescription(description: description),
            const SizedBox(
              height: 3,
            ),
            Row(
              children: [
                restType(
                  restList: restList,
                    type: type,
                    distance: distance,
                    latitude: latitude,
                    longitude: longitude),
                const Spacer(),
                Row(
                  children: [Ratings(ratings: ratings, hmRatings: hmRatings)],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
