import 'package:BoldAlive/models/cart.dart';
import 'package:BoldAlive/screens/details/components/badge.dart';
import 'package:BoldAlive/screens/widgets/cartScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../../constants.dart';
import '../../models/Product.dart';
import '../../screens/details/components/body.dart';

class DetailsScreen extends StatefulWidget {
  final Products product;
  
  const DetailsScreen({Key key, this.product}) : super(key: key);

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context, listen: false);
    setState(() {
      count = cart.itemCount;
    });
    return Scaffold(
      // each product have a color
      backgroundColor: Color(0xFFAEAEAE),
      appBar: buildAppBar(context,count),
      body: Body(product: widget.product),
    );
  }

  AppBar buildAppBar(BuildContext context,int count) {
    return AppBar(
      backgroundColor: Color(0xFFAEAEAE),
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset(
          'assets/icons/back.svg',
          color: Colors.white,
        ),
        onPressed: () => Navigator.pop(context),
      ),
      actions: <Widget>[
        // IconButton(
        //   icon: SvgPicture.asset("assets/icons/search.svg"),
        //   onPressed: () {},
        // ),
        Consumer<Cart>(
            builder: (_, cart, ch) => Badge(
                  child: ch,
                  value: cart.itemCount.toString(),
                ),
            child: IconButton(
              icon: Icon(
                Icons.shopping_cart,
              ),
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.routeName);
              },
            ),
          ),
        SizedBox(width: kDefaultPaddin / 2)
      ],
    );
  }
}
