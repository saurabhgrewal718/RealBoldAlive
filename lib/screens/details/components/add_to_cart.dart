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
    print('i am runing');
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              showcartbutton == true ? 
              Container(
                width: MediaQuery.of(context).size.width *0.4,
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
                    setState(() {
                      showcartbutton = false;
                    });
                    
                  },
                  color: Colors.orangeAccent,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)
                  ),
                  child: Text("Add To Cart", style: TextStyle(
                    fontWeight: FontWeight.w600, 
                    fontSize: 18
                  ),),
                ),
              )
              :
              Container(
                width: MediaQuery.of(context).size.width *0.4,
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
                      
                  },
                  color: Colors.greenAccent,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)
                  ),
                  child: Text("Go To Cart", style: TextStyle(
                    fontWeight: FontWeight.w600, 
                    fontSize: 18
                  ),),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width *0.4,
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
                    Navigator.of(context).pushNamed(Placeorder.routeName,arguments: {
                      'productId':widget.product.id,
                      'productPrice':widget.product.price,
                      'productTitle':widget.product.title
                    });
                  },
                  color: Colors.yellow[200],
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)
                  ),
                  child: Text("Buy Now", style: TextStyle(
                    fontWeight: FontWeight.w600, 
                    fontSize: 18
                  ),),
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
