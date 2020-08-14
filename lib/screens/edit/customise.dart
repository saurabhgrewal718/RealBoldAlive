import 'package:BoldAlive/screens/edit/societytile.dart';
import 'package:BoldAlive/screens/edit/tile2.dart';
import 'package:flutter/material.dart';

class Customise extends StatefulWidget {
  final title;
  Customise(this.title);
  @override
  _CustomiseState createState() => _CustomiseState();
}

class _CustomiseState extends State<Customise> {
     Items item0 = new Items(
      id:0,
      title: "Front Paint only",
      subtitle: "March, Wednesday March, Wednesday March, Wednesday March, Wednesday",
      img: "https://www.aphrodite1994.com/media/catalog/product/cache/f90efef3a23da69054ec1e91c33299f9/d/s/dsquared_hooded_sweat_white_21256_01ks.jpg");

  Items item1 = new Items(
      id:1,
      title: "Back Paints only",
      subtitle: "March, Wednesday",
      img: "https://demo.quemalabs.com/shophistic/demo-3/wp-content/uploads/sites/3/2018/08/wid950fitconstrainhei950t-251.jpeg");

  Items item2 = new Items(
    id:2,
    title: "Front And Back Paints",
    subtitle: "Bocali, Apple",
    img: "https://cdn.shopify.com/s/files/1/0241/9737/products/XAU-1110-18500-navy_1_1800x.jpg?v=1571442916",
  );

  Items item3 = new Items(
    id:3,
    title: "Sleves Only",
    subtitle: "Lucy Mao going to Office",
    img: "https://cdn.shopify.com/s/files/1/2089/6359/products/ec2654ee233e2fd46e1d63c28dede5cc_preview_530x@2x.png?v=1546904221",
  );

  Items item4 = new Items(
    id:4,
    title: "Hood Only",
    subtitle: "Rose favirited your Post",
    img: "https://media.manofakind.se/media/catalog/product/cache/2/image/1800x/040ec09b1e35df139433887a97daa66f/p/i/pim-272052-66382-productcolor-60433403-969-frontimage1.jpg",
  );

  Items item5 = new Items(
    id:5,
    title: "All Custom",
    subtitle: "Homework, Design",
    img: "https://ae01.alicdn.com/kf/He4d97fda44e049ed883686238f506315k/2020-Spring-Billie-Eilish-Hoodie-Women-Print-Hooded-Matching-Couple-Sweatshirt-Harajuku-Casual-Hoodies-Sweatshirts-Female.jpg",
  );


  @override
  Widget build(BuildContext context) {
    List<Items> myList = [item0,item1, item2, item3,item4,item5];
    return Center(
      child: Container(
        height: MediaQuery.of(context).size.height-108,
        color: Colors.white,
        child: Column(
          children: <Widget>[
            SizedBox(height: 10,),
            Container(
              height: MediaQuery.of(context).size.height *0.82,
              child:GridView.count(
                    childAspectRatio: 2,
                    padding: EdgeInsets.only(left: 16, right: 16),
                    crossAxisCount: 1,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    children: myList.map((data) {
                    return Tile2(
                      title:data.title,
                      img:data.img,
                      subtitle:data.subtitle,
                      id: data.id,   
                    );
                  }).toList()),

            ),
            // Container(
            //     width: MediaQuery.of(context).size.width*0.4,
            //     padding: EdgeInsets.only(top: 3, left: 3),
            //     margin: EdgeInsets.all(16),
            //     decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(50),
            //       border: Border(
            //         bottom: BorderSide(color: Colors.black),
            //         top: BorderSide(color: Colors.black),
            //         left: BorderSide(color: Colors.black),
            //         right: BorderSide(color: Colors.black),
            //       )
            //     ),
            //     child: MaterialButton(
            //       minWidth: double.infinity,
            //       height: 50,
            //       onPressed: (){},
            //       color: Colors.white,
            //       elevation: 0,
            //       shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(50)
            //       ),
            //       child: Text('Edit Answers', style: TextStyle(
            //         fontWeight: FontWeight.w600, 
            //         fontSize: 18,
            //         color: Colors.black
            //       ),),
            //     ),
            //   ),
          ],
        ),
      ),
    );
  }
}

class Items {
  String title;
  String subtitle;
  String img;
  int id;
  Items({this.title, this.subtitle,this.id, this.img});
}
