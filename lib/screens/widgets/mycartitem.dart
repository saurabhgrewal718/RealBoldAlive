import 'package:BoldAlive/models/cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyCartItem extends StatelessWidget {
  final String id;
  final int price;
  final int quantity;
  final String title;
  final String productId;
  

  MyCartItem(
    this.id,
    this.price,
    this.productId,
    this.quantity,
    this.title,
  );

  void deleteCartItem(String id){
    print(id);
  }

  @override
  Widget build(BuildContext context) {
    // print('id : $id');
    // print('product id : $productId');
    // print('price : $price');
    // print('quantity : $quantity');
    // print('title : $title');
    
    return Dismissible(
      key: UniqueKey(),
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
              label: Container(
                padding: const EdgeInsets.only(right:8.0,left:8),
                child: Text(
                  '\₹ ${(price * quantity)}',
                  style: Theme.of(context)
                  .textTheme
                  .headline5
                  .copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              backgroundColor: Colors.grey[100],
            ),
            title: Text(title,style: TextStyle(fontWeight: FontWeight.bold),),
            subtitle: Column(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(top:10),
                  child: Text('Price: \₹ $price',textAlign: TextAlign.start,),
                ),
                Container(
                  padding: const EdgeInsets.only(top:5),
                  child: Text('Quantity: $quantity',textAlign: TextAlign.start),
                ),
              ],
            ),
            trailing: FlatButton(onPressed: (){
              deleteCartItem(id);
            }, child: Icon(Icons.delete,color: Colors.redAccent,)
          ),
        ),
      ),
    ),
    );
  }
}
