import 'package:BoldAlive/models/cart.dart';
import 'package:BoldAlive/models/catagories.dart';
import 'package:BoldAlive/screens/details/components/badge.dart';
import 'package:BoldAlive/screens/edit/editScreen.dart';
import 'package:BoldAlive/screens/home/components/settingdrawer.dart';
import 'package:BoldAlive/screens/widgets/cartScreen.dart';
import 'package:BoldAlive/welcome.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../constants.dart';
import '../../screens/home/components/body.dart';


class HomeScreen extends StatefulWidget {
  static const routeName = './home';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isLoading = false;

  void _showAlert(){
    HapticFeedback.vibrate();
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0))
        ),
        title:Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text('Do you want to logout?',textAlign: TextAlign.center, style: TextStyle(
            fontWeight: FontWeight.w900, 
            fontSize: 18,
            color: Colors.black
          ),),
        ),
        content: Container(height: 1,color: Colors.black12,),
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              FlatButton(
                onPressed: _signout, 
                child: Container(
                  padding: EdgeInsets.only(top: 3, left: 3),
                  width: MediaQuery.of(context).size.width*0.23,
                  margin: EdgeInsets.only(left:20,right:20,bottom:20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border(
                      bottom: BorderSide(color: Colors.green),
                      top: BorderSide(color: Colors.green),
                      left: BorderSide(color: Colors.green),
                      right: BorderSide(color: Colors.green),
                    )
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text('Yes',textAlign: TextAlign.center, style: TextStyle(
                        fontWeight: FontWeight.w900, 
                        fontSize: 18,
                        color: Colors.black
                      ),),
                  ),
                )
              ),
              FlatButton(
                onPressed: (){
                  Navigator.of(ctx).pop();
                }, 
                child: Container(
                  padding: EdgeInsets.only(top: 3, left: 3),
                  width: MediaQuery.of(context).size.width*0.23,
                  margin: EdgeInsets.only(left:20,right:20,bottom:20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border(
                      bottom: BorderSide(color: Colors.redAccent),
                      top: BorderSide(color: Colors.redAccent),
                      left: BorderSide(color: Colors.redAccent),
                      right: BorderSide(color: Colors.redAccent),
                    )
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text('No',textAlign: TextAlign.center, style: TextStyle(
                        fontWeight: FontWeight.w900, 
                        fontSize: 18,
                        color: Colors.black
                      ),),
                  ),
                )
              )
            ],
          )
        ],
      )
    );
  }

  void _signout() async {
    setState(() {
      _isLoading=true;
    });
    await FirebaseAuth.instance.signOut();
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
    final currentId = prefs.getString('userId');
    if(currentId == null){
      Navigator.of(context).pushReplacementNamed(Welcome.routeName);
    }
    setState(() {
      _isLoading=false;
    });
  }
  
  @override
  Widget build(BuildContext context) {

// void firestoreTest(){
//   Firestore.instance.collection('products')
//     .getDocuments()
//     .then((querySnapshot) => {
//       querySnapshot.documents.forEach((result) {
//         print(result.data);
//       })
//     });
    
// }
void showSettigs() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: MediaQuery.of(context).size.height *0.8,
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
                  width: MediaQuery.of(context).size.width*0.4,
                  padding: EdgeInsets.only(top: 3, left: 3),
                  margin: EdgeInsets.all(16),
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
                    height: 50,
                    onPressed: (){},
                    color: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)
                    ),
                    child: Text('Edit Answers', style: TextStyle(
                      fontWeight: FontWeight.w600, 
                      fontSize: 18,
                      color: Colors.black
                    ),),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width*0.4,
                  padding: EdgeInsets.only(top: 3, left: 3),
                  margin: EdgeInsets.all(16),
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
                    height: 50,
                    onPressed: (){},
                    color: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)
                    ),
                    child: Text('TextButton', style: TextStyle(
                      fontWeight: FontWeight.w600, 
                      fontSize: 18,
                      color: Colors.black
                    ),),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width*0.4,
                  padding: EdgeInsets.only(top: 3, left: 3),
                  margin: EdgeInsets.all(16),
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
                    height: 50,
                    onPressed: (){},
                    color: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)
                    ),
                    child: Text('My Orders', style: TextStyle(
                      fontWeight: FontWeight.w600, 
                      fontSize: 18,
                      color: Colors.black
                    ),),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width*0.4,
                  padding: EdgeInsets.only(top: 3, left: 3),
                  margin: EdgeInsets.all(16),
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
                    height: 50,
                    onPressed: _showAlert,
                    color: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)
                    ),
                    child: Text('Logout', style: TextStyle(
                      fontWeight: FontWeight.w600, 
                      fontSize: 18,
                      color: Colors.black
                    ),),
                  ),
                ),
                
              ],
            ),
          );
        });
  }


void showMenu() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.0),
                topRight: Radius.circular(16.0),
              ),
              color: Colors.white,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                
                SizedBox(
                    height: 400,
                    child: Container(
                        child: Stack(
                          alignment: Alignment(0, 0),
                          overflow: Overflow.visible,
                          children: <Widget>[
                     
                            Padding(
                                padding: const EdgeInsets.only(left:20,right:20,top:20),
                                child: GridView.builder(
                                    itemCount: catagories.length,
                                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3,
                                      mainAxisSpacing: kDefaultPaddin,
                                      crossAxisSpacing: kDefaultPaddin,
                                      childAspectRatio: 0.75,
                                    ),
                                    itemBuilder: (context, index) => SettingsDrawer(
                                          catagories: catagories[index],
                                          press: () {},
                                        )),
                              ),
                          ],
                        ))),
                
              ],
            ),
          );
        });
  }

    return Scaffold(
      appBar: AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset("assets/icons/settings.svg",height:28,width: 28,),
        onPressed: showSettigs,
      ),
      actions: <Widget>[
        IconButton(
          icon: SvgPicture.asset(
            "assets/icons/search.svg",
            // By default our  icon color is white
            color: kTextColor,
          ),
          onPressed: showMenu,
        ),
        Consumer<Cart>(
            builder: (_, cart, ch) => Badge(
                  child: ch,
                  value: cart.itemCount.toString(),
                ),
            child: IconButton(
              icon: SvgPicture.asset(
                "assets/icons/cart.svg",
                // By default our  icon color is white
                color: kTextColor,
              ),
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.routeName);
              },
            ),
          ),
        IconButton(
          icon: Icon(Icons.edit,
            // By default our  icon color is white
            color: kTextColor,
          ),
          onPressed: (){
            Navigator.of(context).pushNamed(EditScreen.routeName);
          },
        ),
        SizedBox(width: kDefaultPaddin / 2)
      ],
    ),
      body: Body(),
    );
  }
}

