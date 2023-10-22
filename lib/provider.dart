import 'package:flutter/material.dart';
import 'package:flutter_application_1/user.dart';

class Provider extends InheritedWidget {

  final Widget child;
  List<User> users = [];
  User? userSelected;
  int? indexUser;

  Provider(
    {
      required this.child
      }
    ) : super(child: child);
  
  static Provider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Provider>();
  }

  @override
  bool updateShouldNotify(Provider oldWidget) {
    return true;
  }
}