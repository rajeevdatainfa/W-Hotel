import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hotels/screens/SplashActivity.dart';
import 'package:hotels/screens/SplashSliderActivity.dart';
import 'package:hotels/utils/Col.dart';
import 'screens/root_app.dart';
import 'theme/color.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hotel Booking',
      theme: ThemeData(
        primaryColor: primary,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {


  @override
  State<MyHomePage> createState() => SplashScreenState();
}



class SplashScreenState extends State<MyHomePage>{


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    loadData();

  }


  @override
  Widget build(BuildContext context) {


    var width = MediaQuery.of(context).size.width;
    var height =MediaQuery.of(context).size.height;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(

          body: Container(
            color: Col.primary_color,

            child: SafeArea(

              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                          margin: EdgeInsets.all(80),
                          child: Image(
                            image: AssetImage("assets/images/logo.png"),
                            fit: BoxFit.fitWidth,

                          )
                      ),
                    ),
                  ]
              ),

            ),
          )),

    );
  }

  Future<Timer> loadData() async {
    return Timer(Duration(seconds: 2), goToNextPage);

  }


  goToNextPage() async {
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> SplashActivity()));
    //Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> SplashSliderActivity()));
  }


}
