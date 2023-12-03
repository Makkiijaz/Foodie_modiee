import 'package:flutter/material.dart';
import 'package:food_app/favorite_state/favorite_screen.dart';
import 'package:food_app/get_started/skeleton_loading.dart';
import 'package:food_app/restaurant_profile/rest_profile.dart';
import 'package:food_app/view_model_chNoti/restaurant_chnoti.dart';
import 'package:provider/provider.dart';

class Screentwo extends StatefulWidget {
  const Screentwo({super.key});

  @override
  State<Screentwo> createState() => _ScreentwoState();
}

class _ScreentwoState extends State<Screentwo> {
  @override
  void initState() {
    Provider.of<RestaurantProvider>(context, listen: false).restaurantList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var restProvider = Provider.of<RestaurantProvider>(context);
    final restaurant = restProvider.Restaurants.response?.restaurants;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0xffF97F35),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
            ),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 37,
                      width: 320, // Set the desired height
                      child: TextFormField(
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(0.9),
                          hintText: 'Search Restaurant',
                          fillColor: const Color(0xffF8F9FA),
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xffE4E7EB),
                            ),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xffE4E7EB),
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          prefixIcon: Image.asset(
                            'icons/search.png',
                            height: 24,
                            width: 24,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const FavoriteScreen(),
                      ),
                    );
                  },
                  child: const Icon(
                    Icons.shopping_cart_outlined,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  width: 6,
                ),
                const Icon(
                  Icons.notifications_outlined,
                  color: Colors.white,
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                  'Restaurants',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'inter_bo',
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SizedBox(
                height: 200,
                width: double.infinity,
                child: RestaurantProvider().loading
                    ? const Center(child: Text('No Restaurant Available'))
                    : restaurant != null
                        ? ListView.builder(
                            itemCount: restaurant.length,
                            itemBuilder: (BuildContext context, int index) {
                              var restaurantData = restaurant[index];
                              var restList = restaurant;
                              var latitude = restaurantData.latitude;
                              var longitude = restaurantData.longitude;
                              return Column(
                                children: [
                                  RestProfile(
                                    profile:
                                        'https://foodie.junaidali.tk/storage/app/public/restaurant/cover/${restaurantData.coverPhoto}',
                                    name: restaurantData.name ?? '',
                                    description: restaurantData.address ?? '',
                                    type:
                                        restaurantData.businessType!.type ?? '',
                                    distance: '7.6Km',
                                    ratings: restaurantData.avgRating ?? '',
                                    hmRatings:
                                        restaurantData.ratingCount.toString(),
                                    latitude: latitude.toString(),
                                    longitude: longitude.toString(),
                                    restAddress: restaurantData.address!,
                                    restImage: restaurantData.coverPhoto!,
                                    restName: restaurantData.name!,
                                    restList: restList,
                                  ),
                                ],
                              );
                            },
                          )
                        : ListView.builder(
                            itemCount: 5,
                            itemBuilder: (context, index) {
                              return const SkeletonCard();
                            },
                          )
            ),
          )
        ],
      ),
    );
  }
}
