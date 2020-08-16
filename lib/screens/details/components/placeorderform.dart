import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PlaceorderForm extends StatefulWidget {
  @override
  _PlaceorderFormState createState() => _PlaceorderFormState();
}

class _PlaceorderFormState extends State<PlaceorderForm> {
  var _isLoading = false;
  final _ad1 = FocusNode();
  final _ad2 = FocusNode();
  final _ad3 = FocusNode();
  final _ad4 = FocusNode();
  final _form = GlobalKey<FormState>();
  String _add1='';
  String _add2='';
  String _add3='';
  String _add4='';
  String _phone='';
  

  @override
  void dispose() {
    _ad1.dispose();
    _ad2.dispose();
    _ad3.dispose();
    _ad4.dispose();
    super.dispose();
  }

  
  void _saveForm() async{
        
    final isValid = _form.currentState.validate();
    FocusScope.of(context).unfocus();
    if(isValid){
      setState(() {
        _isLoading= true;
      });
      _form.currentState.save();
      
      print(_add1);
      print(_add2);
      print(_add3);      
      print(_add4);
      print(_phone);

      setState(() {
        _isLoading= false;
      });   
    }
  }



  @override
  Widget build(BuildContext context) {
      return SingleChildScrollView(
        child: Form(
                key: _form,
                child: Container(
                padding: EdgeInsets.symmetric(horizontal: 40),
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        
                        SizedBox(height: 30,),
                        
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                width: MediaQuery.of(context).size.width * 0.4,
                                child: Text('Adress Lane', style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black87
                                ),),
                              ),
                              SizedBox(height: 5,),
                              TextFormField(
                                validator: (value){
                                  if(value.isEmpty || value.length <10){
                                    return "Invalid Input";
                                  }
                                  return null;
                                },
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey[400])
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey[400])
                                  ),
                                ),
                                onFieldSubmitted: (_){
                                  FocusScope.of(context).requestFocus(_ad1);
                                },
                                onSaved: (value){
                                  _add1=value;
                                },
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.4,
                                child: Text('Adress Lane 2', style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black87
                                ),),
                              ),
                              SizedBox(height: 5,),
                              TextFormField(
                                validator: (value){
                                  if(value.isEmpty || value.length <10){
                                    return "Invalid Input";
                                  }
                                  return null;
                                },
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey[400])
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey[400])
                                  ),
                                ),
                                focusNode: _ad1,
                                onFieldSubmitted: (_){
                                  FocusScope.of(context).requestFocus(_ad2);
                                },
                                onSaved: (value){
                                  _add2=value;
                                },
                              ),
                              
                              SizedBox(height: 30,),
                            ],
                          ),
                        ),
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text('Adress lane 3', style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Colors.black87
                              ),),
                              SizedBox(height: 5,),
                              TextFormField(
                                validator: (value){
                                  if(value.isEmpty || !value.contains('@') || !value.contains('.com') || value.length <10){
                                    return "Enter valid Email";
                                  }
                                  return null;
                                },
                                focusNode: _ad2,
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey[400])
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey[400])
                                  ),
                                ),
                                onFieldSubmitted: (_){
                                  FocusScope.of(context).requestFocus(_ad3);
                                },
                                onSaved: (value){
                                  _add3=value;
                                },
                              ),
                              SizedBox(height: 30,),
                            ],
                          ),
                        ),
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text('Adress lane 4', style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Colors.black87
                              ),),
                              SizedBox(height: 5,),
                              TextFormField(
                                validator: (value){
                                  if(value.isEmpty || value.length <10){
                                    return "Enter valid Adress";
                                  }
                                  return null;
                                },
                                focusNode: _ad3,
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey[400])
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey[400])
                                  ),
                                ),
                                onFieldSubmitted: (_){
                                  FocusScope.of(context).requestFocus(_ad4);
                                },
                                onSaved: (value){
                                  _add4=value;
                                },
                              ),
                              SizedBox(height: 30,),
                            ],
                          ),
                        ),
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text('Phone Number', style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Colors.black87
                              ),),
                              SizedBox(height: 5,),
                              TextFormField(
                                validator: (value){
                                  if(value.isEmpty || value.length <10){
                                    return "Enter valid Email";
                                  }
                                  return null;
                                },
                                textInputAction: TextInputAction.done,
                                keyboardType: TextInputType.number,
                                focusNode: _ad4,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey[400])
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey[400])
                                  ),
                                ),
                                
                                onSaved: (value){
                                  _phone=value;
                                },
                              ),
                              SizedBox(height: 30,),
                            ],
                          ),
                        ),
                        
                        _isLoading ? Center(child:CircularProgressIndicator(backgroundColor: Colors.greenAccent)) :
                        Container(
                          padding: EdgeInsets.only(top: 3, left: 3),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border: Border(
                              bottom: BorderSide(color: Colors.black),
                              top: BorderSide(color: Colors.black),
                              left: BorderSide(color: Colors.black),
                              right: BorderSide(color: Colors.black),
                            )
                          ),
                          child: MaterialButton(
                            minWidth: double.infinity,
                            height: 60,
                            onPressed: () {
                                _saveForm();
                                
                            },
                            color: Colors.greenAccent,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)
                            ),
                            child: Text("Make Payment", style: TextStyle(
                              fontWeight: FontWeight.w600, 
                              fontSize: 18
                            ),),
                          ),
                        ),           
                       ],
                    ),
                  ],
                ),
              ),
        ),
      );
  }
}





