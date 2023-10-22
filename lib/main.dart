// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider.dart';
import 'package:flutter_application_1/user_form.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) { //envolve toda a aplicaçao com o widget pra toda a aplicação poder receber valores desse widget
    return Provider(
      child: MaterialApp(
        title: 'Crud App', //nome navegador
        home: UserForm(),
        routes: {
          '/create':(_) => UserForm()
        },
      ),
    );
  }
}
