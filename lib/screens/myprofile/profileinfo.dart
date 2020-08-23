import 'package:flutter/material.dart';
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
                      IconButton(icon: Icon(Icons.edit), onPressed: null)
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
                      IconButton(icon: Icon(Icons.edit), onPressed: null)
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
                      IconButton(icon: Icon(Icons.edit), onPressed: null)
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
                      IconButton(icon: Icon(Icons.edit), onPressed: null)
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