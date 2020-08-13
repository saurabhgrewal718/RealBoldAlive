import 'package:BoldAlive/models/cart.dart';
import 'package:BoldAlive/models/catagories.dart';
import 'package:BoldAlive/screens/details/components/badge.dart';
import 'package:BoldAlive/screens/edit/editScreen.dart';
import 'package:BoldAlive/screens/widgets/cartScreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../../constants.dart';
import '../../screens/home/components/body.dart';

import 'components/drawercatagories.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = './home';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
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
                                    itemBuilder: (context, index) => DrawerCatagory(
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

