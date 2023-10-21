import 'package:flutter/material.dart';
import 'package:flutter_application_1/field_form.dart';

class UserForm extends StatefulWidget {
  const UserForm({super.key});

  @override
  State<UserForm> createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {

TextEditingController controllerName = TextEditingController();
TextEditingController controllerEmail = TextEditingController();
TextEditingController controllerPass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          FieldForm(
            label: 'Name', 
            isPassword: false, 
            controller: controllerName
          ),
          FieldForm(
            label: 'Email', 
            isPassword: false, 
            controller: controllerEmail
          ),
          FieldForm(
            label: 'Password', 
            isPassword: true, 
            controller: controllerPass
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: SizedBox(
              width: 200.0,
              child: TextButton(onPressed:() {},
               child: Text('Salvar'),
               style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Theme.of(context).primaryColor),
                foregroundColor: MaterialStateProperty.all(Colors.white)
                ),
               ),
            ),
          ),
        ], //Children
      ),
    ); //faz a centralizacao do q ta dentro dele
  }
}