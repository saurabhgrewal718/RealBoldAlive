import 'package:BoldAlive/screens/atoms/head_of_app.dart';
import 'package:flutter/material.dart';

import 'societytile.dart';

class EditScreen extends StatefulWidget {
  static const routeName = './editscreen';
  @override
  _EditScreenState createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
   Items item0 = new Items(
      id:0,
      title: "Kitchen Items",
      subtitle: "March, Wednesday",
      img: "https://cdn.iconscout.com/icon/premium/png-256-thumb/utensils-29-920991.png");

  Items item1 = new Items(
      id:1,
      title: "Phone Cases",
      subtitle: "March, Wednesday",
      img: "https://images.yappy.com/products/305/shihtzu/shihtzu-15/mint/image-1.t.jpg");

  Items item2 = new Items(
    id:2,
    title: "Pillow Covers",
    subtitle: "Bocali, Apple",
    img: "https://static.thenounproject.com/png/881524-200.png",
  );

  Items item3 = new Items(
    id:3,
    title: "Hoodies",
    subtitle: "Lucy Mao going to Office",
    img: "https://cdn0.iconfinder.com/data/icons/online-clothes-shopping-set/128/iStar_Design_Online_Shopping_LineIcons_Live-40-512.png",
  );

  Items item4 = new Items(
    id:4,
    title: "Jeans",
    subtitle: "Rose favirited your Post",
    img: "https://cdn0.iconfinder.com/data/icons/fashion-outline-stroke-1/64/fashion_icon_set-04-512.png",
  );

  Items item5 = new Items(
    id:5,
    title: "Shirts",
    subtitle: "Homework, Design",
    img: "https://cdn2.iconfinder.com/data/icons/shirts/100/shirts-01-512.png",
  );

  Items item6 = new Items(
    id:6,
    title: "Mugs",
    subtitle: "",
    img: "https://www.pngfind.com/pngs/m/35-354195_gelas-mug-png-funny-mugs-transparent-png.png",
  );
    Items item7 = new Items(
    id:7,
    title: "Caps",
    subtitle: "Homework, Design",
    img: "https://cdn4.iconfinder.com/data/icons/hats-caps-essentials/48/v-02-512.png",
  );  
  Items item8 = new Items(
    id:8,
    title: "Photo Frames",
    subtitle: "Homework, Design",
    img: "https://cdn0.iconfinder.com/data/icons/video-editing/100/11-512.png",
  );
  Items item9 = new Items(
    id:9,
    title: "Bags",
    subtitle: "Homework, Design",
    img: "https://cdn0.iconfinder.com/data/icons/common-shopping-1/48/Sed-02-512.png",
  );
   Items item10 = new Items(
    id:10,
    title: "Metal Bottles",
    subtitle: "Homework, Design",
    img: "https://5.imimg.com/data5/UK/MU/MY-59237957/stainless-steel-water-bottle-500x500.jpg",
  );


  @override
  Widget build(BuildContext context) {
    List<Items> myList = [item0,item1, item2, item3, item4, item5, item6,item7,item8,item9,item10];
    return Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Headofapp(title: 'Bold Alive',subtitle: 'Select any',),
              ),
              Container(
                    height: MediaQuery.of(context).size.height * 0.83,
                    child:
                    GridView.count(
                        childAspectRatio: 1.0,
                        padding: EdgeInsets.only(left: 16, right: 16),
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        children: myList.map((data) {
                        return SocietyTile(
                          title:data.title,
                          img:data.img,
                          subtitle:data.subtitle,
                          id: data.id,   
                        );
                        }).toList()),
                   
              ),
            ],
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

