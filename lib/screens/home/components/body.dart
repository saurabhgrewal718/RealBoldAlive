import 'package:BoldAlive/models/ProductProvider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../constants.dart';
import '../../../models/Product.dart';
import '../../../screens/details/details_screen.dart';

import 'item_card.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool _inIt = true;

  @override
  void didChangeDependencies() async {
    if (_inIt) {
      Provider.of<ProductModel>(context,listen: false).fetchAndSetProducts();
    }
    _inIt = false;
    print('i ran');
    final prefs  = await SharedPreferences.getInstance();
      final userId = prefs.getString('userId');
      await Firestore.instance.collection('users')
      .document(userId)
      .get()
      .then((value) {
        if(value['cartitems']!=null){
          List<String> myarray = new List(value['cartitems'].length);
          for(int i=0; i<value['cartitems'].length;i++){
            myarray[i] = value['cartitems'][i]['title']; 
          }
          prefs.setStringList('mycartlist', myarray);
        }else{
          List<String> myarray = [];
          prefs.setStringList('mycartlist', myarray);
        }

      });

    super.didChangeDependencies();
  }

   Future<void> onrefresh()async{
    HapticFeedback.vibrate();
      Provider.of<ProductModel>(context,listen: false).fetchAndSetProducts();
    
  }


  @override
  Widget build(BuildContext context) {
    final profiles = Provider.of<ProductModel>(context);
    final profile = profiles.items;
    
    return RefreshIndicator(
        onRefresh: onrefresh,
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
            child: Text(
              "Bold Alive",
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 20,),
          // Categories(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
              child: GridView.builder(
                  itemCount: profile.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: kDefaultPaddin,
                    crossAxisSpacing: kDefaultPaddin,
                    childAspectRatio: 0.75,
                  ),
                  itemBuilder: (context, index) => ItemCard(
                        product: profile[index],
                        press: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailsScreen(
                                product: profile[index],
                              ),
                            )),
                      )),
            ),
          ),
        ],
      ),
    );
  }
}


// Expanded(
// child: Padding(
//   padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
//   child: GridView.builder(
//       itemCount: products.length,
//       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 2,
//         mainAxisSpacing: kDefaultPaddin,
//         crossAxisSpacing: kDefaultPaddin,
//         childAspectRatio: 0.75,
//       ),
//       itemBuilder: (context, index) => ItemCard(
//             product: products[index],
//             press: () => Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => DetailsScreen(
//                     product: products[index],
//                   ),
//                 )),
//           )),
// ),
// ),