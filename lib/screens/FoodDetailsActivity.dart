import 'dart:convert';
import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hotels/api/Apis.dart';
import 'package:hotels/model/RestaurentItem.dart';
import 'package:hotels/screens/AboutActivity.dart';
import 'package:hotels/screens/FifaActivity.dart';
import 'package:hotels/screens/root_app.dart';
import 'package:hotels/utils/App.dart';
import 'package:hotels/utils/Col.dart';
import 'package:hotels/utils/Cons.dart';
import 'package:http/http.dart' as http;

class FoodDetailsActivity extends StatefulWidget {


  @override
  RestaurentView createState() =>RestaurentView();
}

class RestaurentView extends State<FoodDetailsActivity> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isLoding = false;
  double defaultFontSize = 14;
  double defaultIconSize = 17;
  bool isConnect = true;
  bool isLoaded = false;
  List<RestaurentItem> _restaurentList = [];

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
        title: const Text('Food Safety', style: TextStyle(fontSize: 20.0, color: Colors.white),),
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
                      child: ListView.builder(
                        itemCount: _restaurentList.length,
                        //itemCount: _restaurentList.length,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) => _addAmountLayout(context, index, _restaurentList[index])

                        //shrinkWrap: true,
                      ),
                    ),
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


  Widget _addAmountLayout(BuildContext context, int index,RestaurentItem restaurentItem) {
    return Padding(
      padding: const EdgeInsets.all(2.0),

      child:  Card(
              shape: RoundedRectangleBorder(
                borderRadius:
                BorderRadius.circular(15.0),
              ),
              elevation:1,
              child: GestureDetector(
                  child: InkWell(
                    onTap: () {
                      goToNextPage(context, index);
                    },
                    child: Container(
                      padding: EdgeInsets.all(20),
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

                        //color: color,
                        child: Column(

                          children: [
                            //ImageIcon(AssetImage(icon),size: 120,color: Col.primary_blue,),

                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                restaurentItem.name!,
                                style: TextStyle(
                                  fontSize: 22,
                                  color: Col.white,
                                  fontFamily: "RobotoBold"
                                ),
                              ),
                            ),
                            SizedBox(height: 8,),

                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                restaurentItem.description!,
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Col.white,
                                    fontFamily: "RobotoRegular"
                                ),
                              ),
                            ),
                            SizedBox(height: 6,),

                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "City: "+restaurentItem.city!,
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Col.white_bg,
                                    fontFamily: "RobotoRegular"
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
              ),
            ),

    );
  }


  /* void signInApi(String text, String text2,bool isAddlisting,BuildContext buildContext) async{


    Map map = {
      "email":text,
      "password":text2,
      //"fcm_token":""
    };


    try{


      var response = await http.post(Uri.parse(Apis.loginApi),body: map);
      //print("=========================>"+response.toString() + "");


      Navigator.of(context, rootNavigator: true).pop();
      if(response.statusCode==200){
        var jsonData = json.decode(response.body);
        //print("=========================>"+jsonData.toString() + "");

        ObjectRes objectRes = ObjectRes.fromJson(jsonData);
        if(objectRes.status_code==1){


          UserDetails userDetails = UserDetails.fromJson(jsonData);
          User? user = userDetails.userData!.data;

          App.putString(Cons.uId,user!.iD.toString());
          App.putString(Cons.uName,user.userLogin.toString());
          App.putString(Cons.uEmail,user.userEmail.toString());
          App.putString(Cons.uDisplayName,user.displayName.toString());
          App.putString(Cons.userStatus,user.userStatus.toString());
          App.putBool(Cons.isLogin,true);


          Navigator.of(buildContext).pop();

        }
        print("=========================>"+jsonData.toString() + "");


        showToast(objectRes.message);

        print(response.body);
      }else{

        Navigator.of(context, rootNavigator: true).pop();
        print(response.body);
        showToast("Something wrong!");
      }

    }on Exception catch (_){

      Navigator.of(context, rootNavigator: true).pop();

      showToast("Something wrong!");
    }


  }
*/

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

        print("request =====: " + header.toString() + "");
        print("response =====: " + response.body .toString() + "");

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
            print("getListingList__=====: "+ res.data!.length.toString() );
            print("_restaurentList =====: "+ _restaurentList!.length.toString() );

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

goToNextPage(BuildContext context, int intex) async {
  print("goToNextPage");

  if (intex == 0) {
    //Navigator.of(context).push(MaterialPageRoute(builder: (context)=> PlanListActivity()));
    //Navigator.of(context).push(MaterialPageRoute(builder: (context)=> DashboardActivity()));
    //Navigator.pop(context);

    //Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(builder: (context) => RootApp()));
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
