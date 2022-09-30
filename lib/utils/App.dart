
import 'package:shared_preferences/shared_preferences.dart';

class App{

  static App? _storageUtil;
  static SharedPreferences? _preferences;

  static Future<App?> getInstance() async {
    if (_storageUtil == null) {
      // keep local instance till it is fully initialized.
      var secureStorage = App._();
      await secureStorage._init();
      _storageUtil = secureStorage;
    }
    return _storageUtil;
  }
  App._();
  Future _init() async {
    _preferences = await SharedPreferences.getInstance();
  }
  // get string
  static String getString(String key, {String defValue = ''}) {
    //print('App getString: $key');
    if (_preferences == null) return defValue;
    return _preferences?.getString(key) ?? defValue;
  }
  // put string
  static Future<bool>? putString(String key, String value) {
    if (_preferences == null) return null;
    return _preferences?.setString(key, value);
  }



  static bool getBool(String key, {bool defValue = false}) {
    //print('App getBool: $key');
    if (_preferences == null) return defValue;
    return _preferences?.getBool(key) ?? defValue;
  }
  // put string
  static Future<bool>? putBool(String key, bool value) {
    if (_preferences == null) return null;
    return _preferences?.setBool(key, value);
  }




  /*setData(String key,String value) async{
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    _prefs.setString(key, value);
    _prefs.commit();
  }

  Future<String> getData(String _key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String _data = prefs.getString('$_key') ?? "";
    return _data;
  }*/


}