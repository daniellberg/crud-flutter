import 'package:flutter/material.dart';
import 'package:flutter_application_1/field_form.dart';
import 'package:flutter_application_1/provider.dart';

class UserView extends StatelessWidget {
  UserView({super.key});

  String title = 'Show User';

  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Provider provider = Provider.of(context) as Provider;

    int? index;

    if (provider.indexUser != null) {
      index = provider.indexUser;
      controllerName.text = provider.userSelected!.name;
      controllerEmail.text = provider.userSelected!.email;
      controllerPass.text = provider.userSelected!.password;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
        centerTitle: true,
        actions: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            margin: EdgeInsets.all(8),
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            FieldForm(
              label: 'Name',
              isPassword: false,
              controller: controllerName,
              isForm: false,
            ),
            FieldForm(
              label: 'Email',
              isPassword: false,
              controller: controllerEmail,
              isForm: false,
            ),
            FieldForm(
              label: 'Password',
              isPassword: true,
              controller: controllerPass,
              isForm: false,
            ),
            SizedBox(height: 20), // Adicionei um espaço entre os campos e os botões
            Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(40),
              ),
              width: MediaQuery.of(context).size.width * 0.9,
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround, // Centraliza os botões horizontalmente
                    children: [
                      // View users button
                      SizedBox(
                        width: 150.0,
                        child: TextButton(
                          onPressed: () {
                            Navigator.popAndPushNamed(context, '/read');
                          },
                          child: Text('View all users'),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Theme.of(context).primaryColor),
                            foregroundColor: MaterialStateProperty.all(Colors.white),
                          ),
                        ),
                      ),

                      // Create new user button
                      SizedBox(
                        width: 150.0,
                        child: TextButton(
                          onPressed: () {
                            Navigator.popAndPushNamed(context, '/create');
                          },
                          child: Text('Create new user'),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Theme.of(context).primaryColor),
                            foregroundColor: MaterialStateProperty.all(Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 150.0,
                    child: TextButton(
                      onPressed: () {
                        // Adicione a lógica para o novo botão aqui
                      },
                      child: Text('Novo Botão'),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Theme.of(context).primaryColor),
                        foregroundColor: MaterialStateProperty.all(Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
