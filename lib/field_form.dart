import 'dart:io';

import 'package:flutter/material.dart';

class FieldForm extends StatelessWidget {
  String label;
  bool isPassword;
  TextEditingController controller; //usado p pegar dados do form
  
  FieldForm({
    required this.label,
    required this.isPassword,
    required this.controller,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField( //widget usado pra campos de formulario
      obscureText: isPassword,
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        labelText: label
      ),
    );
  }
}