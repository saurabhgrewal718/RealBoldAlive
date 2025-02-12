import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import './Product.dart';

class ProductModel with ChangeNotifier{
  List <Products> _profile = [];
  List<Products> get items{
    return [..._profile];
  }

Future<void> fetchAndSetProducts() async {
    try {
      
  final List<Products> loadedProducts = [];
  
  Firestore.instance
  .collection("products")
  .where('hidden', isEqualTo: false)
  .getDocuments()
  .then((querySnapshot) {
  querySnapshot.documents.forEach((result) {
        String _myprice;
        _myprice = result.data['price'].toString();
        loadedProducts.add(Products(
          title: result.data['title'],
          price: int.parse(_myprice),
          description: result.data['description'],
          image: result.data['image'],
          id:result.data['id'],
          catagory: result.data['catagory'],
          imgDetail: result.data['imgDetail'],
        )
      );
 
    print(result.data);
    _profile = loadedProducts;
      
    notifyListeners();
  });
});
     
  } catch (error) {
    throw (error);
  }
}

Future<void> fetchCatagories(String catagory) async {
    try {
      
  final List<Products> loadedProducts = [];
  print(catagory);
  Firestore.instance
  .collection("products")
  .where('hidden', isEqualTo: false)
  .where("catagory", isEqualTo: "$catagory")
  .getDocuments()
  .then((querySnapshot) {
  querySnapshot.documents.forEach((result) {
        String _myprice;
        _myprice = result.data['price'].toString();
        loadedProducts.add(Products(
          title: result.data['title'],
          price: int.parse(_myprice),
          description: result.data['description'],
          image: result.data['image'],
          id:result.data['id'],
          catagory: result.data['catagory'],
          imgDetail: result.data['imgDetail'],
        )
      );
 
    print(result.data);
    _profile = loadedProducts;
      
    notifyListeners();
  });
});
     
  } catch (error) {
    throw (error);
  }
}
}