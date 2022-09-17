import 'dart:convert';
import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hotels/utils/Col.dart';




class HomeActivity extends StatefulWidget {


  @override
  HomeActivityView createState() =>HomeActivityView();
}

class HomeActivityView extends State<HomeActivity> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isLoding = false;
  double defaultFontSize = 14;
  double defaultIconSize = 17;
  final List<String> _list = ["Meeting & conferences","Online programs","Abstracts and presentations","Public education","Event callender"];

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
         /* decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/splash.png"),
              fit: BoxFit.cover,
            ),
          ),*/
          child: Container(
            //color: Col.white_t1,
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


                Container(
                  width: width,
                  height: 2,
                  alignment: Alignment.center,

                ),
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
                            alignment: Alignment.centerLeft,
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.only(
                                left: 2, top: 2, right: 2, bottom: 2),
                            // child: Text(catDetails.catTitle,
                            child:Container(
                              margin: EdgeInsets.only(left: 12,right: 12,bottom: 20),
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  padding: EdgeInsets.zero,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: _list.length,
                                  itemBuilder: (BuildContext context, int index) {
                                    return _tile(_list[index], context, index);
                                  }),
                            ),
                          ),
                          SizedBox(
                            height: 35,
                          ),



                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),

    );
  }

  GridTile _tile(String? name,BuildContext context,int index) => GridTile(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius:
          BorderRadius.circular(10.0),
        ),
        elevation:1,

        child: Container(

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              gradient: LinearGradient(
                begin: Alignment(0,-1),
                end: Alignment(0.0, 0.0),
                colors: [
                  Col.white_bg,
                  Col.white_bg,
                ],

              ),
              //borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10),)
            ),


            padding: EdgeInsets.all(10),

            child: Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(right: 3,left: 10),
              child: Row(

                children: [
                  Expanded(
                    child: Text(name.toString(),
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 20,
                            fontFamily: "RobotoMedium",
                            color: Col.primary_black_light)),
                  ),
                  InkWell(
                    onTap: () {
                      goToNextPage(context, index,name.toString());
                    },
                    child: Container(
                      width: 40,
                      height: 40,
                      alignment: Alignment.center,
                      decoration: new BoxDecoration(
                        color: Col.primary_blue,

                        shape: BoxShape.circle,
                      ),

                      child: Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: Container(
                            width: 40,
                            height: 40,
                            decoration: new BoxDecoration(
                              color: Col.white_bg,

                              shape: BoxShape.circle,
                            ),
                            child: Icon(Icons.arrow_forward,color: Col.primary_blue,size: 30,)),
                      ),

                    ),
                  ),

                ],

              ),

            ),
        ),
      )

  );

  Widget _addAmountLayout(BuildContext context, int index,String text,String desc,String icon,Color color) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Column(
        children: [
          Expanded(
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius:
                BorderRadius.circular(2.0),
              ),
              elevation:1,
              child: GestureDetector(
                  child: InkWell(
                    onTap: () {
                      //goToNextPage(context, index);
                    },
                    child: Container(

                      child: Container(
                        alignment: Alignment.center,
                        color: color,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ImageIcon(AssetImage(icon),size: 120,color: Col.primary_blue,),
                            SizedBox(height: 8,),

                            Text(
                              text,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: Col.primary_black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 8,bottom: 10),
            child: Text(
            desc,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 10,
              color: Col.primary_black,
            ),
          ),)
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

goToNextPage(BuildContext context, int type,String title) async {
  print("goToNextPage");

  if (type ==0) {
    //Navigator.of(context).push(MaterialPageRoute(builder: (context)=> PlanListActivity()));
    //Navigator.of(context).push(MaterialPageRoute(builder: (context)=> ItemMeetingActivity()));

  }else  if (type ==3) {
    //Navigator.of(context).push(MaterialPageRoute(builder: (context) => ItemEducationActivity()));
    //Navigator.of(context).push(MaterialPageRoute(builder: (context) => ItemListEducationActivity()));

  }

  else {
    //Navigator.of(context).push(MaterialPageRoute(builder: (context)=> BlankMenuActivity(title: title,)));
    //showToast("Coming soon..");
    //Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(builder: (context) => DashboardActivity()));
  }
}
