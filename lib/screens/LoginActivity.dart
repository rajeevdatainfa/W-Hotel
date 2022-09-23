import 'dart:convert';
import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hotels/api/Apis.dart';
import 'package:hotels/model/ObjectRes.dart';
import 'package:hotels/model/UserDetails.dart';
import 'package:hotels/screens/MainActivity.dart';
import 'package:hotels/utils/Col.dart';

import 'package:http/http.dart' as http;

class LoginActivity extends StatefulWidget {
  bool isAddListing;

  LoginActivity({Key? key, required this.isAddListing}) : super(key: key);

  @override
  LoginView createState() => LoginView();
}

class LoginView extends State<LoginActivity> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;
  bool is_loading = false;
  String _mobile = "";
  String _email = "";
  String _pass = "";

  final List<String> _listBannerN = [
    'assets/images/slider1.png',
    'assets/images/slider2.png',
    'assets/images/slider3.png',
    'assets/images/slider4.png',
    'assets/images/slider5.png',
    'assets/images/slider6.png'
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double defaultFontSize = 14;
    double defaultIconSize = 17;
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    bool _isLoding = false;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/login.png"),
              fit: BoxFit.fill,
            ),
          ),
          //color: Col.white_t1,
          child:is_loading==false? Container(
            child: SingleChildScrollView(
              child: Container(
                height: height,
                alignment: Alignment.bottomCenter,
                padding: EdgeInsets.all(30.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      width: 180,
                      child: Image(
                        image: new AssetImage("assets/images/logo.png"),
                        color: null,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: Align(
                        alignment: Alignment.center,
                        child: Container(
                          child: Text(
                            "Login",
                            style: TextStyle(
                              color: Col.primary_gray,
                              fontFamily: "RobotoBold",
                              fontSize: 26,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      child: Align(
                        alignment: Alignment.center,
                        child: Container(
                          child: Text(
                            "Enter details to login",
                            style: TextStyle(
                              color: Col.primary_gray,
                              fontFamily: "RobotoBold",
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Form(
                      key: _formKey,
                      autovalidate: _autoValidate,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 25,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsets.only(left: 5, right: 25, top: 15),
                                child: new SizedBox(
                                    height: 24,
                                    width: 24,
                                    child: Image(
                                      color: Col.primary_color,
                                      image:
                                          AssetImage("assets/images/email.png"),
                                    )),
                              ),
                              Expanded(
                                child: TextFormField(
                                  showCursor: true,
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.all(2.0),
                                    filled: true,
                                    fillColor: Col.white,
                                    hintStyle: TextStyle(
                                        color: Color(0xFF666666),
                                        //fontFamily: defaultFontFamily,
                                        fontSize: defaultFontSize),
                                    hintText: "Enter email",
                                  ),
                                  validator: (value) {
                                    if (value == null || !validateEmail(value)) {
                                      return 'Please enter valid email-id';
                                    }
                                    return null;
                                  },
                                  onSaved: (String? val) {
                                    _email = val.toString().trim();
                                  },
                                  obscureText: false,
                                  keyboardType: TextInputType.emailAddress,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsets.only(left: 5, right: 25, top: 15),
                                child: new SizedBox(
                                    height: 24,
                                    width: 24,
                                    child: Image(
                                      color: Col.primary_color,
                                      image: AssetImage(
                                          "assets/images/password.png"),
                                    )),
                              ),
                              Expanded(
                                child: TextFormField(
                                  showCursor: true,
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.all(12.0),
                                    filled: true,
                                    fillColor: Col.white,
                                    hintStyle: TextStyle(
                                        color: Color(0xFF666666),
                                        //fontFamily: defaultFontFamily,
                                        fontSize: defaultFontSize),
                                    hintText: "*******",
                                  ),
                                  validator: (value) {
                                    if (value == null ||
                                        value.isEmpty ||
                                        value.length < 6) {
                                      return 'Please enter valid password';
                                    }
                                    return null;
                                  },
                                  onSaved: (String? val) {
                                    _pass = val.toString().trim();
                                  },
                                  obscureText: true,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Container(
                      padding: EdgeInsets.only(right: 10),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Container(
                              child: Text(
                                "Forgot your password? ",
                                style: TextStyle(
                                  color: Col.primary_gray_light,
                                  //fontFamily: defaultFontFamily,
                                  fontSize: defaultFontSize,
                                  fontStyle: FontStyle.normal,
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () => {

                              //Navigator.of(buildContext).pop();

                                /* Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          ForgotPassActivity(
                                                            isAddListing:
                                                            widget.isAddListing,
                                                          )),
                                                )*/
                              },
                              child: Container(
                                child: Text(
                                  "Click here",
                                  style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: Col.primary_gray,
                                    //fontFamily: defaultFontFamily,
                                    fontSize: defaultFontSize,
                                    fontStyle: FontStyle.normal,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    Container(
                      width: double.infinity,
                      child: RaisedButton(
                        padding: EdgeInsets.all(17.0),
                        onPressed: () {
                          if (_validateInputs()) {
                            isConnected().then((intenet) {
                              if (intenet != null && intenet) {
                                //showLoaderDialog(context);

                                setState(() {
                                  is_loading = true;
                                });
                                 signInApi( _email, _pass,widget.isAddListing,context);
                               // goToNextPage(context, false);
                              } else {
                                showToast("No Internet connection");
                              }
                            });
                          }
                        },
                        child: Text(
                          "LOGIN",
                          style: TextStyle(
                            color: Col.primary_white,
                            fontSize: 18,
                            //fontFamily: defaultFontFamily,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        color: Col.primary_color,
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(10.0),
                            side: BorderSide(color: Col.primary_color)),
                      ),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Col.primary_color),
                    ),
                    SizedBox(
                      height: 35,
                    ),
                  ],
                ),
              ),
            ),
          ) : Container(
            width: width,
            child: Image(
              image: new AssetImage("assets/images/loading_login.gif"),
              color: null,
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }

  String validatePass(String? value) {
// Indian Mobile number are of 10 digit only
    if (value!.length < 6)
      return 'Password should be 6 digit and more';
    else
      return "";
  }

  String validMobile(String value) {
// Indian Mobile number are of 10 digit only
    if (value.length != 10)
      return 'Mobile should be 10 digit';
    else
      return "";
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

  /* String validateEmail(String? value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value!.trim()))
      return 'Enter Valid Email';
    else
      return "";
  }
*/
  bool validateEmail(String value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value.trim()))
      return false;
    else
      return true;
  }

  bool _validateInputs() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      print("_validateInputs========================================");
      return true;
    } else {
      print("_validateInputs=====*******************************************");
      setState(() {
        _autoValidate = true;
      });
    }

    return false;
  }

  showLoaderDialog(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    AlertDialog alert = AlertDialog(
      content: new Row(
        children: [
          Container(

              child: Image(
                image: new AssetImage("assets/images/loading_login.gif"),
                color: null,
                fit: BoxFit.fill,
              )
          )

             /* Text("Loading...")),*/
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

  void signInApi(String email, String password, bool isAddlisting,
      BuildContext buildContext) async {
    Map map = {
      "email": email,
      "password": password,
      //"fcm_token":""
    };

    try {
      var response = await http.post(Uri.parse(Apis.loginApi), body: map);
      //print("=========================>"+response.toString() + "");

      Navigator.of(context, rootNavigator: true).pop();
      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body);
        //print("=========================>"+jsonData.toString() + "");

        ObjectRes objectRes = ObjectRes.fromJson(jsonData);
        if (objectRes.status_code == 1) {
          UserDetails userDetails = UserDetails.fromJson(jsonData);
          User? user = userDetails.user;

          /* App.putString(Cons.uId,user!.iD.toString());
          App.putString(Cons.uName,user.userLogin.toString());
          App.putString(Cons.uEmail,user.userEmail.toString());
          App.putString(Cons.uDisplayName,user.displayName.toString());
          App.putString(Cons.userStatus,user.userStatus.toString());
          App.putBool(Cons.isLogin,true);
*/

          Navigator.of(buildContext).pop();
        }
        print("=========================>" + jsonData.toString() + "");

        showToast(objectRes.message);

        print(response.body);
      } else {
        Navigator.of(context, rootNavigator: true).pop();
        print(response.body);
        showToast("Something wrong!");
      }
    } on Exception catch (_) {
      Navigator.of(context, rootNavigator: true).pop();

      showToast("Something wrong!");
    }
  }
}

goToNextPage(BuildContext context, bool isAddListing) async {
  print("goToNextPage");
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => MainActivity()));
  if (isAddListing) {
    //Navigator.of(context).push(MaterialPageRoute(builder: (context)=> PlanListActivity()));
    //Navigator.of(context).push(MaterialPageRoute(builder: (context)=> AddListingActivity()));
    Navigator.pop(context);
  } else {
    /*Navigator.of(context, rootNavigator: true)
        .push(MaterialPageRoute(builder: (context) => DashboardActivity()));*/
  }
}
