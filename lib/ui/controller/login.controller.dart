import 'package:flutter/material.dart';

class LoginController with ChangeNotifier {
  TextEditingController emailAddressController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool passwordVisibility = false;

  void togglePasswordVisibility() {
    passwordVisibility = !passwordVisibility;
    notifyListeners();
  }

  void disposeControllers() {
    emailAddressController.dispose();
    passwordController.dispose();
  }
}

