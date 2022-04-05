import 'package:flutter/material.dart';

class RegisterProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String nombre = '';
  String email = '';
  String password = '';

  validateForm() {
    if (formKey.currentState!.validate()) {
      print('Form valid... login');

      print('$nombre = $email = $password');

      return true;
    }
    print('Form not valid');
    return false;
  }
}
