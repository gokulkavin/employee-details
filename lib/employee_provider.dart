import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class EmployeProvider extends ChangeNotifier {
  final List<Map<String, dynamic>> _items = [];
  final _detailBox = Hive.box('details_box');

  List<Map<String, dynamic>> get items => _items;

  List showItems() {
    return _detailBox.keys.map((key) {
      final item = _detailBox.get(key);
      return {
        'key': key,
        'name': item['name'],
        'email': item['email'],
        'age': item['age'],
        'designation': item['designation'],
        'date': item['date'],
        'password': item['password']
      };
    }).toList();
  }

  Future<void> createItem(Map<String, dynamic> newItem) async {
    await _detailBox.add(newItem);
    showItems();
  }
}
