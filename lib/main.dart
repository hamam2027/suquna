import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suquna/acore/databases/cache/cache_helper.dart';
import 'package:suquna/approuter/approuter.dart';
import 'package:suquna/constant/appcolor.dart';
import 'package:suquna/constant/constant_text.dart';
import 'package:suquna/constant/localization.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await GetStorag.init();
  await Cashhelper.init();
  ChuckerFlutter.showOnRelease = true;
  ChuckerFlutter.showNotification = true;
  // var GetStorag = GetStorag();

  runApp(const MyApp());
  token = await Cashhelper.grtdata(key: "token");
  id = await Cashhelper.grtdata(key: "id");
  // id = GetStorag.read("id");
  print(token);
  print(id);
  if (await Cashhelper.grtdata(key: "lang") == null) {
    await Cashhelper.saveData(
      key: "lang",
      value: Get.deviceLocale.toString(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    String langCode = Cashhelper.grtdata(key: "lang") ?? "ar";
    Locale locale = Locale(langCode.split('_').first);
    print(locale);

    return GetMaterialApp(
      navigatorObservers: [ChuckerFlutter.navigatorObserver],
      textDirection:
          langCode == "en_US" ? TextDirection.ltr : TextDirection.rtl,
      translations: Translate(),
      locale: locale,
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
      initialRoute: token != null ? AppRouter.home : AppRouter.signinscreen,
      getPages: AppRouter.routs,
    );
  }
}
// AZXCas!@#325
// maher@h.com
// hamama@flutter.com
//   ASDwer@#125

  // hamed@gmail.com
  // As@#$1236589