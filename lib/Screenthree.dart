import 'package:flutter/material.dart';
import 'package:food_app/favorite_state/favorite_screen.dart';
import 'package:food_app/screen_three_des/bottom_sheet.dart';
import 'package:food_app/screen_three_des/res_product_deal.dart';
import 'package:food_app/screen_three_des/rest_food_catogary.dart';
import 'package:food_app/screen_three_des/rest_products.dart';

class Screenthree extends StatelessWidget {
  final String latitude;
  final String longitude;
  String restName;
  String restImage;
  String restAddress;
  Screenthree(
      {super.key,
      required this.latitude,
      required this.longitude,
      this.restAddress = 'Address',
      this.restImage = '',
      this.restName = 'Restaurant Name'});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                    borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(15),
                        bottomLeft: Radius.circular(15)),
                    child: Container(
                        height: 190,
                        width: double.infinity,
                        child: Image(
                          image: NetworkImage(
                              'https://foodie.junaidali.tk/storage/app/public/restaurant/cover/$restImage'),
                          fit: BoxFit.cover,
                        ))),
                Padding(
                  padding: const EdgeInsets.only(top: 30, right: 10, left: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          height: 25,
                          width: 25,
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.8),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10))),
                          child: const Icon(
                            Icons.arrow_back,
                            color: Color(0xffF97F35),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            height: 25,
                            width: 25,
                            decoration: BoxDecoration(
                                color: const Color(0xffC12026).withOpacity(0.5),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(5))),
                            child: const Icon(
                              Icons.add_alert_outlined,
                              size: 18,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            width: 7,
                          ),
                          Container(
                            height: 25,
                            width: 25,
                            decoration: BoxDecoration(
                                color: const Color(0xffC12026).withOpacity(0.5),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(5))),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const FavoriteScreen(),
                                    ));
                              },
                              child: const Icon(
                                Icons.shopping_cart_outlined,
                                size: 18,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Ramada Restaurant',
                        style: TextStyle(
                            color: Color(0xff36888A),
                            fontSize: 15,
                            fontFamily: 'inter_bo'),
                      ),
                      Text(
                        'Best restaurant in the town',
                        style: TextStyle(
                            color: Color(0xff908D8D),
                            fontSize: 11,
                            fontFamily: 'inter_bo'),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            'Restaurant',
                            style: TextStyle(
                                color: Colors.deepOrangeAccent,
                                fontSize: 10,
                                fontFamily: 'inter_bo'),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            '2.6 km',
                            style: TextStyle(
                                color: Colors.deepOrangeAccent,
                                fontSize: 10,
                                fontFamily: 'inter_bo'),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Spacer(),
                  Icon(
                    Icons.directions_bike_rounded,
                    color: Colors.deepOrangeAccent,
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 40,
                    ),
                    child: Icon(
                      Icons.info_outline,
                      color: Colors.deepOrangeAccent,
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(right: 55, left: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 20,
                              ),
                              SizedBox(
                                width: 2,
                              ),
                              Text(
                                '4.5',
                                style:
                                    TextStyle(color: Colors.deepOrangeAccent),
                              ),
                              Text(
                                '(21 ratings)',
                                style:
                                    TextStyle(color: Colors.deepOrangeAccent),
                              ),
                            ],
                          ),
                          Text(
                            'Rating',
                            style: TextStyle(color: Color(0xff717171)),
                          )
                        ],
                      ),
                    ],
                  ),
                  Image(image: AssetImage('assets/line.png')),
                  Column(
                    children: [
                      Text(
                        'Time',
                        style: TextStyle(color: Color(0xff717171)),
                      ),
                      Text(
                        '12 mins',
                        style: TextStyle(color: Colors.deepOrangeAccent),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Special Deals',
                      style: TextStyle(fontSize: 18, fontFamily: 'inter_bo')),
                ],
              ),
            ),
            const ResDeals(
                dealName: '4 Burgers with 1 Drink',
                dealImage: 'assets/4burgers.png',
                dealPrice: 'Rs 2999',
                gradient1: 0xffF67E34,
                gradient2: 0xffFBA775),
            const ResDeals(
                dealName: '4 Burgers with 1 Drink',
                dealImage: 'assets/4burgers.png',
                dealPrice: 'Rs 2999',
                gradient1: 0xff36888A,
                gradient2: 0xff74ADAE),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Popular Food',
                style: TextStyle(fontSize: 18, fontFamily: 'inter_bo'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 120, // Set a fixed height or adjust it as needed
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [
                    ResFoodCatogary(
                        name: 'Zinger Burger',
                        image: 'assets/burger4.png',
                        price: 'Rs 299'),
                    SizedBox(
                      width: 5,
                    ),
                    ResFoodCatogary(
                        name: 'Crispy Pizza',
                        image: 'assets/pizza2.png',
                        price: 'Rs 299'),
                    SizedBox(
                      width: 5,
                    ),
                    ResFoodCatogary(
                        name: 'Zinger Burger',
                        image: 'assets/burger4.png',
                        price: 'Rs 299'),
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Appetizers',
                style: TextStyle(
                    color: Colors.deepOrangeAccent,
                    fontSize: 18,
                    fontFamily: 'inter_bo'),
              ),
            ),
            const RestProduct(
                productName: 'Burger',
                productImage: 'assets/burger4.png',
                productRs: 'Rs 999',
                productSubTitle: 'Lorem Ipsum'),
            const SizedBox(
              height: 5,
            ),
            const RestProduct(
                productName: 'Sandwich',
                productImage: 'assets/saw1.png',
                productRs: 'Rs 999',
                productSubTitle: 'Lorem Ipsum'),
            const SizedBox(
              height: 5,
            ),
            const RestProduct(
                productName: 'Fries',
                productImage: 'assets/fries1.png',
                productRs: 'Rs 999',
                productSubTitle: 'Lorem Ipsum'),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Pizzas',
                style: TextStyle(
                    color: Colors.deepOrangeAccent,
                    fontSize: 18,
                    fontFamily: 'inter_bo'),
              ),
            ),
            const RestProduct(
                productName: 'Cheesy Pizza ',
                productImage: 'assets/pizza2.png',
                productRs: 'Rs 999',
                productSubTitle: 'Lorem Ipsum'),
            const SizedBox(
              height: 5,
            ),
            const RestProduct(
                productName: 'Fajita Pizza',
                productImage: 'assets/pizza2.png',
                productRs: 'Rs 999',
                productSubTitle: 'Lorem Ipsum'),
            const SizedBox(
              height: 5,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'BBQ',
                style: TextStyle(
                    color: Colors.deepOrangeAccent,
                    fontSize: 18,
                    fontFamily: 'inter_bo'),
              ),
            ),
            const RestProduct(
                productName: 'Kabab',
                productImage: 'assets/kebab1.png',
                productRs: 'Rs 999',
                productSubTitle: 'Lorem Ipsum'),
            const SizedBox(
              height: 5,
            ),
            const RestProduct(
                productName: 'Tikka',
                productImage: 'assets/tika1.png',
                productRs: 'Rs 999',
                productSubTitle: 'Lorem Ipsum'),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 40,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.deepOrangeAccent),
                child: BottomSheetExample(
                    restName: restName,
                    restImage: restImage,
                    restAddress: restAddress,
                    latitude: latitude,
                    longitude: longitude),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
