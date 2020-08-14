import 'dart:io';
import 'dart:math';

import 'package:BoldAlive/screens/atoms/head_of_app.dart';
import 'package:BoldAlive/screens/checkout/completeoder.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class UploadImage extends StatefulWidget {
  static const routeName = './upload image';
  @override
  _UploadImageState createState() => _UploadImageState();
}

class _UploadImageState extends State<UploadImage> {
  File _selectedFile;
  bool isLoading = false;
  double fileSize;

  void showOptions() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Row(
            children: <Widget>[
              Container(
                  width: MediaQuery.of(context).size.width*0.4,
                  padding: EdgeInsets.only(top: 3, left: 3),
                  margin: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border(
                      bottom: BorderSide(color: Colors.black),
                      top: BorderSide(color: Colors.black),
                      left: BorderSide(color: Colors.black),
                      right: BorderSide(color: Colors.black),
                    )
                  ),
                  child: MaterialButton(
                    minWidth: double.infinity,
                    height: 50,
                    onPressed: (){
                      getimage(ImageSource.camera);

                    },
                    color: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)
                    ),
                    child: Text('Camera', style: TextStyle(
                      fontWeight: FontWeight.w600, 
                      fontSize: 18,
                      color: Colors.black
                    ),),
                  ),
                ),
                Container(
              width: MediaQuery.of(context).size.width*0.4,
              padding: EdgeInsets.only(top: 3, left: 3),
              margin: EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                border: Border(
                  bottom: BorderSide(color: Colors.black),
                  top: BorderSide(color: Colors.black),
                  left: BorderSide(color: Colors.black),
                  right: BorderSide(color: Colors.black),
                )
              ),
              child: MaterialButton(
                minWidth: double.infinity,
                height: 50,
                onPressed: (){
                  // Navigator.of(context).pushNamed(CompleteOrder.routeName);
                  getimage(ImageSource.gallery);
                },
                color: Colors.greenAccent,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)
                ),
                child: Text('Gallary', style: TextStyle(
                  fontWeight: FontWeight.w600, 
                  fontSize: 18,
                  color: Colors.black
                ),),
              ),
            ),
            ],
          );
        });
  }


  Widget getImageWidget(){
    if(_selectedFile!=null){
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.file(
          _selectedFile,
          width: 405,
          height: 228,
          fit: BoxFit.contain
        ),
      );
    }else{
      return Image.asset('assets/images/bag_1.png');
    }
  }

  getimage(ImageSource source)async{
    this.setState(() {
      isLoading =true;
    });
    File image = await ImagePicker.pickImage(source: source); 
    if(image!=null){
      File cropped = await ImageCropper.cropImage(
         sourcePath: image.path,
        aspectRatio: CropAspectRatio(ratioX: 16, ratioY: 9),
        compressQuality: 100,
        maxHeight: 1920,
        maxWidth: 1080,
        compressFormat: ImageCompressFormat.jpg,
        androidUiSettings: AndroidUiSettings(
          backgroundColor: Colors.white,
          toolbarColor: Colors.greenAccent,
          toolbarTitle: 'Customise Your Gift',
          statusBarColor: Colors.grey,
        )
      );
      this.setState(() {
        _selectedFile = cropped;
        int filesize = _selectedFile.lengthSync();
        fileSize = filesize/1000000;
        isLoading = false;
      });
    }else{
      this.setState(() {
      isLoading =false;
    });
    }
  }

  @override
  Widget build(BuildContext context) {
    List<String> mylist = ['https://cocooil.com.au/wp-content/uploads/2017/06/TanningOil_New-600x600.jpg','https://cocooil.com.au/wp-content/uploads/2017/06/TanningOil_New-600x600.jpg','https://cocooil.com.au/wp-content/uploads/2017/06/TanningOil_New-600x600.jpg','https://cocooil.com.au/wp-content/uploads/2017/06/TanningOil_New-600x600.jpg'];
    return Scaffold(
          body: SingleChildScrollView(
              child: Stack(
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height +400,
                      child:Column(
                          children: <Widget>[
                            Headofapp(title: "Bold Alive",subtitle: 'Uplaod Your Custom Image',),
                            
                            SizedBox(height: 10,),
                            CarouselSlider(
                              options: CarouselOptions(
                                    height: 350,
                                    aspectRatio: 16/9,
                                    viewportFraction: 0.8,
                                    initialPage: 0,
                                    enableInfiniteScroll: true,
                                    reverse: false,
                                    autoPlay: true,
                                    autoPlayInterval: Duration(seconds: 3),
                                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                                    autoPlayCurve: Curves.fastOutSlowIn,
                                    enlargeCenterPage: true,
                                    scrollDirection: Axis.horizontal,
                                ),
                              items: mylist.map((i) {
                                return Builder(
                                  builder: (BuildContext context) {
                                    return Container(
                                      width: MediaQuery.of(context).size.width,
                                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                                      decoration: BoxDecoration(
                                        color: Colors.white60
                                      ),
                                      child: Image.network(i)
                                    );
                                  },
                                );
                              }).toList(),
                            ),
                            Container(
                              padding: EdgeInsets.all(15),
                              child: Text(
                                'data SizedBox(height: 10,), SizedBox(height: 10,),SizedBox(height: 10,),SizedBox(height: 10,),',
                                style: TextStyle(fontSize: 16),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(15),
                              child: fileSize!=null ?Text(
                                '${fileSize.toStringAsFixed(2)} Mb',
                                style: TextStyle(fontSize: 16,fontWeight:FontWeight.bold),
                                textAlign: TextAlign.center,
                              ):Text(''),
                            ),
                            getImageWidget(),
                            SizedBox(height: 10,),
                            Container(
                              width: MediaQuery.of(context).size.width*0.4,
                              padding: EdgeInsets.only(top: 3, left: 3),
                              margin: EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                border: Border(
                                  bottom: BorderSide(color: Colors.black),
                                  top: BorderSide(color: Colors.black),
                                  left: BorderSide(color: Colors.black),
                                  right: BorderSide(color: Colors.black),
                                )
                              ),
                              child: MaterialButton(
                                minWidth: double.infinity,
                                height: 50,
                                onPressed:showOptions,
                                color: Colors.white,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50)
                                ),
                                child: fileSize!=null ? Text('Retake Image', style: TextStyle(
                                  fontWeight: FontWeight.w600, 
                                  fontSize: 18,
                                  color: Colors.black
                                ),):Text('Select Image', style: TextStyle(
                                  fontWeight: FontWeight.w600, 
                                  fontSize: 18,
                                  color: Colors.black
                                ),),
                              ),
                            ),
                            fileSize!=null ? Container(
                              width: MediaQuery.of(context).size.width*0.4,
                              padding: EdgeInsets.only(top: 3, left: 3),
                              margin: EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                border: Border(
                                  bottom: BorderSide(color: Colors.black),
                                  top: BorderSide(color: Colors.black),
                                  left: BorderSide(color: Colors.black),
                                  right: BorderSide(color: Colors.black),
                                )
                              ),
                              child: MaterialButton(
                                minWidth: double.infinity,
                                height: 50,
                                onPressed:showOptions,
                                color: Colors.white,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50)
                                ),
                                child: Text('Place Order', style: TextStyle(
                                  fontWeight: FontWeight.w600, 
                                  fontSize: 18,
                                  color: Colors.black
                                ),),
                              ),
                            ):Container(),


                          ],
                      )
                    ),
                    isLoading ? Container(
                      color: Colors.white,
                      height: MediaQuery.of(context).size.height *0.95,
                      child: Center(child: CircularProgressIndicator(backgroundColor: Colors.greenAccent,))
                    ):Center(),
                ],
              )
          ),
    );
  }
}



