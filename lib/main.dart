import 'package:BoldAlive/loginScreen.dart';
import 'package:BoldAlive/models/ProductProvider.dart';
import 'package:BoldAlive/signupscreen.dart';
import 'package:BoldAlive/welcome.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './constants.dart';
import './screens/home/home_screen.dart';

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
