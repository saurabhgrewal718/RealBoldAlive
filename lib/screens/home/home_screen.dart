import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../constants.dart';
import '../../models/Product.dart';
import '../../screens/home/components/body.dart';

import 'components/drawercatagories.dart';
import 'components/item_card.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  @override
  Widget build(BuildContext context) {

void firestoreTest(){
  Firestore.instance.collection('users/anKvEpQEffwY70Z4cyBh/messages')
    .snapshots()
    .listen((data){
      print(data.documents[0]['test']);
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
                            // Positioned(
                            //   top: -72,
                            //   child: Container(
                            //     decoration: BoxDecoration(
                            //         borderRadius:
                            //             BorderRadius.all(Radius.circular(50)),
                            //         border: Border.all(
                            //             color: Colors.grey, width: 10)),
                            //     child: Center(
                            //       child:Padding(
                            //         padding: const EdgeInsets.all(10.0),
                            //         child: Text(
                            //           "All Catagories",
                            //           style: Theme.of(context)
                            //               .textTheme
                            //               .headline5
                            //               .copyWith(fontWeight: FontWeight.bold),
                            //         ),
                            //       ),
                            //     ),
                            //   ),
                            // ),
                            Padding(
                                padding: const EdgeInsets.only(left:20,right:20,top:20),
                                child: GridView.builder(
                                    itemCount: products.length,
                                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3,
                                      mainAxisSpacing: kDefaultPaddin,
                                      crossAxisSpacing: kDefaultPaddin,
                                      childAspectRatio: 0.75,
                                    ),
                                    itemBuilder: (context, index) => DrawerCatagory(
                                          product: products[index],
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
        icon: SvgPicture.asset("assets/icons/back.svg"),
        onPressed: () {},
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
        IconButton(
          icon: SvgPicture.asset(
            "assets/icons/cart.svg",
            // By default our  icon color is white
            color: kTextColor,
          ),
          onPressed: firestoreTest,
        ),
        SizedBox(width: kDefaultPaddin / 2)
      ],
    ),
      body: Body(),
    );
  }

  
}

