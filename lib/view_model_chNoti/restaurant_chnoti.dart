import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:food_app/app_apis/app_apis.dart';
import 'package:food_app/models/restaurants.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class RestaurantProvider with ChangeNotifier {

  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }
  // restaurant data saved in restaurant model Class
  restaurants _Restaurant = restaurants();
  restaurants get Restaurants => _Restaurant;
  setRestaurantList(String restaurant) {
    _Restaurant = restaurants.fromJson(jsonDecode(restaurant));
    notifyListeners();
  }
  // access the restaurant data f
  Future<void> restaurantList() async {
    // Set loading to true before making the API request.
    setLoading(true);
    SharedPreferences sharePrefs = await SharedPreferences.getInstance();
    final token = sharePrefs.getString('token');
    try {
      final Uri uri = Uri.parse(AppUrl.restaurantList);
      final response = await http.get(uri, headers: {
        'Accept': 'Application/json',
        'Authorization': 'Bearer $token',
        'zoneId': "[1]"
      });

      if (response.statusCode == 200) {
        final restResponse = response.body;
        setRestaurantList(restResponse);
        print(response.body);
      }
    } catch (e) {
      print(e.toString());
      // Handle error if needed
    } finally {
      // Set loading to false after API request is complete.
      setLoading(false);
    }
  }
}
