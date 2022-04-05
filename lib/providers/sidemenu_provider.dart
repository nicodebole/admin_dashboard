import 'package:flutter/material.dart';

class SidemenuProvider extends ChangeNotifier {
  static late AnimationController menuController;
  static bool isOpened = false;

  String _currentPage = '';

  String get currentPage {
    return _currentPage;
  }

  void setCurrentPageUrl(String routeName) {
    _currentPage = routeName;
    Future.delayed(Duration(milliseconds: 100), () {
      notifyListeners();
    });
  }

  static Animation<double> movement = Tween<double>(begin: -200, end: 0)
      .animate(
          CurvedAnimation(parent: menuController, curve: Curves.easeInOut));

  static Animation<double> opacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: menuController, curve: Curves.easeInOut));

  static void openMenu() {
    isOpened = true;
    menuController.forward();
  }

  static void closeMenu() {
    isOpened = false;
    menuController.reverse();
  }
}
