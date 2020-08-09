import 'package:BoldAlive/models/ProductProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../constants.dart';
import '../../../models/Product.dart';
import '../../../screens/details/details_screen.dart';

import 'categorries.dart';
import 'item_card.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool _inIt = true;
  bool isloading = false;

  @override
  void didChangeDependencies() async {
    setState(() {
        isloading=true;
      });
    if (_inIt) {
      setState(() {
        isloading=true;
      });
      Provider.of<ProductModel>(context,listen: false).fetchAndSetProducts().then((_) {
        setState(() {
          isloading=false;
        });
      });
    }
    _inIt = false;
    super.didChangeDependencies();
    setState(() {
        isloading=false;
      });
  }


  @override
  Widget build(BuildContext context) {
    final profiles = Provider.of<ProductModel>(context);
    final profile = profiles.items;
    
    return Column(
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
                itemCount: products.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: kDefaultPaddin,
                  crossAxisSpacing: kDefaultPaddin,
                  childAspectRatio: 0.75,
                ),
                itemBuilder: (context, index) => ItemCard(
                      product: products[index],
                      press: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailsScreen(
                              product: products[index],
                            ),
                          )),
                    )),
          ),
        ),
      ],
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