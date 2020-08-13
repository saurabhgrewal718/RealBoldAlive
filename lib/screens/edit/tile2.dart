import 'package:BoldAlive/screens/edit/uploadImage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import './editsceond.dart';

class Tile2 extends StatefulWidget {
   Tile2({
    this.img,this.subtitle,this.title,this.id
  });
 
  final String title;
  final String img;
  final String subtitle;
  final int id;

 
  @override
  _Tile2State createState() => _Tile2State();
}

class _Tile2State extends State<Tile2> {
 
  @override
  Widget build(BuildContext context) {    
    return  Container(
          // height: 100,
          decoration: BoxDecoration(
              color: Colors.grey[300], borderRadius: BorderRadius.circular(10)),
          child: FlatButton(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Image.network(
                        widget.img,
                        height: 80,
                        width: MediaQuery.of(context).size.width *0.35,
                      ),
                      
                    Container(
                      width: MediaQuery.of(context).size.width *0.4,
                      child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
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
                    ),
                  ],
                ),
              ),
            onPressed: (){
              Navigator.of(context).pushNamed(UploadImage.routeName,arguments: {
                'title':widget.title,
              });
            },

          ),
        );
   
  }
}