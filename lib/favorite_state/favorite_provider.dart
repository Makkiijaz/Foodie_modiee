import 'package:flutter/foundation.dart';

class FavoriteProvider with ChangeNotifier{
  final List<int> _selectedRes = [];
  List<int> get selectedRes  => _selectedRes;

  void SelectedRest(int value){
   _selectedRes.add(value);
   notifyListeners();
  }

  void RemoveItem(int value){
   _selectedRes.remove(value);
   notifyListeners();
  }
}