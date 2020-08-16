import 'package:BoldAlive/screens/edit/uploadImage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import './editsceond.dart';

class Tile2 extends StatefulWidget {
   Tile2({
    this.img,this.subtitle,this.title,this.id,this.price
  });
 
  final String title;
  final String img;
  final String subtitle;
  final int id;
  final int price;

 
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
                    Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: Image.network(
                          widget.img,
                          height: 150,
                          width: 150,
                        ),
                    ),                     
                    Container(
                      child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width * 0.45,
                          child: Text(
                          widget.title,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: GoogleFonts.openSans(
                              textStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600)),
                          ),                          
                        ),
                        Container(
                          padding: EdgeInsets.only(top:10),
                          width: MediaQuery.of(context).size.width * 0.45,
                          child: Text(
                          widget.subtitle,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 8,
                          style: TextStyle(color:Colors.black45,fontSize:15),
                          ),                          
                        ),
                        Container(
                          padding: EdgeInsets.only(top:10,bottom:10),
                          width: MediaQuery.of(context).size.width * 0.45,
                          child: RichText(
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              text: new TextSpan(
                                text: 'Starts from ',
                                style: DefaultTextStyle.of(context).style,
                                children: <TextSpan>[
                                  new TextSpan(
                                      text: '₹ ${widget.price}',
                                      style: new TextStyle(fontWeight: FontWeight.bold,fontSize: 17)),
                                 
                                ],
                              ),
                            ),                          
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