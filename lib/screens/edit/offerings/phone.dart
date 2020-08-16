import 'package:BoldAlive/screens/atoms/head_of_app.dart';
import 'package:flutter/material.dart';

import '../tile2.dart';

class Phone extends StatelessWidget {
 static const routeName= './phone';
 final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Headofapp(title: 'Bold Alive',subtitle: 'Select any',),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.83,
                child:Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      TextFormField(),
                      
                      DropdownButton(items: null, onChanged: null),
                      
                    ],
                  ),
                )
                
              ),
            ],
          ),
    );
  }
}
