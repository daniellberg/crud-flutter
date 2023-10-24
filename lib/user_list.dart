import 'package:flutter/material.dart';
import 'package:flutter_application_1/container_all.dart';
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
        title: Text('Users', 
          style: TextStyle(
            fontSize: 50,
            fontFamily: 'Strange', 
            color: Color.fromRGBO(167, 210, 201, 1),
          ),
        ),
       
        centerTitle: true,
        backgroundColor: Color.fromRGBO(221, 61, 49, 1),
        leading: BackButton(
          onPressed: (){
            provider.indexUser = null;
            Navigator.popAndPushNamed(context, '/create');
          },
        ), 
      ),
      body: ContainerAll(
        child: ListView.builder(
          itemCount: usersLength,
          itemBuilder: (BuildContext contextBuilder, indexBuilder) =>
            Container(
              // ignore: sort_child_properties_last
              child: ListTile(
                title: Text(users[indexBuilder].name),
                subtitle: Text(users[indexBuilder].email),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    //edit button
                    IconButton(
                    onPressed: (){
                      provider.userSelected = users[indexBuilder];
                      provider.indexUser = indexBuilder;
                      Navigator.popAndPushNamed(context, '/create');
                    },
                     icon: Icon(Icons.edit)
                    ),
                    //view user button
                    IconButton(
                    onPressed: (){
                      provider.userSelected = users[indexBuilder];
                      provider.indexUser = indexBuilder;
                      Navigator.popAndPushNamed(context, '/view');
                    },
                     icon: Icon(Icons.remove_red_eye_outlined)
                    ), //dele user button
                    IconButton(
                    onPressed: (){
                      provider.indexUser = null;
                      provider.users.removeAt(indexBuilder);
                      Navigator.popAndPushNamed(context, '/read');
                    },
                     icon: Icon(Icons.person_remove_outlined)
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
      ),
    );
  }
}