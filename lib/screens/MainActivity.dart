import 'dart:convert';
import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hotels/screens/AboutActivity.dart';
import 'package:hotels/screens/FifaActivity.dart';
import 'package:hotels/screens/MenuActivity.dart';
import 'package:hotels/screens/ScheduleActivity.dart';
import 'package:hotels/utils/Col.dart';



class MainActivity extends StatefulWidget {


  @override
  HomeActivityView createState() =>HomeActivityView();
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
          /*decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/splash.png"),
              fit: BoxFit.cover,
            ),
          ),*/
          child: Container(
            //color: Col.white_t1,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    //"https://nld.mediacdn.vn/291774122806476800/2022/4/1/screen-shot-2022-04-01-at-81629-am-16487758596331987628915.png",scale: 1.0),
                    "https://img.freepik.com/premium-vector/fifa-world-cup-qatar-2022-logo-stylized-vector-isolated-illustration-with-football_633888-121.jpg?w=2000",scale: 1.0),
                    //"https://c8.alamy.com/comp/2F7FRM2/official-fifa-world-cup-qatar-2022-logo-2F7FRM2.jpg",scale: 1.0),
                fit: BoxFit.fill,
              ),

            ),
            child: Container(
              color: Col.tranparent,
              child: Column(
                children: [
                  Container(
                      /*child: InkWell(
                      child: Container(
                        padding: EdgeInsets.only(left: 10,top: 10),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Icon(Icons.arrow_back_outlined,color: Col.white,),
                        ),
                      ),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),*/
                      ),


                 /* Container(
                    width: width,
                    height: 60,
                    alignment: Alignment.center,
                    child:
                    Container(

                        height: 40,
                        child: Text(
                          "W Fifa",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 36,
                            color: Col.primary_dark,
                            fontFamily: "RobotoExtraBold",
                            fontStyle: FontStyle.normal,
                          ),
                        ),),
                  ),*/
                  Flexible(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              alignment: Alignment.center,
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height,

                              padding: EdgeInsets.only(
                                  left: 2, top: 5, right: 2, bottom: 220),
                              // child: Text(catDetails.catTitle,
                              child: GridView.count(
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                crossAxisCount: 2,
                                childAspectRatio: 1.2,
                                primary: false,
                                padding: const EdgeInsets.all(12),
                                children: [
                                  _addAmountLayout(context,0,"W Hotel","Book your hotel", "assets/images/ic_w_hotel.jpg",Col.s1),
                                  _addAmountLayout(context,1,"Menus","Scan to open", "assets/images/ic_res_menues.jpg",Col.s2),
                                  _addAmountLayout(context,2,"Doha","City of Qatar", "assets/images/ic_doha.jpg",Col.s3),
                                  _addAmountLayout(context,3,"Fifa","Looking for create history", "assets/images/ic_fifa.jpg",Col.s4),
                                  _addAmountLayout(context,4,"Training","Make yourself", "assets/images/ic_training_pic2.png",Col.s2),
                                  _addAmountLayout(context,5,"Schedule","Check match schedules", "assets/images/ic_sc2.png",Col.s5),



                                ],

                              ),
                            ),
                            SizedBox(
                              height: 35,
                            ),





                          ],
                        ),
                      ),
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Text(
                        "Sponsored by",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 10,
                            color: Col.primary_black,
                            fontFamily: "RobotoSemiBold"
                        ),
                      ),

                      SizedBox(height: 5,),

                      Container(
                          height: 22,
                          padding: EdgeInsets.all(3.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(2.0),
                            child: Image(
                              image: new AssetImage("assets/images/ic_footer.png"),

                              color: null,
                              fit: BoxFit.fitHeight,
                              alignment: Alignment.center,

                            ),
                          )




                      ),



                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),

    );
  }


  Widget _addAmountLayout(BuildContext context, int index,String text,String desc,String icon,Color color) {
    return Padding(
      padding: const EdgeInsets.only(left: 50,right: 50,top: 10,bottom: 10),
      child: Column(
        children: [
          Expanded(
            child: GestureDetector(
                child: InkWell(
                  onTap: () {
                    goToNextPage(context, index);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      color: Col.wt2,

                    ),

                    child: Container(
                      alignment: Alignment.center,
                      //color: color,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              decoration: BoxDecoration(
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
                              ),
                              padding: EdgeInsets.all(3.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15.0),
                                child: Image(
                                  image: new AssetImage(icon),
                                  width: 50,
                                  height: 50,
                                  color: null,
                                  fit: BoxFit.fill,
                                  alignment: Alignment.center,

                                ),
                              )




                          ),
                          SizedBox(height: 8,),

                          Text(
                            text,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: Col.primary_black,
                              fontFamily: "RobotoExtraBold"
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
            ),
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
    Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(builder: (context) => FifaActivity(url: "https://w-hotels.marriott.com/",)));
  }else if(intex == 1){

    Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(builder: (context) => MenuActivity()));
  //Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(builder: (context) => FifaActivity(url: "https://www.tripadvisor.in/Hotels-g294009-Doha-Hotels.html",)));
  }
  else if(intex == 2){

    Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(builder: (context) => AboutActivity()));

  }
  else if(intex == 3){
    Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(builder: (context) => FifaActivity(url: "https://www.fifa.com/fifaplus/en/tournaments/mens/worldcup/qatar2022",)));

  }
  else if(intex == 5){

    Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(builder: (context) => ScheduleActivity()));
    //Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(builder: (context) => FifaActivity(url: "https://www.tripadvisor.in/Hotels-g294009-Doha-Hotels.html",)));
  }else {

  }
}
