import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:suquna/approuter/approuter.dart';
import 'package:suquna/constant/appcolor.dart';
import 'package:suquna/constant/localization.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var getstorage = GetStorage();
    if (getstorage.read("lang") == null) {
      getstorage.write("lang", Get.deviceLocale);
    }

    return GetMaterialApp(
      textDirection: getstorage.read("lang") == "en_US"
          ? TextDirection.ltr
          : TextDirection.rtl,
      translations: Translate(),
      locale: Locale(getstorage.read("lang")),
      debugShowCheckedModeBanner: false,
      title: "Soaqna".tr,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
            backgroundColor: Colors.transparent,
            iconTheme: IconThemeData(color: AppColors.dangerClr)),
        scaffoldBackgroundColor: Colors.transparent,
        fontFamily: "Poppins",
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryClr),
        useMaterial3: true,
      ),
      initialRoute: AppRouter.signinscreen,
      getPages: AppRouter.routs,
    );
  }
}
