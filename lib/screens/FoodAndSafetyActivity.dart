import 'dart:convert';
import 'dart:async';
import 'dart:io';


import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:hotels/api/Apis.dart';
import 'package:hotels/model/RestaurentItem.dart';
import 'package:hotels/screens/AboutActivity.dart';
import 'package:hotels/screens/FifaActivity.dart';
import 'package:hotels/screens/FoodDetailsActivity.dart';
import 'package:hotels/screens/root_app.dart';
import 'package:hotels/utils/App.dart';
import 'package:hotels/utils/Col.dart';
import 'package:hotels/utils/Cons.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class FoodAndSafetyActivity extends StatefulWidget {

  String url="";
  String tName="";

  FoodAndSafetyActivity({Key? key, required this.url, required this.tName}) : super(key: key);

  @override
  FoodAndSafetyActivityView createState() =>FoodAndSafetyActivityView();
}

class FoodAndSafetyActivityView extends State<FoodAndSafetyActivity> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isLoding = false;
  double defaultFontSize = 14;
  double defaultIconSize = 17;
  bool isConnect = true;
  bool isLoaded = false;
  List<RestaurentItem> _restaurentList = [];

  String tName="";


  int? pages = 0;
  int? currentPage = 0;
  bool isReady = false;
  String errorMessage = '';
  bool exists = true;
  bool pdfReady = false;
  String urlPDFPath = "";



  @override
  void initState() {

    super.initState();

    isConnected().then((intenet) {
      if (intenet != null && intenet) {
        //showLoaderDialog(context);

        setState(() {
          isLoaded = true;
        });

        getRestaurentList();
      } else {
        showToast("No Internet connection");
      }
    });



  }


  @override
  Widget build(BuildContext context) {

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Col.primary_blue,
        title: Text(widget.tName, style: TextStyle(fontSize: 20.0, color: Colors.white),),
        toolbarHeight: 70,
      ),
      body: SafeArea(
        child: Container(
         /* decoration: BoxDecoration(
            image: DecorationImage(
              //image: AssetImage("assets/images/menu_orders.jpg"),
              image: AssetImage("assets/images/m1.png"),
              fit: BoxFit.cover,
            ),
          ),*/
          child: isLoaded==false? Container(
              color: Col.white_bg,
              height: height,
              margin: EdgeInsets.only(left: 15.0,right: 15),

              child: Column(
                children: [

                  Container(
                    height: 10,


                  ),

                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Container(
                          child: SfPdfViewer.asset(
                              widget.url,
                              canShowScrollHead: false,
                              canShowScrollStatus: false)),

                    )
                  ),
                ],
              ),
          ): Container(
            width: width,
            height: height,
            color: Col.white,
            child: Container(
              height: 200,

              alignment: Alignment.center,
              child: Image(
                image: new AssetImage("assets/images/loader.gif"),
                color: null,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
      ),

    );
  }


  Future getTrainingList() async {

    Map map = {
      "uid":App.getString(Cons.aToken),

    };

    var header = {
      "Content-Type":"application/json",
      "Authorization":"Bearer "+App.getString(Cons.aToken)

    };

    print("request =====: " + map.toString() + "");


    try {
      var response = await http.get(Uri.parse(Apis.restaurant),headers: {
        "Authorization":"Bearer "+App.getString(Cons.aToken)

      } );

      if (response.statusCode == 200) {
        print("response =====: " + response.body.toString() + "");
        try {

          Map<String,dynamic> parsed = json.decode(response.body);
          RestaurentRes res = RestaurentRes.fromJson(parsed);
          setState(() {
            _restaurentList.clear();

            _restaurentList.addAll(res.data!);
          });

          setState(() {
            isLoaded = false;
          });


        }on Exception catch (e){
          setState(() {
            isLoaded = false;
          });
          print('Exception=== ' + e.toString());
        }




      }else{
        setState(() {
          isLoaded = false;
        });
      }
    } on Exception catch (e) {
      print('Exception==' + e.toString());

      setState(() {
        isLoaded = false;
      });
    }


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


  void _isConnected() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        print('connecte bool isConnect = true;d');
        setState(() {
          isConnect = true;
        });
      }
      else{
        setState(() {
          isConnect = false;
        });
        showToast("No Internet connection!");
      }
    } on SocketException catch (_) {
      // showToast("No Internet Connection!");
      setState(() {
        isConnect = false;
      });
      showToast("No Internet connection!");
      print('not connected');
    }
  }


  Future getRestaurentList() async {

    Map map = {
      "uid":App.getString(Cons.aToken),

    };

    var header = {
      "Content-Type":"application/json",
      "Authorization":"Bearer "+App.getString(Cons.aToken)

    };

    print("request =====: " + map.toString() + "");


      try {
        var response = await http.get(Uri.parse(Apis.restaurant),headers: {
          "Authorization":"Bearer "+App.getString(Cons.aToken)

        } );

        if (response.statusCode == 200) {
          print("response =====: " + response.body.toString() + "");
          try {

            Map<String,dynamic> parsed = json.decode(response.body);
            RestaurentRes res = RestaurentRes.fromJson(parsed);
            setState(() {
              _restaurentList.clear();

              _restaurentList.addAll(res.data!);
            });

            setState(() {
              isLoaded = false;
            });


          }on Exception catch (e){
            setState(() {
              isLoaded = false;
            });
            print('Exception=== ' + e.toString());
          }




        }else{
          setState(() {
            isLoaded = false;
          });
        }
      } on Exception catch (e) {
        print('Exception==' + e.toString());

        setState(() {
          isLoaded = false;
        });
      }


  }
}

goToNextPage(BuildContext context, int intex,String rId,String rName) async {
  print("goToNextPage");

  if (intex == 0) {

    Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(builder: (context) => FoodDetailsActivity(resId: rId,resName: rName,)));

    }else if(intex == 1){

    ////Navigator.of(context).push(MaterialPageRoute(builder: (context) => DoctorActivity()));
  }
  else if(intex == 2){

    Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(builder: (context) => AboutActivity()));

  }
  else if(intex == 3){
    Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(builder: (context) => FifaActivity(url: "",)));
    //Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(builder: (context) => AboutActivity()));

  }else {

  }
}

void showToast(String massage){
  Fluttertoast.showToast(
      msg: massage,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.grey,
      textColor: Colors.white,
      fontSize: 16.0
  );
}
