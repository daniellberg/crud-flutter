import 'package:flutter/material.dart';
import 'package:flutter_application_1/field_form.dart';
import 'package:flutter_application_1/provider.dart';
import 'package:flutter_application_1/user.dart';

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

    void saveUser(){
      Provider provider = Provider.of(context) as Provider;
    
    //instancia da classe user um usuario novo
      User user = User(
        name: controllerName.text,
        email: controllerEmail.text,
        password: controllerPass.text
      );    
      
      int usersLength = provider.users.length;

      //salva na lista users
      provider.users.insert(usersLength, user);

      Navigator.popAndPushNamed(context,'/read');

    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Create User'),
        actions: [
          Container(
            child: TextButton(
              child: Text('View list'),
              onPressed: (){
                Navigator.popAndPushNamed(context, '/read');
              },
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            margin: EdgeInsets.all(8),
          )
        ],
      ),
      body: Center(
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
                child: TextButton(onPressed: saveUser,
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
      ),
    ); //faz a centralizacao do q ta dentro dele
  }
}