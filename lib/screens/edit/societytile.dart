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
              Navigator.of(context).pushNamed(EditSceond.routeName,arguments: {
                'title':widget.title,
              });
            },

          ),
        );
   
  }
}