import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import './cart.dart';

class OrderItem {
  final String id;
  final double amount;
  final List<CartItem> products;
  final DateTime dateTime;


  OrderItem({
    @required this.id,
    @required this.amount,
    @required this.products,
    @required this.dateTime,
  });
}

class Orders with ChangeNotifier {
  List<OrderItem> _orders = [];
  
  List<OrderItem> get orders {
    return [..._orders];
  }

  Future <void> fetchAndSetOrders() async{
    final url = 'https://flutter-shop-e2ee9.firebaseio.com/orders';
    final response = await http.get(url);
    final List<OrderItem> loadedOrders =[];
    final extractedData = json.decode(response.body) as Map<String,dynamic>;
    if(extractedData == null){
      return;
    }
    extractedData.forEach((orderId, orderData) {
      loadedOrders.add(OrderItem(
          id:orderId,
          amount: orderData['amount'],
          dateTime: DateTime.parse(orderData['dateTime']),
          products: (orderData['products'] as List <dynamic>)
            .map((item) => CartItem(
              id:item['id'],
              price: item['price'],
              quantity: item['quantity'],
              title: item['title'],

            )).toList(),
        
        )
      );   
    });
    _orders= loadedOrders.reversed.toList();
    notifyListeners();

  }

  Future <void> addOrder(List<CartItem> cartProducts, double total) async {
    // final url = 'https://flutter-shop-e2ee9.firebaseio.com/orders/$userId.json?auth=$authToken';
    // final timestamp = DateTime.now();
    // final response = await http.post(
    //   url,
    //   body: json.encode({
    //     'amount': total,
    //     'dateTime': timestamp.toIso8601String(),
    //     'products': cartProducts.map((cp) => {
    //       'id':cp.id,
    //       'title':cp.title,
    //       'quantity':cp.quantity,
    //       'price':cp.price
    //     }).toList(),
    //   }),
    // );
    final prefs = await SharedPreferences.getInstance();
    final userId = prefs.getString('userId');

    final amount = total;
    final products = cartProducts.map((cp) => {
        'id':cp.id,
        'title':cp.title,
        'quantity':cp.quantity,
        'price':cp.price
      }).toList();
    print(amount);
    print(products);
    Firestore.instance.collection('orders').add({
      'totalamount': amount,
      'order':products
    });
    
    // _orders.insert(
    //   0,
    //   OrderItem(
    //     id: json.decode(response.body)['name'],
    //     amount: total,
    //     dateTime: timestamp,
    //     products: cartProducts,
    //   ),
    // );
    notifyListeners();
  }

 Future uploadCart(List<CartItem> cartProducts, double total) async {
    
    final prefs = await SharedPreferences.getInstance();
    final userId = prefs.getString('userId');

    final amount = total;
    final products = cartProducts.map((cp) => {
        'id':cp.id,
        'title':cp.title,
        'quantity':cp.quantity,
        'price':cp.price
      }).toList();
    
    final document = Firestore.instance.collection('users').document(userId);
    final documentlist = await document.get();

    final double newAmount = documentlist['cartamount'];
    final List<dynamic> newProducts = documentlist['cartitems'];
    
    if(newProducts!=null ){
      if(products.length!=0){
        print(products.length);
        print(newProducts.length);
        print('${products[0]['title']} this is the array ${newProducts[0]['title']}');
        for(int i=0 ; i<products.length ; i++){
          for(int j = 0 ; j<newProducts.length ; j++){
            if(products[i]['title'] == newProducts[j]['title']){
              print('matched');
              newProducts[j]['quantity'] = newProducts[j]['quantity'] + 1;
              
            }
          } 
        }
      }else{
        print('no new products aded ');
      }
      
    }else{
      print('no data from internet found !');
    }


    print(newProducts);
    print(' products $products');

    if(newProducts!=null && newAmount != null){
      if(products!=null){
        products.forEach((element) => newProducts.add(element));      
        Firestore.instance.collection('users').document(userId).updateData({
          'cartamount': amount + newAmount,
          'cartitems': newProducts
        });
      }
    }else{
      Firestore.instance.collection('users').document(userId).updateData({
        'cartamount': amount,
        'cartitems': products
      });
    }

  }



}


