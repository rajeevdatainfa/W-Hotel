import 'dart:convert';
import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hotels/api/Apis.dart';
import 'package:hotels/model/BusScheduleRes.dart';
import 'package:hotels/model/RestaurentItem.dart';
import 'package:hotels/model/RestaurentRes.dart';
import 'package:hotels/model/TrainingRes.dart';
import 'package:hotels/screens/AboutActivity.dart';
import 'package:hotels/screens/BusDetailsActivity.dart';
import 'package:hotels/screens/FifaActivity.dart';
import 'package:hotels/screens/FoodDetailsActivity.dart';
import 'package:hotels/screens/RestaurentDetailsActivity.dart';
import 'package:hotels/screens/TrainingActivity.dart';
import 'package:hotels/screens/root_app.dart';
import 'package:hotels/utils/App.dart';
import 'package:hotels/utils/Col.dart';
import 'package:hotels/utils/Cons.dart';
import 'package:http/http.dart' as http;

class RestaurentListActivity extends StatefulWidget {
  @override
  RestaurentListActivityView createState() => RestaurentListActivityView();
}

class RestaurentListActivityView extends State<RestaurentListActivity> {
  double defaultFontSize = 14;
  double defaultIconSize = 17;
  bool isConnect = true;
  bool isLoaded = false;
  String type="HCMC";
  List<RestaurentDetails> _tList = [];

  @override
  void initState() {
    super.initState();

    type = App.getString(Cons.type);
    print("type"+ type);

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


    //_isConnected();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Col.primary_blue,
        title: const Text(
          'Menu',
          style: TextStyle(fontSize: 20.0, color: Colors.white),
        ),
        toolbarHeight: 70,
      ),
      body: SafeArea(
        child: Container(
          child: isLoaded == false
              ? Container(
                  color: Col.white_bg,
                  height: height,
                  margin: EdgeInsets.only(left: 15.0, right: 15),
                  child: Padding(
                    padding: EdgeInsets.all(5.0),
                    child: ListView.builder(
                        itemCount: _tList.length,
                        //itemCount: _restaurentList.length,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) =>
                            _itemLayout(context, index, _tList[index])

                        //shrinkWrap: true,
                        ),
                  ),
                )
              : Container(
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

  Widget _itemLayout(
      BuildContext context, int index, RestaurentDetails restaurentItem) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 1,
        child: GestureDetector(
            child: InkWell(
          onTap: () {
            goToNextPage(
                context, 0, restaurentItem.file!.url!, restaurentItem.name!);
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              image: DecorationImage(
                image: AssetImage("assets/images/background_card.png"),
                fit: BoxFit.cover,
              ),
            ),
            /* decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        gradient: LinearGradient(
                          colors: [
                            Col.white,
                            Col.primary_gray_light,
                          ],

                        ),
                      ),*/

            child: Container(
              alignment: Alignment.center,
              height: 100,

              //color: color,
              child: Row(
                children: [
                  Container(
                    height: 100,
                    alignment: Alignment.centerLeft,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Image.network(
                        restaurentItem.image!.url!,
                        height: 100.0,
                        width: 120.0,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(
                          left: 15, right: 10, top: 10, bottom: 10),
                      child: Column(
                        children: [
                          //ImageIcon(AssetImage(icon),size: 120,color: Col.primary_blue,),

                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              restaurentItem.name!,
                              maxLines: 1,
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Col.white,
                                  fontFamily: "RobotoBold"),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),

                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              restaurentItem.description!,
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Col.white,
                                  fontFamily: "RobotoRegular"),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )),
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

  void _isConnected() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        print('connecte bool isConnect = true;d');
        setState(() {
          isConnect = true;
        });
      } else {
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
      "uid": App.getString(Cons.aToken),
    };

    var header = {
      "Content-Type": "application/json",
      "Authorization": "Bearer " + App.getString(Cons.aToken)
    };

    print("request =====: " +Apis.restaurentListType+type + "");

    try {
      //var response = await http.get(Uri.parse(Apis.restaurentList),
      var response = await http.get(Uri.parse(Apis.restaurentListType+type),
          headers: {"Authorization": "Bearer " + App.getString(Cons.aToken)});

      print('response=== ' + response.statusCode.toString());
      if (response.statusCode == 200) {
        print("response =====: " + response.body.toString() + "");
        try {
          Map<String, dynamic> parsed = json.decode(response.body);
          RestaurentListRes res = RestaurentListRes.fromJson(parsed);
          setState(() {
            _tList.clear();

            _tList.addAll(res.data!);
          });

          setState(() {
            isLoaded = false;
          });
        } on Exception catch (e) {
          setState(() {
            isLoaded = false;
          });
          print('Exception=== ' + e.toString());
        }
      } else {
        setState(() {
          isLoaded = false;
        });

        print('Exception=== ' + "Not loaded");
      }
    } on Exception catch (e) {
      print('Exception==' + e.toString());

      setState(() {
        isLoaded = false;
      });
    }
  }
}

goToNextPage(BuildContext context, int intex, String url, String tName) async {
  print("goToNextPage");

  if (intex == 0) {
    Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(
        builder: (context) => RestaurentDetailsActivity(
              url: url,
              tName: tName,
            )));
  } else if (intex == 1) {
    ////Navigator.of(context).push(MaterialPageRoute(builder: (context) => DoctorActivity()));
  }
}

void showToast(String massage) {
  Fluttertoast.showToast(
      msg: massage,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.grey,
      textColor: Colors.white,
      fontSize: 16.0);
}
