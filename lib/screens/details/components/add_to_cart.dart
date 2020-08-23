import 'package:BoldAlive/screens/details/components/placeorder.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../models/Product.dart';
import '../../../models/cart.dart';
import '../../../constants.dart';

class AddToCart extends StatefulWidget {
  const AddToCart({
    Key key,
    @required this.product,
  }) : super(key: key);

  final Products product;

  @override
  _AddToCartState createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {

  bool showcartbutton = true;

  @override
  void didChangeDependencies() async{
    final prefs = await SharedPreferences.getInstance();
    final mylist = prefs.getStringList('mycartlist');
    if(mylist!=null){
      mylist.forEach((element) {
        if(element == widget.product.title){
          setState(() {
            showcartbutton = false;
          });  
        }
      });
    }

    super.didChangeDependencies();
  }
  
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(right: kDefaultPaddin),
                height: 50,
                width: 58,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(
                    color: Colors.blueGrey,
                  ),
                ),
                child: showcartbutton == true ? IconButton(
                  icon: SvgPicture.asset(
                    "assets/icons/add_to_cart.svg",
                    color: Colors.blueGrey,
                  ),
                  onPressed: () {
                    HapticFeedback.vibrate();
                    Fluttertoast.showToast(
                      msg: "Product Added to Cart",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.greenAccent,
                      textColor: Colors.black,
                      fontSize: 16.0
                    );
                    cart.addItem(widget.product.id,widget.product.price,widget.product.title);
                    print(cart);
                  },
                ) 
                : 
                IconButton(
                  icon: Icon(Icons.add_shopping_cart),
                  onPressed: null,
                ),
              ),
              Expanded(
                child: SizedBox(
                  height: 50,
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18)),
                    color: Colors.blueGrey,
                    onPressed: () {
                      Navigator.of(context).pushNamed(Placeorder.routeName,arguments: {
                        'productId':widget.product.id,
                        'productPrice':widget.product.price,
                        'productTitle':widget.product.title
                      });
                    },
                    child: Text(
                      "Buy  Now".toUpperCase(),
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              
            ],
          ),
          SizedBox(height: 30,),
          // Container(
          //   child: Text('data da ta dat ada tada tadata',style: TextStyle(fontWeight: FontWeight.bold),),
          // )
        ],
      ),
    );
  }
}
