import 'package:flutter/material.dart';

class ColorsList extends ChangeNotifier {

  List<String> allColors = [
    'Red',
    'Green',
    'Blue',
    'White',
    'Black',
    'Orange',
    'Yellow',
    'Brown',
  ];

  List<String> _filteredColors = [] ;
  ColorsList() {
    _filteredColors = List.from(allColors);
  }
  List<String> get filteredColors => _filteredColors;

  void filterColors(String query) {
    _filteredColors = allColors
        .where((color) => color.toLowerCase().contains(query.toLowerCase()))
        .toList();
    notifyListeners();
  }

}