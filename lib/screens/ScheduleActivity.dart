import 'dart:convert';
import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hotels/screens/AboutActivity.dart';
import 'package:hotels/screens/FifaActivity.dart';
import 'package:hotels/screens/root_app.dart';
import 'package:hotels/utils/Col.dart';


class ScheduleActivity extends StatefulWidget {


  @override
  HomeActivityView createState() =>HomeActivityView();
}

class HomeActivityView extends State<ScheduleActivity> {
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

          decoration: BoxDecoration(
            image: DecorationImage(
              //image: AssetImage("assets/images/menu_orders.jpg"),
              image: AssetImage("assets/images/ic_schedule_book.jpeg"),
              fit: BoxFit.fill,
            ),
          ),
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



                Flexible(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 55,
                          ),

                          SizedBox(
                            height: 35,
                          ),



                        ],
                      ),
                    ),
                  ),
                ),

                Container(
                  width: width,

                  alignment: Alignment.center,
                  child:
                  Container(

                   
                    child: Text(
                      "",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 6,
                        color: Col.white,
                        fontFamily: "RobotoExtraBold",
                        fontStyle: FontStyle.normal,
                      ),
                    ),),
                ),
              ],
            ),
          ),
        ),
      ),

    );
  }


  Widget _addAmountLayout(BuildContext context, int index,String text,String desc,String icon,Color color) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Column(
        children: [
          Expanded(
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius:
                BorderRadius.circular(12.0),
              ),
              elevation:1,
              child: GestureDetector(
                  child: InkWell(
                    onTap: () {
                      goToNextPage(context, index);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        gradient: LinearGradient(
                          colors: [
                            color,
                            color,
                          ],

                        ),
                      ),

                      child: Container(
                        alignment: Alignment.center,
                        //color: color,
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
