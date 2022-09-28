import 'dart:convert';
import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hotels/screens/AboutActivity.dart';
import 'package:hotels/screens/FifaActivity.dart';
import 'package:hotels/screens/MainActivity.dart';
import 'package:hotels/screens/MenuActivity.dart';
import 'package:hotels/screens/ScheduleActivity.dart';
import 'package:hotels/utils/Col.dart';

class LandingActivity extends StatefulWidget {
  @override
  LandingActivityView createState() => LandingActivityView();
}

class LandingActivityView extends State<LandingActivity> {
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
          /*decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/splash.png"),
              fit: BoxFit.cover,
            ),
          ),*/
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
                //color: Col.white_t1,
                /*decoration: BoxDecoration(
                  image:  DecorationImage(
                    image: AssetImage("assets/images/login.png"),
                    fit: BoxFit.fill,
                  ),

                ),*/
                child: Container(
                  child: Column(
                    children: [
                      Container(
                          child: InkWell(
                            child: Container(
                              padding: EdgeInsets.only(left: 20,top: 20),
                              /*child: Align(
                                alignment: Alignment.topLeft,
                                child: Icon(Icons.menu,color: Col.white,),
                              ),*/
                            ),
                            onTap: () {
                             // Navigator.pop(context);
                            },
                      ),),

                      Flexible(
                          child: Container(
                           margin: EdgeInsets.only(top: 35),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  width: 120,
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
                                    "",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Col.white,
                                        fontFamily:
                                        "RobotoExtraBold"),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Expanded(
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            goToNextPage(context, 0);
                                          },
                                          child: Container(
                                            width: width,
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
                                                height: 190,
                                                child: Stack(

                                                  children: [
                                                    Container(
                                                        height: 190,

                                                        width: width,
                                                        child: ClipRRect(
                                                          borderRadius: BorderRadius.circular(30.0),
                                                          child: Image(
                                                            image: new AssetImage(
                                                                "assets/images/background_card.png"),

                                                            color: null,
                                                            fit: BoxFit.fill,

                                                          ),
                                                        )),
                                                    Container(

                                                      alignment: Alignment.center,
                                                      padding: EdgeInsets.only(right: 1),
                                                      child: Text(
                                                        "HCMC",
                                                        style: TextStyle(
                                                            fontSize: 30,
                                                            color: Col.white,
                                                            fontFamily:
                                                            "RobotoBold"),
                                                      ),
                                                    ),
                                                  ],

                                                ),
                                              ),
                                            ),
                                          ),
                                        ),

                                        Container(

                                          alignment: Alignment.center,
                                          padding: EdgeInsets.only(bottom: 6,top: 6),
                                          child: Text(
                                            "Host Country Media Center at Msheire",
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Col.primary_black,
                                                fontFamily:
                                                "RobotoRegular"),
                                          ),
                                        ),

                                        SizedBox(
                                          height: 40,
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
                                            margin: EdgeInsets.only(left: 30.0,right: 30),
                                            child: Container(
                                              height: 190,
                                              child: Stack(

                                                children: [
                                                  Container(
                                                      height: 190,

                                                      width: width,
                                                      child: ClipRRect(
                                                        borderRadius: BorderRadius.circular(30.0),
                                                        child: Image(
                                                          image: new AssetImage(
                                                              "assets/images/background_card.png"),

                                                          color: null,
                                                          fit: BoxFit.fill,

                                                        ),
                                                      )),
                                                  Container(

                                                    alignment: Alignment.center,
                                                    padding: EdgeInsets.only(right: 1),
                                                    child: Text(
                                                      "IBC/MMC",
                                                      style: TextStyle(
                                                          fontSize: 30,
                                                          color: Col.white,
                                                          fontFamily:
                                                          "RobotoBold"),
                                                    ),
                                                  ),
                                                ],

                                              ),
                                            ),
                                          ),
                                        ),


                                        Container(

                                          width: width,
                                          alignment: Alignment.center,
                                          padding: EdgeInsets.only(bottom: 6,top: 6,left: 40,right:40),
                                          child: Text(
                                            "International Broadcasters Center (IBC/Main Media Center MMC) at QNCC",
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Col.primary_black,
                                                fontFamily:
                                                "RobotoRegular"),
                                          ),
                                        ),


                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 2,
                                ),


                                /*Container(
                                      alignment: Alignment.bottomCenter,
                                      width: MediaQuery.of(context).size.width,


                                      padding: EdgeInsets.only(
                                          left: 20, top: 5, right: 20, bottom: 20),
                                      // child: Text(catDetails.catTitle,
                                      child: GridView.count(
                                        scrollDirection: Axis.vertical,
                                        shrinkWrap: true,
                                        crossAxisCount: 2,
                                        childAspectRatio: 1.4,
                                        primary: false,
                                        padding: const EdgeInsets.all(12),
                                        children: [
                                          _addAmountLayout(context,0,"WElCOME PACK","Book your hotel", "assets/images/ic_welcome.png",Col.s1),
                                          _addAmountLayout(context,1,"B&F OUTLET","Scan to open", "assets/images/ic_welcome.png",Col.s2),
                                          _addAmountLayout(context,2,"BUS SCHEDULE","City of Qatar", "assets/images/ic_bus.png",Col.s3),
                                          _addAmountLayout(context,3,"MENU","Looking for create history", "assets/images/ic_menu.png",Col.s4),
                                          _addAmountLayout(context,4,"FOOD SAFETY","Make yourself", "assets/images/ic_food_safety.png",Col.s2),
                                          _addAmountLayout(context,5,"TRAINING","Check match schedules", "assets/images/ic_training.png",Col.s5),
                                          _addAmountLayout(context,5,"SOPS","Check match schedules", "assets/images/ic_sop.png",Col.s5),



                                        ],

                                      ),
                                    ),*/
                              
                            ],
                        ),
                      )),
                     /* Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          Text(
                            "Sponsored by",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 10,
                                color: Col.primary_black,
                                fontFamily: "RobotoSemiBold"),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                              height: 22,
                              padding: EdgeInsets.all(3.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(2.0),
                                child: Image(
                                  image: new AssetImage(
                                      "assets/images/ic_footer.png"),
                                  color: null,
                                  fit: BoxFit.fitHeight,
                                  alignment: Alignment.center,
                                ),
                              )),
                        ],
                      )*/
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
    Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(builder: (context) => MainActivity()));

  }  else {}
}
