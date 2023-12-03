import 'package:flutter/material.dart';
import 'package:food_app/animation/fade_anim.dart';
import 'package:food_app/constants/text_widget.dart';
import 'package:food_app/favorite_state/favorite_screen.dart';
import 'package:food_app/home_screen_items_des/food_delivery_opt.dart';
import 'package:food_app/home_screen_items_des/home_screen_rectangular.dart';
import 'package:food_app/home_screen_items_des/food_item_design.dart';
import 'package:food_app/home_screen_items_des/user_details_show.dart';
import 'package:food_app/user_profile/user_profile.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../create_login_main/tabs_main_screen.dart';
import '../home_screen_items_des/main_items_catagory.dart';

class HomeScreen extends StatelessWidget {
  String TextLogin;
  Color colorBox;
  HomeScreen({super.key, required this.TextLogin, required this.colorBox});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        width: 200,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                  child: CircleAvatar(
                      backgroundImage: AssetImage('assets/burger4.png'))),
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context, FadeRoute(page: const UserProfile()));
                    },
                    child: const ContainerForDrawer(
                        containerColor: Colors.white,
                        containerText: 'User Profile'),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  GestureDetector(
                    onTap: () {
                      LoginOrNot(context);
                    },
                    child: ContainerForDrawer(
                        containerColor: colorBox, containerText: TextLogin),
                  )
                ],
              )
            ],
          ),
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
              child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: constraints.maxHeight,
            ),
            // Search to Profile and cart
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    width: double.infinity,
                    height: 170,
                    decoration: const BoxDecoration(
                      color: Color(0xffF97F35),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15)),
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 20, left: 10, right: 10),
                      child: SafeArea(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Builder(
                                  builder: (context) => GestureDetector(
                                    onTap: () =>
                                        Scaffold.of(context).openDrawer(),
                                    child: const Image(
                                        image:
                                            AssetImage('assets/hamburger.png'),
                                        height: 24,
                                        fit: BoxFit.cover),
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                UserDetails(),
                                const Spacer(),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    GestureDetector(
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
                                        color: Colors.white,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 6,
                                    ),
                                    const Icon(
                                      Icons.notifications_outlined,
                                      color: Colors.white,
                                    )
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                              ),
                              child: TextFormField(
                                decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.all(0.9),
                                    hintText: 'What do you wish to eat?',
                                    fillColor: const Color(0xffF8F9FA),
                                    filled: true,
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Color(0xffE4E7EB)),
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Color(0xffE4E7EB)),
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    prefixIcon: Image.asset(
                                      'icons/search.png',
                                      height: 24,
                                      width: 24,
                                      color: Colors.black,
                                    )),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )),
                const SizedBox(
                  height: 10,
                ),
                // Scrolling view of the items in Rectangular
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Popular',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'inter_bo'),
                    )
                  ],
                ),

                //Ractangel design

                const SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 8,
                      ),
                      RectangleItem(
                          bcPath: 'assets/resharp.png',
                          imagePath: 'assets/icecream1.png',
                          productName: 'Fraise Cream',
                          productDescription:
                              'Strawberry Flavour Sweet Ice Cream',
                          productPrice: 'Rs 900',
                          boxcolor: Colors.white,
                          iconcolor: Colors.deepOrangeAccent,
                          txtcolor: Colors.white),
                      SizedBox(
                        width: 8,
                      ),
                      RectangleItem(
                          bcPath: 'assets/resharpW.png',
                          imagePath: 'assets/ice1.png',
                          productName: 'Mandarine',
                          productDescription: 'Caramel Flavour Sweet Ice Cream',
                          productPrice: 'Rs 900',
                          boxcolor: Color(0xff36888A),
                          iconcolor: Colors.white,
                          txtcolor: Color(0xff36888A)),
                      SizedBox(
                        width: 8,
                      ),
                      RectangleItem(
                          bcPath: 'assets/resharp.png',
                          imagePath: 'assets/icecream1.png',
                          productName: 'Fraise Cream',
                          productDescription:
                              'Strawberry Flavour Sweet Ice Cream',
                          productPrice: 'Rs 900',
                          boxcolor: Colors.white,
                          iconcolor: Colors.deepOrangeAccent,
                          txtcolor: Colors.white),
                      SizedBox(
                        width: 8,
                      ),
                      RectangleItem(
                          bcPath: 'assets/resharpW.png',
                          imagePath: 'assets/ice1.png',
                          productName: 'Mandarine',
                          productDescription: 'Caramel Flavour Sweet Ice Cream',
                          productPrice: 'Rs 900',
                          boxcolor: Color(0xff36888A),
                          iconcolor: Colors.white,
                          txtcolor: Color(0xff36888A)),
                      SizedBox(
                        width: 8,
                      ),
                    ],
                  ),
                ),
                const FoodDelivery(),
                //Three main category Rows of the Items
                Container(
                  height: 120,
                  padding: const EdgeInsets.all(8.0),
                  child: const Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment
                          .center, // Center the items horizontally
                      children: [
                        MainItems(
                          imagePath: 'assets/burger4.png',
                          productName: 'Dine In',
                        ),
                        SizedBox(width: 10),
                        MainItems(
                          imagePath: 'assets/pizza2.png',
                          productName: 'Dine In',
                        ),
                        SizedBox(width: 10),
                        MainItems(
                          imagePath: 'assets/gro1.png',
                          productName: 'Dine In',
                        ),
                      ],
                    ),
                  ),
                ),

                // all child items design

                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(
                        'Foods',
                        style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'inter_bo',
                            fontWeight: FontWeight.bold,
                            color: Color(0xff424040)),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      FoodsItems(
                          imagePath: 'assets/pizza2.png', productName: 'Pizza'),
                      SizedBox(
                        width: 5,
                      ),
                      FoodsItems(
                          imagePath: 'assets/burger4.png',
                          productName: 'Burger'),
                      SizedBox(
                        width: 5,
                      ),
                      FoodsItems(
                          imagePath: 'assets/saw1.png',
                          productName: 'Sandwich'),
                      SizedBox(
                        width: 5,
                      ),
                      FoodsItems(
                          imagePath: 'assets/roast1.png',
                          productName: 'Broast'),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      FoodsItems(
                          imagePath: 'assets/fries1.png', productName: 'Fries'),
                      SizedBox(
                        width: 5,
                      ),
                      FoodsItems(
                          imagePath: 'assets/shawarma1.png',
                          productName: 'Shawarma'),
                      SizedBox(
                        width: 5,
                      ),
                      FoodsItems(
                          imagePath: 'assets/kebab1.png', productName: 'Kabab'),
                      SizedBox(
                        width: 5,
                      ),
                      FoodsItems(
                          imagePath: 'assets/tika1.png', productName: 'Tikka'),
                    ],
                  ),
                )
              ],
            ),
          ));
        },
      ),
    );
  }

  void LoginOrNot(BuildContext context) async {
    var sharePrefs = await SharedPreferences.getInstance();
    var token = sharePrefs.getString('token');
    if (token!.isEmpty) {
      Navigator.pushReplacement(context, FadeRoute(page: const Tabs()));
    } else if (token != null) {
      sharePrefs.clear();
      Navigator.push(context, FadeRoute(page: const Tabs()));
    } else {
      print(token);
    }
  }
}
