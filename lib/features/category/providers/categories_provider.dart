import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/category/pages/categories.dart';
import 'package:flutter_application_1/features/core/enum.dart';

class CategoriesProvider with ChangeNotifier {
  final _firebaseStore = FirebaseFirestore.instance;
  StatusUtils _statusUtils = StatusUtils.idle;
  StatusUtils get statusUtils => _statusUtils;
  List<Map<String, dynamic>> _categoriesList = [];
  List<Map<String, dynamic>> get categoriesList => _categoriesList;

  String? errorMessage;

  Future<void> addCategories(Categories categories) async {
    _statusUtils = StatusUtils.loading;
    notifyListeners();

    try {
      await _firebaseStore.collection("addCategory").add(categories.toJson());
      _statusUtils = StatusUtils.sucess;
      notifyListeners();
    } catch (e) {
      errorMessage = e.toString();
      _statusUtils = StatusUtils.error;
      notifyListeners();
    }
  }

  Future<void> fetchcourses() async {
    _statusUtils = StatusUtils.loading;
    try {
      final snapshot = await _firebaseStore.collection("addCategories").get();
      _categoriesList = snapshot.docs
          .map((category) => {'id': category.id, ...category.data()})
          .toList();
      _statusUtils = StatusUtils.sucess;
      notifyListeners();
    } catch (e) {
      errorMessage = e.toString();
      _statusUtils = StatusUtils.error;
      notifyListeners();
    }
  }
}
