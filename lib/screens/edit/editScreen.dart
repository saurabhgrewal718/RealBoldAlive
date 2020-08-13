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
      title: "MyBadMan",
      subtitle: "March, Wednesday",
      img: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQTMPyqLlYjhHLdDjcirA8fii_eGDUxuLadMg&usqp=CAU");

  Items item1 = new Items(
      id:1,
      title: "Calendar",
      subtitle: "March, Wednesday",
      img: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQTMPyqLlYjhHLdDjcirA8fii_eGDUxuLadMg&usqp=CAU");

  Items item2 = new Items(
    id:2,
    title: "Phone Cases",
    subtitle: "Bocali, Apple",
    img: "https://image.flaticon.com/icons/png/512/2022/2022185.png",
  );

  Items item3 = new Items(
    id:3,
    title: "Hoodies",
    subtitle: "Lucy Mao going to Office",
    img: "https://cdn0.iconfinder.com/data/icons/online-clothes-shopping-set/128/iStar_Design_Online_Shopping_LineIcons_Live-40-512.png",
  );

  Items item4 = new Items(
    id:4,
    title: "Activity",
    subtitle: "Rose favirited your Post",
    img: "https://p1.hiclipart.com/preview/912/608/869/super-mario-icons-super-mario-pixel-illustration.jpg",
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
    img: "https://cdn0.iconfinder.com/data/icons/cups-and-mugs/64/cup19-512.png",
  );

  @override
  Widget build(BuildContext context) {
    List<Items> myList = [item0,item1, item2, item3, item4, item5, item6];
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

