import 'package:BoldAlive/loginScreen.dart';
import 'package:BoldAlive/models/ProductProvider.dart';
import 'package:BoldAlive/signupscreen.dart';
import 'package:BoldAlive/welcome.dart';
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
        home: Welcome(),
        routes: {
          HomeScreen.routeName : (ctx) => HomeScreen(),
          LoginScreen.routeName : (ctx) => LoginScreen(),
          SignupScreen.routeName : (ctx) => SignupScreen(),

        },
      ),
    );
  }
}
