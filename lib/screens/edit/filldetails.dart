import 'package:flutter/material.dart';

class FillDetails extends StatefulWidget {
  static const routeName = './filldetails';
  @override
  _FillDetailsState createState() => _FillDetailsState();
}

class _FillDetailsState extends State<FillDetails> {
  var _isLoading = false;
  final _pass = FocusNode();
  final _form = GlobalKey<FormState>();
  String _email='';
  String _password = '';
  List<dynamic> myList;
  List<String> myNewList;

   @override
  void dispose() {
    _pass.dispose();
    super.dispose();
  }

  
  void _saveForm() async{    
    final isValid = _form.currentState.validate();
    FocusScope.of(context).unfocus();
    if(isValid){  
      _form.currentState.save();
      print(_form.currentState);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: SingleChildScrollView(
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
                            Text('Email', style: TextStyle(
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
                              textInputAction: TextInputAction.next,
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
                                FocusScope.of(context).requestFocus(_pass);
                              },
                              onSaved: (value){
                                _email=value;
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
                            Text('Password', style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Colors.black87
                            ),),
                            SizedBox(height: 5,),
                            TextFormField(
                              validator: (value){
                                if(value.isEmpty || value.length<6){
                                  return "Enter atleast 6 Characters";
                                }
                                return null;
                              },
                              focusNode: _pass,
                              textInputAction: TextInputAction.done,
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
                                FocusScope.of(context).unfocus();
                              },
                              onSaved: (value){
                                _password=value;
                              },
                            ),
                            SizedBox(height: 60,),
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
                          child: Text("Login", style: TextStyle(
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
        ),
    );
  }
}


