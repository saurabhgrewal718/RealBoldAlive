import 'package:BoldAlive/screens/atoms/head_of_app.dart';
import 'package:flutter/material.dart';
import 'package:chips_choice/chips_choice.dart';

import '../tile2.dart';

class Phone extends StatefulWidget {
 static const routeName= './phone';

  @override
  _PhoneState createState() => _PhoneState();
}

class _PhoneState extends State<Phone> {
  final _formKey = GlobalKey<FormState>();
   bool _selected = false;
   int tag = 1;
   List<String> options = [
     'News', 'Entertainment', 'Politics',
     'Automotive', 'Sports', 'Education',
     'Fashion', 'Travel', 'Food', 'Tech',
     'Science',
   ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: 
          Column(
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
                      ChoiceChip(
                        selected: _selected,
                        label: Text('Woolha'),
                        avatar: Text('W'),
                        elevation: 10,
                        pressElevation: 5,
                        shadowColor: Colors.teal,
                        onSelected: (bool selected) {
                          print('Fluter is pressed');
                      
                          setState(() {
                            _selected = !_selected;
                          });
                        }
                      ),                                            
                      DropdownButton(items: null, onChanged: null),

                      // ChipsChoice<T>.single
                      ChipsChoice<int>.single(
                        value: tag,
                        options: ChipsChoiceOption.listFrom<int, String>(
                          source: options,
                          value: (i, v) => i,
                          label: (i, v) => v,
                        ),
                        onChanged: (val) => setState(() => tag = val),
                      
                      ),

                    ],
                  ),
                )
                
              ),
            ],
          ),
          
    );
  }
}

