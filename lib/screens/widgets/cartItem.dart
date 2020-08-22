import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/cart.dart';

class CartItem extends StatelessWidget {
  final String id;
  final String productId;
  final int price;
  final int quantity;
  final String title;
  

  CartItem(
    this.id,
    this.productId,
    this.price,
    this.quantity,
    this.title,
  );

  @override
  Widget build(BuildContext context) {
    print('id : $id');
    print('product id : $productId');
    print('price : $price');
    print('quantity : $quantity');
    print('title : $title');
    return Dismissible(
      key: ValueKey(id),
      background: Container(
        color: Theme.of(context).errorColor,
        child: Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20),
        margin: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
      ),
      direction: DismissDirection.endToStart,
      confirmDismiss: (direction){
        return showDialog(context: context,builder: (ctx) => AlertDialog(
          title:Text("Are you Sure?"),
          content: Text("Do you want to remove the item form your cart?"),
          actions: <Widget>[
            FlatButton(
              child: Text('No'),
              onPressed: (){
                Navigator.of(ctx).pop(false);                
              },
            ),
            FlatButton(
              child: Text('Yes'),
              onPressed: (){
                Navigator.of(ctx).pop(true);
              },
            ),
          ]
        ),
      );
      },
      onDismissed: (direction) {
        Provider.of<Cart>(context, listen: false).removeItem(productId);
      },
      child: Card(
        margin: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: ListTile(
            contentPadding: EdgeInsets.all(15),
            leading: Chip(
              label: Text(
                '\₹ ${(price * quantity)}',
                style: Theme.of(context)
                .textTheme
                .headline5
                .copyWith(fontWeight: FontWeight.bold),
              ),
              backgroundColor: Colors.grey[100],
            ),
            title: Text(title),
            subtitle: Text('Price: \₹ $price'),
            trailing: Text('$quantity x'),
          ),
        ),
      ),
    );
  }
}
