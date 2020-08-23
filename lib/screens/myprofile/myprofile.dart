import 'package:BoldAlive/screens/myprofile/profileinfo.dart';
import 'package:flutter/material.dart';

class MyProfile extends StatefulWidget {
  static const routeName = './myprofile';
  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      leading: IconButton(icon: Icon(Icons.arrow_back),color:Colors.black45, onPressed: (){
        Navigator.of(context).pop();
      }),
      title: Text('My Profile', style: Theme.of(context)
                  .textTheme
                  .headline5
                  .copyWith(fontWeight: FontWeight.bold),),
    ),
      body: ProfileInfo(),
    );
  }
}

