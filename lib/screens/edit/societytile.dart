import 'package:BoldAlive/screens/edit/offerings/hoodie.dart';
import 'package:BoldAlive/screens/edit/offerings/kitchen.dart';
import 'package:BoldAlive/screens/edit/offerings/mugs.dart';
import 'package:BoldAlive/screens/edit/offerings/phone.dart';
import 'package:BoldAlive/screens/edit/offerings/photo.dart';
import 'package:BoldAlive/screens/edit/offerings/shirts.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import './editsceond.dart';

class SocietyTile extends StatefulWidget {
   SocietyTile({
    this.img,this.subtitle,this.title,this.id
  });
 
  final String title;
  final String img;
  final String subtitle;
  final int id;

 
  @override
  _SocietyTileState createState() => _SocietyTileState();
}

class _SocietyTileState extends State<SocietyTile> {
 
  @override
  Widget build(BuildContext context) {    
    return  Container(
          // height: 100,
          decoration: BoxDecoration(
              color: Colors.grey[300], borderRadius: BorderRadius.circular(10)),
          child: FlatButton(
              child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.network(
                  widget.img,
                  height: 80,
                  width: 80,
                ),
                
                
                SizedBox(
                  height: 10,
                ),
                Text(
                  widget.title,
                  style: GoogleFonts.openSans(
                      textStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w600)),
                ),
                Text(
                  widget.subtitle,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.openSans(
                      textStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 10,
                          fontWeight: FontWeight.w600)),
                  
                ),
                
              ],
            ),
            onPressed: (){
              print(widget.id);
              if(widget.id == 1){
                Navigator.of(context).pushNamed(Kitchen.routeName,arguments: {
                  'title':widget.title,
                });
              }
              if(widget.id == 2){
                Navigator.of(context).pushNamed(Phone.routeName,arguments: {
                  'title':widget.title,
                });
              }
              if(widget.id == 3){
                // Navigator.of(context).pushNamed(Phone.routeName,arguments: {
                //   'title':widget.title,
                // });
              }
              if(widget.id == 4){
                Navigator.of(context).pushNamed(Hoodie.routeName,arguments: {
                  'title':widget.title,
                });
              }
              if(widget.id == 5){
                // Navigator.of(context).pushNamed(Hoodie.routeName,arguments: {
                //   'title':widget.title,
                // });
              }
              if(widget.id == 6){
                Navigator.of(context).pushNamed(Shirts.routeName,arguments: {
                  'title':widget.title,
                });
              }
              if(widget.id == 7){
                Navigator.of(context).pushNamed(Mugs.routeName,arguments: {
                  'title':widget.title,
                });
              }
              if(widget.id == 8){
                // Navigator.of(context).pushNamed(Caps.routeName,arguments: {
                //   'title':widget.title,
                // });
              }
              if(widget.id == 9){
                Navigator.of(context).pushNamed(Photo.routeName,arguments: {
                  'title':widget.title,
                });
              }
              if(widget.id == 10){
                // Navigator.of(context).pushNamed(Bags.routeName,arguments: {
                //   'title':widget.title,
                // });
              }
              if(widget.id == 11){
                // Navigator.of(context).pushNamed(Bottle.routeName,arguments: {
                //   'title':widget.title,
                // });
              }
              
            },

          ),
        );
   
  }
}