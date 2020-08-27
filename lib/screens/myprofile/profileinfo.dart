import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileInfo extends StatefulWidget {

  @override
  _ProfileInfoState createState() => _ProfileInfoState();
}

class _ProfileInfoState extends State<ProfileInfo> {

  String name = '';
  String userId = '';
  String gender = '';
  String course = '';
  String picture = '';
  String age = '';
  String phone = '';
  String hno = '';  
  String landmark = '';
  String city = '';  
  final _form = GlobalKey<FormState>();


  @override
  void didChangeDependencies() async{
    final prefs = await SharedPreferences.getInstance(); 
      
      setState(() {
        userId = prefs.getString('userId');
        picture = 'https://i.pinimg.com/originals/cd/a8/ff/cda8ff1bcb7f335719b146d61f6f494a.png';
        gender = 'Male';
        name = 'Saurabh Grewal';
      });
     
    super.didChangeDependencies();
  }

void _showAlert(BuildContext context,String question,int id) {
    showModalBottomSheet(
        isScrollControlled:true,
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: MediaQuery.of(context).size.height *0.9,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.0),
                topRight: Radius.circular(16.0),
              ),
              color: Colors.white,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(height: 30,),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text('$question',textAlign: TextAlign.center, style: TextStyle(
                      fontWeight: FontWeight.w900, 
                      fontSize: 18,
                      color: Colors.black
                    ),),
                  ),
                ),
                // forms 
                Container(
                  child: 
                  Form(
                  key: _form,
                  child: Container(
                  padding: EdgeInsets.symmetric(horizontal:5),
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          SizedBox(height: 30,),
                          id == 1 ?
                          Container(
                            width: MediaQuery.of(context).size.width*0.8,
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
                                      return "Enter valid Phone Number";
                                    }
                                    return null;
                                  },
                                  textInputAction: TextInputAction.done,
                                  keyboardType: TextInputType.emailAddress,
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
                                    // FocusScope.of(context).requestFocus(_pass);
                                  },
                                  onSaved: (value){
                                    phone=value;
                                  },
                                ),
                                SizedBox(height: 30,),
                              ],
                            ),
                          ) : Container(),

                          id == 3 ?
                          Container(
                            width: MediaQuery.of(context).size.width*0.8,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text('My Address', style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black87
                                ),),
                                SizedBox(height: 5,),
                                TextFormField(
                                  validator: (value){
                                    if(value.isEmpty || value.length <10){
                                      return "Enter valid Address";
                                    }
                                    return null;
                                  },
                                  textInputAction: TextInputAction.done,
                                  keyboardType: TextInputType.emailAddress,
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
                                    // FocusScope.of(context).requestFocus(_pass);
                                  },
                                  onSaved: (value){
                                    hno=value;
                                  },
                                ),
                                TextFormField(
                                  validator: (value){
                                    if(value.isEmpty || value.length <10){
                                      return "Enter valid Address";
                                    }
                                    return null;
                                  },
                                  textInputAction: TextInputAction.done,
                                  keyboardType: TextInputType.emailAddress,
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
                                    // FocusScope.of(context).requestFocus(_pass);
                                  },
                                  onSaved: (value){
                                    landmark=value;
                                  },
                                ),
                                TextFormField(
                                  validator: (value){
                                    if(value.isEmpty || value.length <10){
                                      return "Enter valid Address";
                                    }
                                    return null;
                                  },
                                  textInputAction: TextInputAction.done,
                                  keyboardType: TextInputType.emailAddress,
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
                                    // FocusScope.of(context).requestFocus(_pass);
                                  },
                                  onSaved: (value){
                                    city=value;
                                  },
                                ),
                                SizedBox(height: 30,),
                              ],
                            ),
                          ):Container(),
                        
                          // _isLoading ? Center(child:CircularProgressIndicator(backgroundColor: Colors.greenAccent)) :
                          // 
                          SizedBox(height: 30,),
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
                              minWidth: MediaQuery.of(context).size.width*0.5,
                              height: 60,
                              onPressed: () {
                                  
                              },
                              color: Colors.greenAccent,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)
                              ),
                              child: Text("Save", style: TextStyle(
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
              ],
            ),
          );
        });
  }


  @override
  Widget build(BuildContext context) {
    return      
        Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    SizedBox(height:20),
                    Container(
                      child: FlatButton(
                          onPressed: (){
                            // _openProfile(_userId,_name,_gender,_age,_course,_image,);
                          },
                          child: 
                          Container(
                          margin: EdgeInsets.only(top: 3),
                          child: picture != null ?
                            CircleAvatar(
                              radius: 60,
                              backgroundImage: picture.isNotEmpty
                              ? NetworkImage(picture)
                              : null,
                              backgroundColor: Colors.white,
                            ) : Container(margin:EdgeInsets.only(bottom: 5),width: 14,height: 14, child: CircularProgressIndicator()),
                          
                        ),
                      ),
                    ),
                    Container(
                      child: FlatButton(
                          onPressed: (){
                            // _openProfile(_userId,_name,_gender,_age,_course,_image,);
                          },
                          child: Container(
                          width: MediaQuery.of(context).size.width*0.5,
                          child: Column(
                            children: <Widget>[
                                  name != null && name!= '' ?
                                    Text(
                                      name,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                                    ) :Container(margin:EdgeInsets.only(bottom: 5),width: 14, height: 14,child: CircularProgressIndicator()),
                                     
                                    SizedBox(height:20),

                                    gender != null && gender!= '' ?
                                    Text(
                                      gender,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                                    ) : Container(margin:EdgeInsets.only(bottom: 5),width: 14,height: 14, child: CircularProgressIndicator()),

                                    // userId != '' ?
                                    // Text(
                                    //   userId,
                                    //   overflow: TextOverflow.ellipsis,
                                    //   style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                                    // ) : Container(margin:EdgeInsets.only(bottom: 5), width: 14,height: 14, child: CircularProgressIndicator()),



                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                            Column(
              children: <Widget>[
                SizedBox(height:50),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        child: Text('Phone number'),
                      ),
                      IconButton(icon: Icon(Icons.edit), onPressed:(){_showAlert(context,'Phone number is ',1);} )
                    ],
                  ),
                ),
                SizedBox(height:30),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        child: Text('Email'),
                      ),
                      IconButton(icon: Icon(Icons.edit), onPressed: (){_showAlert(context,'My EmailId is ',2);})
                    ],
                  ),
                ),
                SizedBox(height:30),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        child: Text('Address'),
                      ),
                      IconButton(icon: Icon(Icons.edit), onPressed: (){_showAlert(context,'My Address is ',3);})
                    ],
                  ),
                ),
                SizedBox(height:30),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        child: Text('Gifting Address'),
                      ),
                      IconButton(icon: Icon(Icons.edit), onPressed: (){_showAlert(context,'The Gifting Address is ',4);})
                    ],
                  ),
                ),
              ],
            )
          ],
        ),       
    );
  }
}