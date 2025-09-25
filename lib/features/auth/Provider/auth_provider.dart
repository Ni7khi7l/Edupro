import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/core/enum.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider with ChangeNotifier {
  StatusUtils _statusUtils = StatusUtils.idle;
  StatusUtils get statusUtils => _statusUtils;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseAuth get auth => _auth;

  String? errorMessage;
  bool _isLoggedin = false;
  bool get isLoggedin => _isLoggedin;

  bool isClicked = false;

  List<Map<String, dynamic>> _cateogoriesList = [];
  List<Map<String, dynamic>> get categoriesList => _cateogoriesList;

  AuthProvider() {
    Future.microtask(() {
      checkedLoggedInStatus();
    });
  }
  Future<void> checkedLoggedInStatus() async {
    final prefs = await SharedPreferences.getInstance();
    _isLoggedin = prefs.getBool('isLoggedin') ?? false;
    prefs.getBool('isLoggedin') ?? false;
    notifyListeners();
  }

  Future<void> signup(String email, String password) async {
    _statusUtils = StatusUtils.loading;
    notifyListeners();

    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      _statusUtils = StatusUtils.sucess;
    } catch (e) {
      errorMessage = e.toString();
      _statusUtils = StatusUtils.error;
      notifyListeners();
    }
  }

  Future<void> signin(String email, String password) async {
    _statusUtils = StatusUtils.loading;
    notifyListeners();

    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isLoggedin', true);
      _isLoggedin = true;

      _statusUtils = StatusUtils.sucess;
      notifyListeners();
    } catch (e) {
      errorMessage = e.toString();
      _statusUtils = StatusUtils.error;
      notifyListeners();
    }
  }

  Future<void> logout() async {
    _auth.signOut();
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('isLoggedin');
    await prefs.setBool('isLoggedin', false);
    _statusUtils = StatusUtils.idle;
    _isLoggedin = false;
    notifyListeners();
  }
}
