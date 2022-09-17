import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:webview_flutter/webview_flutter.dart';


class FifaActivity extends StatefulWidget{
  String url;

  FifaActivity({Key? key, required this.url}) : super(key: key);


  @override
  VisionActivityView createState()=> VisionActivityView();

}

class VisionActivityView extends State<FifaActivity>{



  final Completer<WebViewController> _controller = Completer<WebViewController>();

  int _stackToView = 1;

  void _handleLoad(String value) {
    setState(() {
      _stackToView = 0;
    });
  }


  @override
  void initState() {
    super.initState();

    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();

  }

  @override
  void dispose() {
    // Every listener should be canceled, the same should be done with this stream.


    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
   return MaterialApp(
     debugShowCheckedModeBanner: false,
       home: Scaffold(
           /*appBar: AppBar(
             elevation: 1.0,
             centerTitle: false,
             backgroundColor: Color(0xFF262424),
             title: Text("About",style: TextStyle(fontSize: 20,color: Colors.white),),
             leading: IconButton(
               onPressed: () {
                 Navigator.pushReplacement(
                   context,
                   MaterialPageRoute(builder: (context) => Profile()),
                 );
               },
               icon: Icon(Icons.arrow_back_outlined),
               color: Color(0xFFFFFFFF),
             ),

           ),*/

           body: /*Container(
                 child: Padding(padding:  EdgeInsets.only(left: 20,top: 10, right: 20,bottom: 10),
                   child:  Row(
                     mainAxisAlignment: MainAxisAlignment.center,

                     children: <Widget>[
                       Expanded(

                           child: Text('Dudes & Damsels is a figment of an imaginative mind and a small effort which aims at creating more and more earning opportunities in a situation where the pandemic has hit hard on the livelihood of many.It is also about popularizing the online concept in the beauty business which is certainly not new but again,which has not been explored to an extent that can create a belief system among the customers of an extensive premium service that can be enjoyed at home.In the present situation when work from home has become a way of life,our effort would be to reach out to all with all premium beauty services that one enjoyed in the ambiance of the best of salons.Over the years we all realise that life is really running at a fast pace but simultaneously it is fact that people have become more conscious as far as their beauty needs are concerned.Taking care of the skin,body and hair forms an integral part within the hassles of our day to day life.But time management becomes an issue and consequently even though we want it, we cannot make it always.Here,with us,you enjoy the opportunity to experience complete luxury at home by just clicking the bottons on your moblle phone because we shall be right at your doorsteps to offer you one.Life is transforming for all and so are our thought processes.We are confident that your way of thinking will certainly assist us to make a place in your heart.Come..let’s join hands to transform the world into a beautiful and better place to live in..', textAlign: TextAlign.start,style: TextStyle(fontSize: 14.0, color: Colors.black))),
                     ],
                   ),

             ),*/




           SafeArea(
             child: IndexedStack(
               index: _stackToView,
               children: [
                 Column(
                   children: <Widget>[
                     Expanded(
                         child: WebView(
                           initialUrl: widget.url,
                           //initialUrl: "https://www.fifa.com/fifaplus/en/tournaments/mens/worldcup/qatar2022",
                           javascriptMode: JavascriptMode.unrestricted,
                           onPageFinished: _handleLoad,
                           onWebViewCreated: (WebViewController webViewController) {
                             _controller.complete(webViewController);

                           },
                         )),
                   ],
                 ),
                 Container(
                     child: Center(child: CircularProgressIndicator(),)
                 ),
               ],
             ),
           )
       )
   );


  }





  showLoaderDialog(BuildContext context){
    AlertDialog alert=AlertDialog(
      content: new Row(
        children: [
          CircularProgressIndicator(),
          Container(margin: EdgeInsets.only(left: 7),child:Text("Loading..." )),
        ],),
    );
    showDialog(barrierDismissible: false,
      context:context,
      builder:(BuildContext context){
        return alert;
      },
    );
  }


 /* void showToast(String massage){
    Fluttertoast.showToast(
        msg: massage,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }*/


  Future<bool> isConnected() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        print('connected');
        return true;
      }
      else{
        return false;
      }
    } on SocketException catch (_) {
      print('not connected');

      return false;
    }
  }
}

