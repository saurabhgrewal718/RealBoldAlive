import 'package:BoldAlive/screens/myprofile/myprofile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddAddress extends StatefulWidget {
  static const routeName = '/addaddress';
  @override
  _AddAddressState createState() => _AddAddressState();
}

class _AddAddressState extends State<AddAddress> {
  final _form = GlobalKey<FormState>();
  bool _isLoading = false;
  String _add1 = '';
  String _add2 = '';
  String _city = '';
  String _state = '';


  void _saveForm(BuildContext ctx) async{
    
    final isValid = _form.currentState.validate();
    FocusScope.of(ctx).unfocus();
    if(isValid){
      setState(() {
      _isLoading = true;
    });
      _form.currentState.save();
     
     try{
        //saving the data in the users     
        //saving the is in the internal storage
        final prefs = await SharedPreferences.getInstance();
        final userId = prefs.getString('userId');
        await Firestore.instance.collection('users').document(userId).updateData({
          'address1':_add1,
          'address2':_add2,
          'city':_city,
          'state':_state
        });

        //showing congratulatory Snackbar on sucesful signup
        Scaffold.of(ctx).hideCurrentSnackBar();
        Scaffold.of(ctx).showSnackBar(SnackBar(
            backgroundColor: Colors.greenAccent,
            duration: Duration(seconds: 1),
            content: Text('Address Added',
            style: GoogleFonts.openSans(
              textStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w600)),
            ),
          ));
        //redirecting to a new page
        Navigator.of(ctx).pushReplacementNamed(MyProfile.routeName);
        setState(() {
          _isLoading = false;
        });


      }on PlatformException catch(err){
        //shwoing errpor messages
        var message= "An error occured ! PLease check Your Credentials";
        if(err.message != null){
          message= err.message;
        }
        setState(() {
          _isLoading = false;
        });
        Scaffold.of(ctx).showSnackBar(SnackBar(
          backgroundColor: Colors.redAccent,
          content: Text(message ,
          style: GoogleFonts.openSans(
            textStyle: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w600)),
          ),
        ));

      }catch(err){
        setState(() {
          _isLoading = false;
        });
        print(err);

      }

    }

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: SingleChildScrollView(
          child: Form(
              key: _form,
              child: Container(
              padding: EdgeInsets.symmetric(horizontal: 0),
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
                            Text('Address lane 1', style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Colors.black87
                            ),),
                            SizedBox(height: 5,),
                            TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              validator: (value){
                                if(value.isEmpty || value.length <5){
                                  return "Enter valid address";
                                }
                                return null;
                              },
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
                              
                              onSaved: (value){
                                _add1=value;
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
                            Text('Landmark', style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Colors.black87
                            ),),
                            SizedBox(height: 5,),
                            TextFormField(
                              validator: (value){
                                if(value.isEmpty || value.length <4){
                                  return "Enter a Landmark or Address Lane 2";
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
                            Text('City', style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Colors.black87
                            ),),
                            SizedBox(height: 5,),
                            TextFormField(
                              validator: (value){
                                if(value.isEmpty || value.length<4){
                                  return "Enter Your City Name";
                                }
                                return null;
                              },
                              obscureText: true,
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
                              
                              onSaved: (value){
                                _city=value;
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
                            Text('State', style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Colors.black87
                            ),),
                            SizedBox(height: 5,),
                            TextFormField(
                              validator: (value){
                                if(value.isEmpty || value.length<6){
                                  return "Enter your state";
                                }
                                return null;
                              },
                              obscureText: true,
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
                                _state = value;
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
                              _saveForm(context);
                          },
                          color: Colors.greenAccent,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)
                          ),
                          child: Text("Add Address", style: TextStyle(
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






