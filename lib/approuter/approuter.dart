import 'package:get/get.dart';
import 'package:suquna/bindings/authbindings/forgetpasswordscreenbinding.dart';
import 'package:suquna/bindings/authbindings/signinbinding.dart';
import 'package:suquna/bindings/authbindings/signupbinding.dart';
import 'package:suquna/bindings/categorybinding.dart';
import 'package:suquna/bindings/chatpagebindings/chatpagebinding.dart';
import 'package:suquna/bindings/editprofilebinding.dart';
import 'package:suquna/bindings/homescreensbinding/accountscreenbinding.dart';
import 'package:suquna/bindings/homescreensbinding/chatscreenbinding.dart';
import 'package:suquna/bindings/homescreensbinding/homebinding.dart';
import 'package:suquna/bindings/homescreensbinding/homscreenbinding.dart';
import 'package:suquna/bindings/homescreensbinding/myaddsscreenbinding.dart';
import 'package:suquna/bindings/homescreensbinding/sellscreenbinding.dart';
import 'package:suquna/bindings/productscreenbindings/editproductscreenbinding.dart';
import 'package:suquna/bindings/productscreenbindings/productscreenbinding.dart';
import 'package:suquna/bindings/sellerbinding/sellerbinding.dart';
import 'package:suquna/view/auth/forgetpassswordscreen.dart';
import 'package:suquna/view/auth/signinscreen.dart';
import 'package:suquna/view/auth/signupscreen.dart';
import 'package:suquna/view/category/categoryscreen.dart';
import 'package:suquna/view/chatpage/chatpagescreen.dart';
import 'package:suquna/view/editprofilescreen.dart';
import 'package:suquna/view/homepage/homepage.dart';
import 'package:suquna/view/homepagescreens/chatscreen/chatscreen.dart';
import 'package:suquna/view/homepagescreens/homescreen/homescreen.dart';
import 'package:suquna/view/homepagescreens/myaccount/myaccount.dart';
import 'package:suquna/view/homepagescreens/myads/myadd.dart';
import 'package:suquna/view/homepagescreens/sell/sellscreen.dart';
import 'package:suquna/view/productscreens/editproductscreen.dart';
import 'package:suquna/view/productscreens/productscreen.dart';
import 'package:suquna/view/seller/sellerscreen.dart';

class AppRouter {
  static const String signinscreen = "/";
  static String getHomeRout() => signinscreen;
  static const String chatscreen = "/chatscreen";
  static const String chatPagecreen = "/chatPagecreen";
  static const String homescreen = "/homescreen";
  static const String sellscreen = "/sellscreen";
  static const String myaddsscreen = "/myaddsscreen";
  static const String accountscreen = "/accountscreen";
  static const String categoryscreen = "/categoryscreen";
  static const String signupscreen = "/signupscreen";
  static const String home = "/home";
  static const String forgetpassword = "/forgetpassword";
  static const String productscreen = "/productscreen";
  static const String editproductscreen = "/editproductscreen";
  static const String sellerScreen = "/sellerScreen";
  static const String editprofile = "/editprofile";

  static List<GetPage> routs = [
    GetPage(
      name: home,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: homescreen,
      page: () => HomeScreen(),
      binding: HomeScreenBinding(),
    ),
    GetPage(
      name: chatscreen,
      page: () => ChatScreen(),
      binding: ChatScreenBinding(),
    ),
    GetPage(
      name: chatPagecreen,
      page: () => ChatPageScreen(),
      binding: ChatPageScreenBinding(),
    ),
    GetPage(
      name: sellscreen,
      page: () => SellScreen(),
      binding: SellScreenBinding(),
    ),
    GetPage(
      name: myaddsscreen,
      page: () => MyAddScreen(),
      binding: MyAddsScreenBinding(),
    ),
    GetPage(
      name: accountscreen,
      page: () => AccountScreen(),
      binding: AccountScreenBinding(),
    ),
    GetPage(
      name: categoryscreen,
      page: () => CategoryScreen(),
      binding: CategoryScreenBinding(),
    ),
    GetPage(
      name: signupscreen,
      page: () => SignUpScreen(),
      binding: SignUpScreenBinding(),
    ),
    GetPage(
      name: signinscreen,
      page: () => SignInScreen(),
      binding: SignInScreenBinding(),
    ),
    GetPage(
      name: forgetpassword,
      page: () => ForgetPasswordScreen(),
      binding: ForgetPasswordScreenBinding(),
    ),
    GetPage(
      name: productscreen,
      page: () => ProductScreen(),
      binding: ProductScreenBinding(),
    ),
    GetPage(
      name: editprofile,
      page: () => EditProfileScreen(),
      binding: EditProfileScreenBinding(),
    ),
    GetPage(
      name: editproductscreen,
      page: () => EditProductScreen(),
      binding: EditProductScreenBinding(),
    ),
    GetPage(
      name: sellerScreen,
      page: () => SellerScreen(),
      binding: SellerBinding(),
    ),
  ];
}
