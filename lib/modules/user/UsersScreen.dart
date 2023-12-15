import 'dart:html';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../models/user/user_mode.dart';

class UsersScreen extends StatelessWidget {
 // const MyWidget({Key? key}) : super(key: key);
  List<UserModel> users=[
    UserModel(id: 1, name: 'mostafa adel', phone: '0100656502916'),
    UserModel(id: 2, name: 'mona adel', phone: '01004452916'),
    UserModel(id: 3, name: 'maha adel', phone: '01004502168456'),
    UserModel(id: 4, name: 'mohamed adel', phone: '01094402916'),
    UserModel(id: 5, name: 'mostafa adel', phone: '0100656502916'),
    UserModel(id: 6, name: 'mona adel', phone: '01004452916'),
    UserModel(id: 7, name: 'maha adel', phone: '01004502168456'),
    UserModel(id: 8, name: 'mohamed adel', phone: '01094402916'),
  
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users',
        
        ),
      ),
      body:
      ListView.separated(
        itemBuilder:(context, index) => buildUSerItem(users[index]), 
        separatorBuilder: (context, index) => Container(
          color: Colors.grey[300],
          width: double.infinity,
          height: 1,
          
        ),
        itemCount:users.length,
      
      ),
    );
  }
  Widget buildUSerItem(UserModel user)=>  Padding(
         padding: const EdgeInsets.all(20.0),
         child: Row(
          children: [
            CircleAvatar(
              radius: 25,
              child: 
              Text('${user.id}',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('${user.name}'),
                Text('${user.phone}',
                style: TextStyle(
                  color: Colors.grey[300],
                ),
                ),
              ],
            ),
          ], 
         ),
       );
}