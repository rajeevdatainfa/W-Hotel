import 'dart:convert';
import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hotels/screens/AboutActivity.dart';
import 'package:hotels/screens/BusListActivity.dart';
import 'package:hotels/screens/BusScheduleActivity.dart';
import 'package:hotels/screens/FifaActivity.dart';
import 'package:hotels/screens/FoodListActivity.dart';
import 'package:hotels/screens/HelpListActivity.dart';
import 'package:hotels/screens/MenuActivity.dart';
import 'package:hotels/screens/RestaurentListActivity.dart';
import 'package:hotels/screens/RestuarentActivity.dart';
import 'package:hotels/screens/ScheduleActivity.dart';
import 'package:hotels/screens/TrainingActivity.dart';
import 'package:hotels/screens/TrainingListActivity.dart';
import 'package:hotels/screens/WelcomeActivity.dart';
import 'package:hotels/utils/Col.dart';

class MainActivity extends StatefulWidget {


  @override
  HomeActivityView createState() => HomeActivityView();
}

class HomeActivityView extends State<MainActivity> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isLoding = false;
  double defaultFontSize = 14;
  double defaultIconSize = 17;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Container(


          child: Column(
            children: [
              Container(
                height: 180,
                child: Stack(
                  children: [
                    Container(
                      width: width,
                      height: height,
                      color: Col.white,
                      child: Container(
                        height: 130,
                        alignment: Alignment.topCenter,
                        child: Image(
                          image: new AssetImage("assets/images/hader.jpg"),
                          color: null,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.only(top: 35),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            width: 90,
                            child: Image(
                              image: new AssetImage("assets/images/logo.png"),
                              color: null,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                          Container(

                            alignment: Alignment.bottomCenter,
                            padding: EdgeInsets.only(bottom: 10,top: 5),
                            child: Text(
                              "CATEGORIES",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Col.white,
                                  fontFamily:
                                  "RobotoExtraBold"),
                            ),
                          ),


                        ],
                      ),
                    )

                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),

                Expanded(
                  child: SingleChildScrollView(


                    child: Column(
                      children: [
                        Container(
                          child: Card(
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  bottomLeft: Radius.circular(30),
                                  bottomRight: Radius.circular(30),
                                  topRight: Radius.circular(30)),
                            ),
                            margin: EdgeInsets.only(left: 30.0,right: 30),
                            child: Container(
                              height: 260,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: InkWell(
                                      onTap: () {
                                        goToNextPage(context, 0);
                                      },
                                      child: Container(
                                        clipBehavior: Clip.hardEdge,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(30.0),
                                              topLeft: Radius.circular(30.0)),
                                        ),
                                        child: Stack(

                                          children: [
                                            Container(
                                                height: 260,


                                                child: ClipRRect(
                                                  //borderRadius: BorderRadius.circular(15.0),
                                                  child: Image(
                                                    image: new AssetImage(
                                                        "assets/images/welcome.jpeg"),

                                                    color: null,
                                                    fit: BoxFit.fitHeight,

                                                  ),
                                                )),

                                            Container(
                                              height: 260,
                                              color: Col.tranparent,
                                              alignment: Alignment.bottomCenter,
                                              padding: EdgeInsets.only(bottom: 10),
                                              child: Text(
                                                "Welcome Pack",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: Col.white,
                                                    fontFamily:
                                                    "RobotoExtraBold"),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: Container(
                                      height: 260,

                                      child: Column(
                                        children: [
                                          Expanded(

                                            child: Container(
                                              clipBehavior: Clip.hardEdge,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                    topRight: Radius.circular(30.0)),
                                              ),
                                              alignment: Alignment.center,
                                              //color: color,
                                              child: Stack(

                                                children: [
                                                  Container(
                                                      height: 130,
                                                      child: ClipRRect(
                                                        //borderRadius: BorderRadius.circular(15.0),
                                                        child: Image(
                                                          image: new AssetImage(
                                                              "assets/images/ic_outlets.png"),

                                                          color: null,
                                                          fit: BoxFit.fill,
                                                          alignment:
                                                          Alignment
                                                              .center,
                                                        ),
                                                      )
                                                  ),

                                                  Container(
                                                    height: 130,
                                                    color: Col.tranparent,
                                                    alignment: Alignment.bottomCenter,
                                                    padding: EdgeInsets.only(bottom: 6),
                                                    child: Text(
                                                      "Outlets",
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          color: Col.white,
                                                          fontFamily:
                                                          "RobotoExtraBold"),
                                                    ),
                                                  ),


                                                ],
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Expanded(

                                            child: InkWell(

                                              onTap:  () {
                                                goToNextPage(context, 2);
                                              },
                                              child: Container(
                                                clipBehavior: Clip.hardEdge,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.only(
                                                      bottomRight: Radius.circular(30.0)),
                                                ),
                                                alignment: Alignment.center,
                                                //color: color,
                                                child: Stack(

                                                  children: [
                                                    Container(
                                                        height: 130,
                                                        child: ClipRRect(
                                                          //borderRadius: BorderRadius.circular(15.0),
                                                          child: Image(
                                                            image: new AssetImage(
                                                                "assets/images/bus_schedule.jpeg"),

                                                            color: null,
                                                            fit: BoxFit.cover,
                                                            alignment:
                                                            Alignment
                                                                .center,
                                                          ),
                                                        )
                                                    ),

                                                    Container(
                                                      height: 130,
                                                      color: Col.tranparent,
                                                      alignment: Alignment.bottomCenter,
                                                      padding: EdgeInsets.only(bottom: 6),
                                                      child: Text(
                                                        "Bus Schedule",
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            color: Col.white,
                                                            fontFamily:
                                                            "RobotoExtraBold"),
                                                      ),
                                                    ),


                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),

                        SizedBox(
                          width: 5,
                        ),
                        Container(
                          child: Card(
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  bottomLeft: Radius.circular(30),
                                  bottomRight: Radius.circular(30),
                                  topRight: Radius.circular(30)),
                            ),
                            margin: EdgeInsets.only(left: 30.0,right: 30,top: 20,bottom: 20),
                            child: Container(
                              height: 260,
                              child: Row(
                                children: [

                                  Expanded(
                                    child: Container(
                                      height: 260,

                                      child: Column(
                                        children: [
                                          Expanded(

                                            child: InkWell(
                                              onTap: () {
                                                goToNextPage(context, 4);
                                              },
                                              child: Container(
                                                clipBehavior: Clip.hardEdge,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.only(
                                                      topLeft: Radius.circular(30.0)),
                                                ),
                                                alignment: Alignment.center,
                                                //color: color,
                                                child: Stack(

                                                  children: [
                                                    Container(
                                                        height: 130,
                                                        child: ClipRRect(
                                                          //borderRadius: BorderRadius.circular(15.0),
                                                          child: Image(
                                                            image: new AssetImage(
                                                                "assets/images/menu.jpeg"),

                                                            color: null,
                                                            fit: BoxFit.fill,
                                                            alignment:
                                                            Alignment
                                                                .center,
                                                          ),
                                                        )
                                                    ),

                                                    Container(
                                                      height: 130,
                                                      color: Col.tranparent,
                                                      alignment: Alignment.bottomCenter,
                                                      padding: EdgeInsets.only(bottom: 6),
                                                      child: Text(
                                                        "Menu",
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            color: Col.white,
                                                            fontFamily:
                                                            "RobotoExtraBold"),
                                                      ),
                                                    ),


                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Expanded(

                                            child: InkWell(
                                              onTap: () {
                                                goToNextPage(context, 5);
                                              },
                                              child: Container(
                                                clipBehavior: Clip.hardEdge,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.only(
                                                      bottomLeft: Radius.circular(30.0)),
                                                ),
                                                alignment: Alignment.center,
                                                //color: color,
                                                child: Stack(

                                                  children: [
                                                    Container(
                                                        height: 130,
                                                        child: ClipRRect(
                                                          //borderRadius: BorderRadius.circular(15.0),
                                                          child: Image(
                                                            image: new AssetImage(
                                                                "assets/images/ic_food.jpeg"),

                                                            color: null,
                                                            fit: BoxFit.cover,
                                                            alignment:
                                                            Alignment
                                                                .center,
                                                          ),
                                                        )
                                                    ),

                                                    Container(
                                                      height: 130,
                                                      color: Col.tranparent,
                                                      alignment: Alignment.bottomCenter,
                                                      padding: EdgeInsets.only(bottom: 6),
                                                      child: Text(
                                                        "Food Safety",
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            color: Col.white,
                                                            fontFamily:
                                                            "RobotoExtraBold"),
                                                      ),
                                                    ),


                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: InkWell(
                                      onTap: () {
                                        goToNextPage(context, 6);
                                      },
                                      child: Container(
                                        clipBehavior: Clip.hardEdge,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              bottomRight: Radius.circular(30.0),
                                              topRight: Radius.circular(30.0)),
                                        ),
                                        child: Stack(

                                          children: [
                                            Container(
                                                height: 260,


                                                child: ClipRRect(
                                                  //borderRadius: BorderRadius.circular(15.0),
                                                  child: Image(
                                                    image: new AssetImage(
                                                        "assets/images/taining.jpeg"),

                                                    color: null,
                                                    fit: BoxFit.fitHeight,

                                                  ),
                                                )),

                                            Container(
                                              height: 260,
                                              color: Col.tranparent,
                                              alignment: Alignment.bottomCenter,
                                              padding: EdgeInsets.only(bottom: 10),
                                              child: Text(
                                                "Training",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: Col.white,
                                                    fontFamily:
                                                    "RobotoExtraBold"),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),

                                ],
                              ),
                            ),
                          ),
                        ),

                        Container(
                          child: InkWell(
                            onTap: () {
                              goToNextPage(context, 7);
                            },
                            child: Card(
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(30),
                                    topRight: Radius.circular(30)),
                              ),
                              margin: EdgeInsets.only(left: 30.0,right: 30),
                              child: Container(
                                height: 130,
                                child:  Expanded(
                                  child: Container(
                                    clipBehavior: Clip.hardEdge,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(30.0),
                                          topLeft: Radius.circular(30.0)),
                                    ),
                                    child: Stack(

                                      children: [
                                        Container(
                                            width: width,
                                            child: ClipRRect(
                                              //borderRadius: BorderRadius.circular(15.0),
                                              child: Image(
                                                image: new AssetImage(
                                                    "assets/images/ic_sos.jpg"),

                                                color: null,
                                                fit: BoxFit.fitWidth,

                                              ),
                                            )),

                                        Container(
                                          height: 130,
                                          color: Col.tranparent2,
                                          alignment: Alignment.bottomCenter,
                                          padding: EdgeInsets.only(bottom: 2),
                                          child: Text(
                                            "Important Announcements",
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Col.white,
                                                fontFamily:
                                                "RobotoExtraBold"),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),

                        SizedBox(
                          height: 15,
                        ),

                      ],
                    ),
                  ),
                ),

            ],
          ),
        ),
      ),
    );
  }

  Widget _addAmountLayout(BuildContext context, int index, String text,
      String desc, String icon, Color color) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 8, bottom: 8),
      child: Column(
        children: [
          Expanded(
            child: GestureDetector(
                child: InkWell(
              onTap: () {
                goToNextPage(context, index);
              },
              child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  color: Col.white_background,
                ),
                child: Container(
                  alignment: Alignment.center,
                  //color: color,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          /*decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                gradient: LinearGradient(
                                  begin: Alignment(0,-1),
                                  end: Alignment(0.0, 0.0),
                                  colors: [
                                    Col.white.withOpacity(0.2),
                                    Col.white.withOpacity(0.2),
                                    Col.primary_dark.withOpacity(0.3),
                                  ],

                                ),
                                //borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10),)
                              ),*/
                          padding: EdgeInsets.all(3.0),
                          child: ClipRRect(
                            //borderRadius: BorderRadius.circular(15.0),
                            child: Image(
                              image: new AssetImage(icon),
                              width: 50,
                              height: 50,
                              color: null,
                              fit: BoxFit.fill,
                              alignment: Alignment.center,
                            ),
                          )),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        text,
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                            color: Col.primary_black,
                            fontFamily: "RobotoExtraBold"),
                      ),
                    ],
                  ),
                ),
              ),
            )),
          ),
          /*Container(
            padding: EdgeInsets.only(top: 8,bottom: 10),
            child: Text(
            desc,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 10,
              color: Col.primary_black,
            ),
          ),)*/
        ],
      ),
    );
  }

  Future<bool> isConnected() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        print('connected');
        return true;
      } else {
        return false;
      }
    } on SocketException catch (_) {
      print('not connected');

      return false;
    }
  }

  showLoaderDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: new Row(
        children: [
          CircularProgressIndicator(),
          Container(
              margin: EdgeInsets.only(left: 7), child: Text("Loading...")),
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
}

goToNextPage(BuildContext context, int intex) async {
  print("goToNextPage");

  if (intex == 0) {
    // Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(builder: (context) => FifaActivity(url: "https://w-hotels.marriott.com/",)));
    Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(
        builder: (context) => WelcomeActivity()));
    //builder: (context) => FifaActivity(url: "https://www.fifa.com/fifaplus/en/tournaments/mens/worldcup/qatar2022",)));
  } else if (intex == 1) {
    //  Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(builder: (context) => MenuActivity()));
    //Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(builder: (context) => FifaActivity(url: "https://www.tripadvisor.in/Hotels-g294009-Doha-Hotels.html",)));
  } else if (intex == 2) {
   // Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(builder: (context) => BusScheduleActivity()));
    Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(builder: (context) => BusListActivity()));

  } else if (intex == 3) {
    //  Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(builder: (context) => FifaActivity(url: "https://www.fifa.com/fifaplus/en/tournaments/mens/worldcup/qatar2022",)));

  }
  else if (intex == 4) {
    //Food
    //Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(builder: (context) => RestaurentActivity()));
     Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(builder: (context) => RestaurentListActivity()));
    //Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(builder: (context) => FifaActivity(url: "https://www.tripadvisor.in/Hotels-g294009-Doha-Hotels.html",)));
  }else if (intex == 6) {
    //Food
    Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(builder: (context) => TrainingListActivity()));
    // Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(builder: (context) => ScheduleActivity()));
    //Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(builder: (context) => FifaActivity(url: "https://www.tripadvisor.in/Hotels-g294009-Doha-Hotels.html",)));
  }else if (intex == 5) {
    Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(builder: (context) => FoodListActivity()));
    //Food
    //Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(builder: (context) => RestaurentActivity()));
    // Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(builder: (context) => ScheduleActivity()));
    //Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(builder: (context) => FifaActivity(url: "https://www.tripadvisor.in/Hotels-g294009-Doha-Hotels.html",)));
  }
  else if (intex == 7) {
    Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(builder: (context) => HelpListActivity()));
    //Food
    //Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(builder: (context) => RestaurentActivity()));
    // Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(builder: (context) => ScheduleActivity()));
    //Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(builder: (context) => FifaActivity(url: "https://www.tripadvisor.in/Hotels-g294009-Doha-Hotels.html",)));
  }else {}
}
