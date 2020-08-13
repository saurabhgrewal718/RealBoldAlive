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
    title: "Groceries",
    subtitle: "Bocali, Apple",
    img: "https://is3-ssl.mzstatic.com/image/thumb/Purple123/v4/85/7e/b7/857eb7fb-587e-ebe2-db13-3625c9b50cdd/source/256x256bb.jpg",
  );

  Items item3 = new Items(
    id:3,
    title: "Locations",
    subtitle: "Lucy Mao going to Office",
    img: "https://findicons.com/files/icons/1316/futurama_vol_1/256/bender.png",
  );

  Items item4 = new Items(
    id:4,
    title: "Activity",
    subtitle: "Rose favirited your Post",
    img: "https://p1.hiclipart.com/preview/912/608/869/super-mario-icons-super-mario-pixel-illustration.jpg",
  );

  Items item5 = new Items(
    id:5,
    title: "To do",
    subtitle: "Homework, Design",
    img: "https://invocation.internships.com/invocation/images/ccm_5d34f540-015a-48c0-b451-b1ff786e283b",
  );

  Items item6 = new Items(
    id:6,
    title: "Settings",
    subtitle: "",
    img: "https://images.vexels.com/media/users/3/192417/isolated/lists/d687ab14fc6c5a1f882b1e276547be58-winter-man-notebook-illustration.png",
  );

  @override
  Widget build(BuildContext context) {
    List<Items> myList = [item0,item1, item2, item3];
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
