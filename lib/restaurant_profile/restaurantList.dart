// import 'package:flutter/material.dart';
// import 'package:food_app/models/restaurants.dart';
// import 'package:provider/provider.dart';
// import 'package:food_app/view_model_chNoti/restaurant_chnoti.dart';
//
// class YourWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // Access the RestaurantProvider
//     var restProvider = Provider.of<RestaurantProvider>(context);
//
//     // Call the restaurantList method to fetch the list
//     restProvider.restaurantList();
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Restaurant List'),
//       ),
//       body: Consumer<RestaurantProvider>(
//         builder: (context, restaurantProvider, child) {
//           if (restaurantProvider.Restaurants.response != null) {
//             // Access the list of restaurants
//             final List<Restaurants> restaurantList =
//                 restaurantProvider.Restaurants.response!.restaurants ?? [];
//
//             // Now you can use restaurantList to display restaurant data
//             // For example, you can use ListView.builder to display each restaurant
//             return ListView.builder(
//               itemCount: restaurantList.length,
//               itemBuilder: (context, index) {
//                 final restaurant = restaurantList[index];
//                 return ListTile(
//                   title: Text(restaurant.coverPhoto ?? ''),
//                   subtitle: Text(restaurant.latitude ?? ''),
//                   // Add more widgets to display other restaurant information
//                 );
//               },
//             );
//           } else {
//             // Handle the case when the restaurant list is not available
//             return Center(child: CircularProgressIndicator());
//           }
//         },
//       ),
//     );
//   }
// }
