import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hotels/model/Slider.dart';
import 'package:hotels/screens/HomeActivity.dart';
import 'package:hotels/screens/LoginActivity.dart';
import 'package:hotels/screens/MainActivity.dart';
import 'package:hotels/screens/SplashSliderActivity.dart';
import 'package:hotels/utils/Col.dart';


class SplashActivity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      debugShowCheckedModeBanner: false,
      /*home:Container(
      color: Colors.green,
      child: Center(child: Text("Screen 1")),
    ),*/
      home: MyHomePage(),
      theme: ThemeData(
          // fontFamily: 'Roboto',
          primaryColor: Col.primary_dark,
          primaryColorDark: Col.primary_dark,
          backgroundColor: Col.primary_white),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MainScreen();
  }
}

class MainScreen extends State<MyHomePage> {
  late String vaga_name;
  String pId = "",
      cityName = "";

  String location_name = "City";
  bool isExpended = false;
  bool isAddressChanged = false;

  bool isConnect = true;
  bool isNext = true;
  int dPosition = 0;


  String messageTitle = "Empty";
  String notificationAlert = "alert";


  @override
  void initState() {
    super.initState();

    loadData();
  }


  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            backgroundColor: Col.white,
            // drawer: DrawerWidget(),
            body: SafeArea(
              child: Container(
                /*decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/Container(
            width: width,
            child: Image(
              image: new AssetImage("assets/images/loading_login.gif"),
              color: null,
              fit: BoxFit.fill,
            ),.gif"),
                    fit: BoxFit.cover,
                  ),
                ),*/
                child: Container(

                    child: Container(
                      width: width,
                      child: Image(
                        image: new AssetImage("assets/images/splash.gif"),
                        color: null,
                        fit: BoxFit.fill,
                      ),
                    )


                ),
              ),
            )));
  }


  Future<Timer> loadData() async {
    return Timer(Duration(milliseconds: 6200), goToNext);
  }

  goToNext() async {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => LoginActivity(isAddListing: true,)));
    //Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> SplashSliderActivity()));
  }


  goToNextPage(BuildContext context, int intdex) async {
    if (intdex == 2) {
      //Navigator.of(context,rootNavigator: true).push(MaterialPageRoute(builder: (context)=> MainActivity()));
      Navigator.of(context, rootNavigator: true).push(
          MaterialPageRoute(builder: (context) => SplashSliderActivity()));
    } else if (intdex == 0) {
      // Navigator.of(context,rootNavigator: true).push(MaterialPageRoute(builder: (context)=> MyFamilyActivity()));
    }
    //Navigator.of(context,rootNavigator: true).pushReplacement(MaterialPageRoute(builder: (context)=> SubCatListDetailsActivity()));
  }

  showLoaderDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: new Row(
        children: [
          CircularProgressIndicator(),
          Container(
              margin: EdgeInsets.only(left: 7),
              child: Text("No Internet Connection!")),
        ],
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  showNoInterNetDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
        content: Container(
          padding: EdgeInsets.only(top: 2, bottom: 2),
          color: Color(0x0),
          child: Container(
            height: 150,
            width: 200,
            decoration: BoxDecoration(
                color: Color.fromRGBO(153, 153, 153, 90),
                borderRadius: BorderRadius.circular(6)),
            margin: EdgeInsets.all(20.0),
            padding: EdgeInsets.only(left: 2, top: 2, bottom: 2, right: 2),
            child: Column(
              children: [
                Text("No Internet Connection!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: Colors.black)),
                InkWell(
                  onTap: () {},
                  //isConnected();

                  child: Container(
                    margin: EdgeInsets.only(top: 50),
                    height: 50,
                    width: 140,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black54.withOpacity(0.3),
                          offset: Offset(-5.0, -5.0),
                          blurRadius: 10.0,
                        ),
                        BoxShadow(
                          color: Colors.white30.withOpacity(0.3),
                          offset: Offset(5.0, 5.0),
                          blurRadius: 10.0,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xFFA1A1A1),
                    ),
                    child: Center(
                      child: Text(
                        "OK",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  /*void showToast(String massage) {
  Fluttertoast.showToast(
      msg: massage,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.grey,
      textColor: Colors.white,
      fontSize: 16.0);
}*/
}