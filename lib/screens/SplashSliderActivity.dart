import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hotels/model/Slider.dart';
import 'package:hotels/screens/HomeActivity.dart';
import 'package:hotels/screens/LoginActivity.dart';
import 'package:hotels/screens/MainActivity.dart';
import 'package:hotels/utils/Col.dart';


class SplashSliderActivity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      debugShowCheckedModeBanner: false,
      /*home:Container(
      color: Colors.green,
      child: Center(child: Text("Screen 1")),
    ),*/
      home: MyHomePage(),
      theme: ThemeData(
          // fontFamily: 'Roboto',
          primaryColor: Col.primary_dark,
          primaryColorDark: Col.primary_dark,
          backgroundColor: Col.primary_white),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MainScreen();
  }
}

class MainScreen extends State<MyHomePage> {
  late String vaga_name;
  String pId = "", cityName = "";

  String location_name = "City";
  bool isExpended = false;
  bool isAddressChanged = false;

  bool isConnect = true;
  int dPosition = 0;

  final List<String> _listBannerN = [
    'assets/images/slider1.png',
    'assets/images/slider2.png',
    'assets/images/slider3.png',
    'assets/images/slider4.png',
    'assets/images/slider5.png',
    'assets/images/slider6.png'

  ];



  changeMode() {
    setState(() {
      isExpended = true;
    });
  }

  final CarouselController _controller = CarouselController();
  final List<SliderItem> _listBanner = [];


  String messageTitle = "Empty";
  String notificationAlert = "alert";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();



    setState(() {
      _listBanner.add(new SliderItem(title: "Lusail Stadium",desc: "W Hotels is an American upscale lifestyle hotel chain owned by Marriott International that is marketed towards a younger age group",color: Col.s1, url: 'assets/images/slider1.png'));
      _listBanner.add(new SliderItem(title: "Al Wakrah Stadium",desc: "As we count down to the start of the global showpiece in Qatar on 20 November, FIFA+ is showcasing 100 of the greatest moments in FIFA World Cup history.",color: Col.s2,url: 'assets/images/slider2.png'));
      _listBanner.add(new SliderItem(title: "Al Rayyan Stadium",desc: "W Hotels is an American upscale lifestyle hotel chain owned by Marriott International that is marketed towards a younger age group",color: Col.s3,url: 'assets/images/slider3.png'));
      _listBanner.add(new SliderItem(title: "khalifa international stadium",desc: "Make ypur order to eat and enjoy the matchs",color: Col.s4,url: 'assets/images/slider4.png'));
      _listBanner.add(new SliderItem(title: "Al Bayt Stadium",desc: "The 2022 FIFA World Cup is scheduled to be the 22nd running of the FIFA World Cup competition, the quadrennial international men's football championship contested by the senior national teams of the member associations of FIFA.",color: Col.s5,url: 'assets/images/slider5.png'));
      _listBanner.add(new SliderItem(title: "Qatar Foundation Stadium",desc: "We invite you celebrate football, on and off the pitch, at the central fan destination for Qatar 2022",color: Col.s5,url: 'assets/images/slider6.png'));



/*
      _listBanner.add(new SliderItem(title: "Lusail Stadium",desc: "Book your luxury room",color: Col.s1, url: 'https://pbs.twimg.com/media/FZ5Z7JOUEAAAL1B.jpg'));
      _listBanner.add(new SliderItem(title: "Al Wakrah Stadium",desc: "Qatar world cup 2022 ",color: Col.s2,url: 'https://d12eu00glpdtk2.cloudfront.net/public/images/local/_760x500_clip_center-center_none/Al-Wakrah-Stadium-at-night-drone-shot.png'));
      _listBanner.add(new SliderItem(title: "Al Rayyan Stadium",desc: "Doha had committed",color: Col.s3,url: 'https://assets.goal.com/v3/assets/bltcc7a7ffd2fbf71f5/blt291c21647fdd7761/60dab807ddcd520eeb8736b9/423fc76da66d9fe33365bee501ecb25d314d2164.jpeg?auto=webp&fit=crop&format=jpg&height=800&quality=60&width=1200'));
      _listBanner.add(new SliderItem(title: "khalifa international stadium",desc: "Qatar developed world class venues",color: Col.s4,url: 'https://www.visitqatar.qa/content/dam/visitqatar/img/things-to-do/adventures/other-sports-and-activities/khalifa-international-stadium/Khalifa_International_Stadium6.jpg/_jcr_content/renditions/medium-1280px.jpeg'));
      _listBanner.add(new SliderItem(title: "Al Bayt Stadium",desc: "The people behind",color: Col.s5,url: 'https://images.adsttc.com/media/images/53b4/290a/c07a/8021/3200/0003/large_jpg/2014_06_21_AlBaytStadium_AlKhorCity_01.jpg?1404315894'));
      _listBanner.add(new SliderItem(title: "Qatar Foundation Stadium",desc: "The people behind",color: Col.s5,url: 'https://inhabitat.com/wp-content/blogs.dir/1/files/2015/02/Qatar-Arup-Foundation-Stadium-lead-2.jpg'));
      _listBanner.add(new SliderItem(title: "Ras Abu Aboud Stadium",desc: "The people behind",color: Col.s5,url: 'https://m.thepeninsulaqatar.com/get/maximage/20211120_1637428272-760.jpg?1637428272'));
      _listBanner.add(new SliderItem(title: "Al Thumama Stadium",desc: "The people behind",color: Col.s5,url: 'https://parametrichouse.com/wp-content/uploads/2022/06/Al-Thumama-Stadium-02.jpg'));
*/


    });

  }



  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
           backgroundColor: Col.white,
            // drawer: DrawerWidget(),
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
                      child: CarouselSlider(
                        options: CarouselOptions(
                            height: height,
                            viewportFraction: 1.0,
                            enlargeCenterPage: false,
                            autoPlay: true,
                            onPageChanged: (index, reason) {
                              setState(() {
                                dPosition = index;
                              });
                            },

                            autoPlayAnimationDuration:
                            Duration(milliseconds: 200)

                        ),

                        carouselController: _controller,

                        // pauseAutoPlayOnTouch: Duration(seconds: 5),

                        //height: MediaQuery.of(context).size.height * 0.60,
                        items: <Widget>[
                          for (var i = 0; i < _listBannerN.length; i++)
                            Container(
                              margin: const EdgeInsets.only(
                                  top: 0.0, left: 0.0),


                              child: _addAmountLayout(context,i,_listBanner[i]),
                            ),
                        ],
                      ),
                    ),

                    Container(

                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: InkWell(
                          onTap: () {
                            /*if(dPosition == _listBanner.length-1){
                                  goToNextPage(context, 2);
                                }else{
                                  _controller.nextPage();
                                }*/
                            goToNextPage(context, 2);
                          },
                          child: Container(
                            width: 60,
                            height: 60,
                            alignment: Alignment.center,
                            decoration: new BoxDecoration(
                              color: Col.primary_blue,
                              shape: BoxShape.circle,
                            ),

                            child: Icon(Icons.arrow_forward,color: Col.white,size: 30,),




                          ),
                        ),
                      ),
                    ),
                  ],


                ),
              ),
            )));
  }

  Widget _addAmountLayout(BuildContext context,int index,SliderItem items) {
    /*setState(() {
      dPosition = index;
      print("dPosition : "+dPosition.toString());
    });*/
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius:
          BorderRadius.circular(2.0),
        ),
        elevation:2,
        child: GestureDetector(
          child: InkWell(

            child: Container(

              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(items.url),

                  /*NetworkImage(
                      items.url,scale: 0.5),*/

                  fit: BoxFit.cover,
                ),

              ),


              /*child: Center(
                  child: Image(
                    image: new AssetImage(_listBannerN[i]),
                    height: height,
                    color: null,
                    fit: BoxFit.fill,
                  )

              ),*/

             /* decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                gradient: LinearGradient(
                  begin: Alignment(0,-1),
                  end: Alignment(0.0, 0.0),
                  colors: [
                    Col.white.withOpacity(0.1),
                    Col.white.withOpacity(0.2),
                    Col.primary_dark.withOpacity(0.2),
                  ],

                ),
                //borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10),)
              ),*/
              child: Container(
                alignment: Alignment.center,
                //color: items.color,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [

                    SizedBox(height: 8,),

                    Container(

                      alignment: Alignment.center,
                      padding: EdgeInsets.only(bottom: 160,left: 100,right: 10),

                      child: Text(
                        items.desc,
                        textAlign: TextAlign.end,
                        style: TextStyle(
                          fontSize: 16,
                          color: Col.primary_gray,
                          fontFamily: "RobotoRegular",
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    ),


                   /* Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(left: 20,right: 20),
                      color: items.color,
                      child: Text(
                        items.desc,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          color: Col.white,
                          fontFamily: "RobotoMedium",
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    ),*/
                  ],
                ),
              ),
            ),
          )
        ),
      ),
    );
  }



}

goToNextPage(BuildContext context, int intdex) async {

  if(intdex==2){

   // Navigator.of(context,rootNavigator: true).push(MaterialPageRoute(builder: (context)=> MainActivity()));
    Navigator.of(context,rootNavigator: true).push(MaterialPageRoute(builder: (context)=> LoginActivity(isAddListing: true)));

  }else if(intdex==0){

   // Navigator.of(context,rootNavigator: true).push(MaterialPageRoute(builder: (context)=> MyFamilyActivity()));
  }
  //Navigator.of(context,rootNavigator: true).pushReplacement(MaterialPageRoute(builder: (context)=> SubCatListDetailsActivity()));
}

showLoaderDialog(BuildContext context) {
  AlertDialog alert = AlertDialog(
    content: new Row(
      children: [
        CircularProgressIndicator(),
        Container(
            margin: EdgeInsets.only(left: 7),
            child: Text("No Internet Connection!")),
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

showNoInterNetDialog(BuildContext context) {
  AlertDialog alert = AlertDialog(
      content: Container(
        padding: EdgeInsets.only(top: 2, bottom: 2),
        color: Color(0x0),
        child: Container(
          height: 150,
          width: 200,
          decoration: BoxDecoration(
              color: Color.fromRGBO(153, 153, 153, 90),
              borderRadius: BorderRadius.circular(6)),
              margin: EdgeInsets.all(20.0),
              padding: EdgeInsets.only(left: 2, top: 2, bottom: 2, right: 2),
              child: Column(
                children: [
                  Text("No Internet Connection!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: Colors.black)),
                  InkWell(
                onTap: () {},
                //isConnected();

                child: Container(
                  margin: EdgeInsets.only(top: 50),
                  height: 50,
                  width: 140,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black54.withOpacity(0.3),
                        offset: Offset(-5.0, -5.0),
                        blurRadius: 10.0,
                      ),
                      BoxShadow(
                        color: Colors.white30.withOpacity(0.3),
                        offset: Offset(5.0, 5.0),
                        blurRadius: 10.0,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xFFA1A1A1),
                  ),
                  child: Center(
                    child: Text(
                      "OK",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
      ),
    ),
  ));
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

/*void showToast(String massage) {
  Fluttertoast.showToast(
      msg: massage,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.grey,
      textColor: Colors.white,
      fontSize: 16.0);
}*/
