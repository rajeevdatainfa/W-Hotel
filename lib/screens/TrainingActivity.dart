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
/*import 'package:flutter_pdfview/flutter_pdfview.dart';*/

class TrainingActivity extends StatefulWidget {


  @override
  TrainingView createState() =>TrainingView();
}

class TrainingView extends State<TrainingActivity> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isLoding = false;
  double defaultFontSize = 14;
  double defaultIconSize = 17;
  bool isConnect = true;
  bool isLoaded = true;
  List<RestaurentItem> _restaurentList = [];
  String pathPDF = "";
  String landscapePathPdf = "";
  String remotePDFpath = "";
  String corruptedPathPDF = "";
  //final Completer<PDFViewController> _controller = Completer<PDFViewController>();
 // final Completer<PDFViewController> _controller = Completer<PDFViewController>();
  int? pages = 0;
  int? currentPage = 0;
  bool isReady = false;
  String errorMessage = '';
  bool _isLoading = true;
  //late PDFDocument document;
  bool exists = true;
  int _totalPages = 0;
  int _currentPage = 0;
  bool pdfReady = false;

  late PDFViewController _pdfViewController;

  String urlPDFPath = "";
  /*Future<File> getFileFromUrl(String url, {name}) async {
    var fileName = 'testonline';
    if (name != null) {
      fileName = name;
    }
    try {
      var data = await http.get(url);
      var bytes = data.bodyBytes;
      var dir = await getApplicationDocumentsDirectory();
      File file = File("${dir.path}/" + fileName + ".pdf");
      print(dir.path);
      File urlFile = await file.writeAsBytes(bytes);
      return urlFile;
    } catch (e) {
      throw Exception("Error opening url file");
    }
  }
*/


  @override
  void initState() {

    super.initState();
   // requestPersmission();
   // loadDocument();
    //document = await PDFDocument.fromAsset('assets/images/demo.pdf');
    /*fromAsset('assets/corrupted.pdf', 'corrupted.pdf').then((f) {
      setState(() {
        corruptedPathPDF = f.path;
      });
    });
    fromAsset('assets/demo-link.pdf', 'demo.pdf').then((f) {
      setState(() {
        pathPDF = f.path;
      });
    });
    fromAsset('assets/demo-landscape.pdf', 'landscape.pdf').then((f) {
      setState(() {
        landscapePathPdf = f.path;
      });
    });*/

    createFileOfPdfUrl().then((f) {
      setState(() {
        isLoaded = false;
        remotePDFpath = f.path;
      });
    });




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

/*  loadDocument() async {
    document = await PDFDocument.fromAsset('assets/images/demo.pdf');

    print(""+document.filePath.toString());

    setState(() => {
      isLoaded = false
    });
  }

  changePDF(value) async {
    setState(() => _isLoading = true);
    if (value == 1) {
      document = await PDFDocument.fromAsset('assets/images/demo.pdf');
    } else if (value == 2) {
      document = await PDFDocument.fromURL(
        "https://unec.edu.az/application/uploads/2014/12/pdf-sample.pdf",
        *//* cacheManager: CacheManager(
          Config(
            "customCacheKey",
            stalePeriod: const Duration(days: 2),
            maxNrOfCacheObjects: 10,
          ),
        ), *//*
      );
    } else {
      document = await PDFDocument.fromAsset('assets/sample.pdf');
    }
    setState(() => _isLoading = false);
    Navigator.pop(context);
  }*/


  Future<File> createFileOfPdfUrl() async {
    Completer<File> completer = Completer();
    print("Start download file from internet!");
    try {
      // "https://berlin2017.droidcon.cod.newthinking.net/sites/global.droidcon.cod.newthinking.net/files/media/documents/Flutter%20-%2060FPS%20UI%20of%20the%20future%20%20-%20DroidconDE%2017.pdf";
      // final url = "https://pdfkit.org/docs/guide.pdf";
      final url = "http://www.pdf995.com/samples/pdf.pdf";
      final filename = url.substring(url.lastIndexOf("/") + 1);
      var request = await HttpClient().getUrl(Uri.parse(url));
      var response = await request.close();
      var bytes = await consolidateHttpClientResponseBytes(response);
      var dir = await getApplicationDocumentsDirectory();
      print("Download files");
      print("${dir.path}/$filename");
      File file = File("${dir.path}/$filename");

      await file.writeAsBytes(bytes, flush: true);
      completer.complete(file);
    } catch (e) {
      setState(() {
        isLoaded  = false;
      });
      throw Exception('Error parsing asset file!');
    }

    return completer.future;
  }

  Future<File> fromAsset(String asset, String filename) async {
    // To open from assets, you can copy them to the app storage folder, and the access them "locally"
    Completer<File> completer = Completer();

    try {
      var dir = await getApplicationDocumentsDirectory();
      File file = File("${dir.path}/$filename");
      var data = await rootBundle.load(asset);
      var bytes = data.buffer.asUint8List();
      await file.writeAsBytes(bytes, flush: true);
      completer.complete(file);
    } catch (e) {
      throw Exception('Error parsing asset file!');
    }

    return completer.future;
  }


  @override
  Widget build(BuildContext context) {

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Col.primary_blue,
        title: const Text('Training', style: TextStyle(fontSize: 20.0, color: Colors.white),),
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
                    child: remotePDFpath!=""?Padding(
                      padding: EdgeInsets.all(5.0),
                      child: PDFView(
                        filePath: urlPDFPath,
                        autoSpacing: true,
                        enableSwipe: true,
                        pageSnap: true,
                        swipeHorizontal: true,
                        nightMode: false,
                        onError: (e) {
                          //Show some error message or UI
                        },
                        onRender: (_pages) {
                          setState(() {
                            _totalPages = _pages!;
                            pdfReady = true;
                          });
                        },
                        onViewCreated: (PDFViewController vc) {
                          setState(() {
                            _pdfViewController = vc;
                          });
                        },
                        /*onPageChanged: (int page, int total) {
                          setState(() {
                            _currentPage = page;
                          });
                        },*/
                        onPageError: (page, e) {},
                      ),


                      /*PDFView(
                        filePath: remotePDFpath,
                        enableSwipe: true,
                        swipeHorizontal: true,
                        autoSpacing: false,
                        pageFling: true,
                        pageSnap: true,
                        defaultPage: currentPage!,
                        fitPolicy: FitPolicy.BOTH,
                        preventLinkNavigation:
                        false, // if set to true the link is handled in flutter
                        onRender: (_pages) {
                          setState(() {
                            pages = _pages;
                            isReady = true;
                          });
                        },
                        onError: (error) {
                          setState(() {
                            errorMessage = error.toString();
                          });
                          print(error.toString());
                        },
                        onPageError: (page, error) {
                          setState(() {
                            errorMessage = '$page: ${error.toString()}';
                          });
                          print('$page: ${error.toString()}');
                        },
                        onViewCreated: (PDFViewController pdfViewController) {
                          _controller.complete(pdfViewController);
                        },
                        onLinkHandler: (String? uri) {
                          print('goto uri: $uri');
                        },
                        onPageChanged: (int? page, int? total) {
                          print('page change: $page/$total');
                          setState(() {
                            currentPage = page;
                          });
                        },
                      ),*/
                        /*errorMessage.isEmpty
                            ? !isReady
                            ? Center(
                          child: CircularProgressIndicator(),
                        )
                            : Container()
                            : Center(
                          child: Text(errorMessage),
                        )
*/

                      /*PDFViewer(
                        document: document,
                        zoomSteps: 1,
                        //uncomment below line to preload all pages
                        // lazyLoad: false,
                        // uncomment below line to scroll vertically
                        // scrollDirection: Axis.vertical,

                        //uncomment below code to replace bottom navigation with your own
                        *//* navigationBuilder:
                          (context, page, totalPages, jumpToPage, animateToPage) {
                        return ButtonBar(
                          alignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            IconButton(
                              icon: Icon(Icons.first_page),
                              onPressed: () {
                                jumpToPage()(page: 0);
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.arrow_back),
                              onPressed: () {
                                animateToPage(page: page - 2);
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.arrow_forward),
                              onPressed: () {
                                animateToPage(page: page);
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.last_page),
                              onPressed: () {
                                jumpToPage(page: totalPages - 1);
                              },
                            ),
                          ],
                        );
                      }, *//*
                      ),*/
                    ):Container(

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
                      goToNextPage(context, 0,restaurentItem.id.toString(),restaurentItem.name!);
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
