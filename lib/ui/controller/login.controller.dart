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

  bool validateField() {
    if (emailAddressController.text.isNotEmpty &&
        passwordController.text.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  bool loguinUC() {
    if (emailAddressController.text == "a@a.com" &&
        passwordController.text == "123456789") {
      return true;
    } else {
      return false;
    }
  }

  bool loguinUS(){
    if (emailAddressController.text == "user1@user.com" &&
        passwordController.text == "123456789") {
      return true;
    } else {
      return false;
    }
  }

  void clearFields() {
    emailAddressController.clear();
    passwordController.clear();
  }
}
