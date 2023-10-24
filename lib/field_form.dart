import 'dart:io';

import 'package:flutter/material.dart';

class FieldForm extends StatelessWidget {
  String label;
  bool isPassword;
  TextEditingController controller; //usado p pegar dados do form
  bool? isForm = true;
  bool isEmail = false;
  
  FieldForm({
    required this.label,
    required this.isPassword,
    required this.controller,
    this.isForm,
    required this.isEmail,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField( //widget usado pra campos de formulario
      obscureText: isPassword,
      validator: (value){
        if(value!.length<5){
          return 'Digite pelo menos 5 caractéres';
        }
        if(this.isEmail && !value.contains('@')){
          return 'Digite o email corretamente';
        }
      },
      controller: controller,
      enabled: isForm,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        labelText: label
      ),
    );
  }
}