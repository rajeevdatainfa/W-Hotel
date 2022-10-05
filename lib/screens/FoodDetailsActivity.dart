import 'dart:convert';
import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hotels/api/Apis.dart';
import 'package:hotels/model/FoodMenuRes.dart';
import 'package:hotels/model/RestaurentItem.dart';
import 'package:hotels/screens/AboutActivity.dart';
import 'package:hotels/screens/FifaActivity.dart';
import 'package:hotels/screens/root_app.dart';
import 'package:hotels/utils/App.dart';
import 'package:hotels/utils/Col.dart';
import 'package:hotels/utils/Cons.dart';
import 'package:http/http.dart' as http;

class FoodDetailsActivity extends StatefulWidget {
  String resId="0";
  String resName="Food Items";

  FoodDetailsActivity({Key? key, required this.resId, required this.resName}) : super(key: key);



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
  List<MenuCategories> _foodList = [];

  @override
  void initState() {

    super.initState();

    isConnected().then((intenet) {
      if (intenet != null && intenet) {
        //showLoaderDialog(context);

        setState(() {
          isLoaded = true;
        });

        getRestaurentList(widget.resId);
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
        title: Text(widget.resName, style: TextStyle(fontSize: 20.0, color: Colors.white),),
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
                        itemCount: _foodList.length,
                        //itemCount: _restaurentList.length,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) => _category(context, index, _foodList[index])

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


  Widget _category(BuildContext context, int index,MenuCategories menuCategories) {
    return Padding(
      padding: const EdgeInsets.all(2.0),

      child:  Container(


        child: Container(
          alignment: Alignment.center,

          //color: color,
          child: Padding(
            padding: EdgeInsets.all(1.0),
            child: menuCategories.subCategoryFoodItems!.length>0?ListView.builder(
                itemCount: menuCategories.subCategoryFoodItems!.length,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                itemBuilder: (context, index) => _subCategory(context, index, menuCategories.subCategoryFoodItems![index])

              //shrinkWrap: true,
            ):Container(

            ),
          ),
        ),
      ),

    );
  }

  Widget _subCategory(BuildContext context, int index,SubCategoryFoodItems sItems) {
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
                padding: EdgeInsets.all(10),
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

                  //color: color,
                  child: Column(

                    children: [
                      //ImageIcon(AssetImage(icon),size: 120,color: Col.primary_blue,),

                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          sItems.categoryName!,
                          style: TextStyle(
                              fontSize: 16,
                              color: Col.white,
                              fontFamily: "RobotoBold"
                          ),
                        ),
                      ),
                      SizedBox(height: 8,),

                      Padding(
                        padding: EdgeInsets.all(5.0),
                        child: ListView.builder(
                            itemCount: sItems.items!.length,
                            //itemCount: _restaurentList.length,
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            physics: ClampingScrollPhysics(),
                            itemBuilder: (context, index) => _itemDetails(context, index, sItems.items![index])

                          //shrinkWrap: true,
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

  Widget _itemDetails(BuildContext context, int index,MenuItems menuItems) {
    return Padding(
      padding: const EdgeInsets.all(1.0),

      child:  Card(
        shape: RoundedRectangleBorder(
          borderRadius:
          BorderRadius.only(
              bottomRight: Radius.circular(15),
              topRight: Radius.circular(15),
              topLeft: Radius.circular(30),
              bottomLeft: Radius.circular(30),

          )

        ),
        elevation:1,
        child: GestureDetector(
            child: InkWell(
              onTap: () {
                goToNextPage(context, index);
              },
              child: Container(
                padding: EdgeInsets.all(10),
               decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(15),
                            topRight: Radius.circular(15),
                            topLeft: Radius.circular(45),
                            bottomLeft: Radius.circular(45)),
                        gradient: LinearGradient(
                          colors: [
                            Col.white_bg,
                            Col.white,
                          ],

                        ),
                      ),

                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(left: 12),
                  //color: color,
                  child: Column(

                    children: [
                      //ImageIcon(AssetImage(icon),size: 120,color: Col.primary_blue,),

                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          menuItems.name!,
                          style: TextStyle(
                              fontSize: 16,
                              color: Col.primary_gray,
                              fontFamily: "RobotoBold"
                          ),
                        ),
                      ),


                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          menuItems.description!,
                          style: TextStyle(
                              fontSize: 12,
                              color: Col.primary_gray_light,
                              fontFamily: "RobotoRegular"
                          ),
                        ),
                      ),
                      SizedBox(height: 2,),

                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "City: "+menuItems.city!,
                          style: TextStyle(
                              fontSize: 10,
                              color: Col.primary_gray_light,
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


  Future getRestaurentList(String restaurentId) async {

    Map map = {
      "uid":App.getString(Cons.aToken),

    };

    var header = {
      "Content-Type":"application/json",
      "Authorization":"Bearer "+App.getString(Cons.aToken)

    };

    print("request =====: " + map.toString() + "");
    print("url =====: " + Apis.foodCategory+widget.resId);
    http://wdoha-env.eba-fcmfzskx.ap-south-1.elasticbeanstalk.com/api/v1/restaurant/menu/1


      try {
        var response = await http.get(Uri.parse(Apis.foodCategory+widget.resId),headers: {
          "Authorization":"Bearer "+App.getString(Cons.aToken)

        } );

        print("request =====: " + header.toString() + "");
        print("response =====: " + response.body .toString() + "");

        if (response.statusCode == 200) {
          print("response =====: " + response.body.toString() + "");
          try {

            Map<String,dynamic> parsed = json.decode(response.body);
            FoodMenuRes res = FoodMenuRes.fromJson(parsed);
            setState(() {
              _foodList.clear();

              _foodList.addAll(res.data!.categories!);

              print("_foodList=====: "+ _foodList.length.toString() );
            });

            setState(() {
              isLoaded = false;
            });

            if(_foodList.length==0){
              showToast("Data not available!");
            }
            print("getListingList__=====: "+ res.data!.categories!.length.toString() );


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


