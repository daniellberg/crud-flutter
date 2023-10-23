// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider.dart';
import 'package:flutter_application_1/user_form.dart';
import 'package:flutter_application_1/user_list.dart';
import 'package:flutter_application_1/user_view.dart';

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
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.cyan
        ),
        routes: {
          '/create':(_) => UserForm(),
          '/read':(_) => UserList(),
          '/view':(_) => UserView(),
        },
      ),
    );
  }
}
