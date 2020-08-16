import 'package:BoldAlive/loginScreen.dart';
import 'package:BoldAlive/models/ProductProvider.dart';
import 'package:BoldAlive/models/cart.dart';
import 'package:BoldAlive/models/orders.dart';
import 'package:BoldAlive/screens/checkout/completeoder.dart';
import 'package:BoldAlive/screens/edit/editScreen.dart';
import 'package:BoldAlive/screens/edit/editsceond.dart';
import 'package:BoldAlive/screens/edit/filldetails.dart';
import 'package:BoldAlive/screens/edit/offerings/hoodie.dart';
import 'package:BoldAlive/screens/edit/offerings/kitchen.dart';
import 'package:BoldAlive/screens/edit/offerings/mugs.dart';
import 'package:BoldAlive/screens/edit/uploadImage.dart';
import 'package:BoldAlive/screens/widgets/cartScreen.dart';
import 'package:BoldAlive/screens/widgets/orderpage.dart';
import 'package:BoldAlive/signupscreen.dart';
import 'package:BoldAlive/welcome.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './constants.dart';
import './screens/home/home_screen.dart';
import './screens/edit/chips.dart';
import './models/orders.dart';
import 'screens/details/components/placeorder.dart';
import 'screens/edit/offerings/phone.dart';
import 'screens/edit/offerings/photo.dart';
import 'screens/edit/offerings/shirts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
          providers: [
            ChangeNotifierProvider.value(value: ProductModel(),),
            ChangeNotifierProvider.value(value: Cart(),),
            ChangeNotifierProvider.value(value: Orders(),),
            
          ],
          child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextColor),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: LoginApp(),
        routes: {
          HomeScreen.routeName : (ctx) => HomeScreen(),
          Welcome.routeName : (ctx) => Welcome(),
          LoginScreen.routeName : (ctx) => LoginScreen(),
          SignupScreen.routeName : (ctx) => SignupScreen(),
          CartScreen.routeName : (ctx) => CartScreen(),
          OrderPage.routeName : (ctx) => OrderPage(),
          EditScreen.routeName :(ctx) => EditScreen(),
          EditSceond.routeName : (ctx) => EditSceond(),
          UploadImage.routeName :(ctx) => UploadImage(),
          CompleteOrder.routeName :(ctx) => CompleteOrder(),
          FillDetails.routeName :(ctx) => FillDetails(),
          Chips.routeName : (ctx) => Chips(),
          Placeorder.routeName : (ctx) => Placeorder(),

          //the various screen for conditional rendering
          Hoodie.routeName : (ctx) => Hoodie(),
          Kitchen.routeName : (ctx) => Kitchen(),
          Mugs.routeName : (ctx) => Mugs(),
          Phone.routeName : (ctx) => Phone(),
          Photo.routeName : (ctx) => Photo(),
          Shirts.routeName : (ctx) => Shirts(),
                    
        },
      ),
    );
  }
}

class LoginApp extends StatefulWidget {
  @override
  _LoginAppState createState() => _LoginAppState();
}

class _LoginAppState extends State<LoginApp> {
  @override
  Widget build(BuildContext context) {
    return Container(
          child:
          StreamBuilder(
            stream: FirebaseAuth.instance.onAuthStateChanged,
            builder: (ctx,usersnapshot){
              CircularProgressIndicator();
              if(usersnapshot.hasData){
                return HomeScreen();
              }
              return Welcome();
            },
          ),
           
    );
  }
}
