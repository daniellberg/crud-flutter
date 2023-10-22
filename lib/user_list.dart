import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider.dart';
import 'package:flutter_application_1/user.dart';

class UserList extends StatelessWidget {
  const UserList({super.key});

  @override
  Widget build(BuildContext context) {

    Provider provider = Provider.of(context) as Provider;

    //importa a lista users e define o tamanho
    List<User> users = provider.users;
    int usersLength = users.length;

    return Scaffold(
      appBar: AppBar(
        title: Text('Users'),
        leading: BackButton(
          onPressed: (){
            Navigator.popAndPushNamed(context, '/create');
          },
        ), 
      ),
      body: ListView.builder(
        itemCount: usersLength,
        itemBuilder: (BuildContext contextBuilder, indexBuilder) =>
          Container(
            child: ListTile(
              title: Text(users[indexBuilder].name),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                  onPressed: (){
                    Navigator.popAndPushNamed(context, '/create');
                  },
                   icon: Icon(Icons.edit)
                  )
                ],
              ),
            ),
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(
                width: 0.4,
                color: Colors.teal))
            ),
          )
        ),
    );
  }
}