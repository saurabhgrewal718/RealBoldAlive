import 'dart:async';

import 'package:BoldAlive/models/orders.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/cart.dart' show Cart;
import './cartItem.dart';

class CartScreen extends StatefulWidget {
  static const routeName = '/cart';

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

bool init = false;

@override
  void initState() {
    init = true;
    super.initState();
  }

@override
  void didChangeDependencies() async {
    if(init == true){
      final cart = Provider.of<Cart>(context);
      await Provider.of<Orders>(context, listen: false).uploadCart(cart.items.values.toList(),cart.totalAmount);
    }
    init = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    final totalamount = cart.totalAmount.toStringAsFixed(2);

    return Scaffold(
      appBar: AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      leading: IconButton(icon: Icon(Icons.arrow_back),color:Colors.black45, onPressed: (){
        Navigator.of(context).pop();
      }),
      title: Text('My Cart', style: Theme.of(context)
                  .textTheme
                  .headline5
                  .copyWith(fontWeight: FontWeight.bold),),
    ),
      body: Column(
        children: <Widget>[
          Card(
            margin: EdgeInsets.all(15),
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Total',
                    style: TextStyle(fontSize: 20),
                  ),
                  Spacer(),
                  Chip(
                    label: Text(
                      '\₹ $totalamount',
                      style: Theme.of(context)
                      .textTheme
                      .headline5
                      .copyWith(fontWeight: FontWeight.bold),
                    ),
                    backgroundColor: Colors.grey[100],
                  ),
                  Spacer(),
                  OrderButton(cart: cart)
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: cart.items.length,
              itemBuilder: (ctx, i) => CartItem(
                    cart.items.values.toList()[i].id,
                    cart.items.keys.toList()[i],
                    cart.items.values.toList()[i].price,
                    cart.items.values.toList()[i].quantity,
                    cart.items.values.toList()[i].title,
                    
                  ),
            ),
          )
        ],
      ),
    );
  }
}

class OrderButton extends StatefulWidget {

  const OrderButton({
    Key key,
    @required this.cart,
  }) : super(key: key);

  final Cart cart;

  @override
  _OrderButtonState createState() => _OrderButtonState();
}
class _OrderButtonState extends State<OrderButton> {
  var _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.greenAccent,
        borderRadius: BorderRadius.circular(50),
        border: Border(
          bottom: BorderSide(color: Colors.black),
          top: BorderSide(color: Colors.black),
          left: BorderSide(color: Colors.black),
          right: BorderSide(color: Colors.black),
        )
      ),
      child: FlatButton(
        child: _isLoading ? Center(child:CircularProgressIndicator()) : Text('ORDER NOW'),
        onPressed: (widget.cart.totalAmount <=0 || _isLoading) ? null : () async {
          setState(() {
            _isLoading = true;
          });
          try{
            await Provider.of<Orders>(context, listen: false).addOrder(widget.cart.items.values.toList(),widget.cart.totalAmount);
            widget.cart.clear();
            setState(() {
            _isLoading = false;
          });

          }on PlatformException catch(err){
            print(err);
            setState(() {
            _isLoading = false;
          });
          }    
        },
        textColor: Colors.black,
        
      ),
    );
  }
}

