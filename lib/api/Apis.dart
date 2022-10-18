import 'dart:core';

class Apis{



  //static const String baseUrl="https://www.welcometograinofsalt.ca/API/frontend/";
  static const String baseUrl="https://apnapasand.in/api/v1/";
  static const String baseUrl2="https://apnapasand.in/api/v2/";
  //static const String baseUrl="http://wdoha-env.eba-fcmfzskx.ap-south-1.elasticbeanstalk.com/api/v1/";
  //static const String baseUrl2="http://wdoha-env.eba-fcmfzskx.ap-south-1.elasticbeanstalk.com/api/v2/";
  //static const String baseUrl="http://wdoha-env.eba-fcmfzskx.ap-south-1.elasticbeanstalk.com/swagger-ui/index.html";

  static const String payment=baseUrl + "";
  static const String listingCatApi=baseUrl + "categories.php";
  static const String listingMenuApi=baseUrl + "menulist.php";
  static const String forgetPassword=baseUrl + "forgot_password.php";
  static const String loginApi=baseUrl + "auth/login";
  static const String signUpApi=baseUrl + "user_register.php";
  static const String busesSchedule=baseUrl + "buses";
  static const String restaurant=baseUrl + "restaurants";
  static const String training=baseUrl + "trainings/";
  static const String busSchedule=baseUrl2 + "buses";
  static const String restaurentList=baseUrl2 + "restaurants";
  static const String foodCategory=baseUrl + "restaurant/menu/";



  static const String addToCart=baseUrl + "add_to_cart.php";
  static const String getCart=baseUrl + "cart.php";
  static const String removeCcart=baseUrl + "remove_cart.php";
  static const String saveAddress=baseUrl + "update_billing_address.php";
  static const String getAddress=baseUrl + "billing_address.php";
  static const String getProfile=baseUrl + "user_details.php";
  static const String getMyOrdersList=baseUrl + "my_order.php";
  static const String getTempOrderId=baseUrl + "create_orderid.php";
  static const String updateBillingAddress=baseUrl + "update_billing_address.php";
  static const String saveToCart=baseUrl + "save_card.php";
  static const String createOrder=baseUrl + "create_order.php";

  static const String listingCategoryApi=baseUrl+"product_listing.php";
}