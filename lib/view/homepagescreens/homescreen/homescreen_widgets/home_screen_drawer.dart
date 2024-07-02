import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suquna/acore/databases/cache/cache_helper.dart';
import 'package:suquna/constant/appcolor.dart';

class HomeScreenDrawer extends StatelessWidget {
  const HomeScreenDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: RoundedRectangleBorder(),
      backgroundColor: AppColors.primaryDark,
      child: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: CircleAvatar(
                  backgroundColor: AppColors.dangerClr,
                  child: Icon(
                    Icons.close,
                    size: 30,
                  ),
                ),
                color: AppColors.blackClr,
              ),
              SizedBox(
                height: 20,
              ),
              ...List.generate(
                  6,
                  (index) => Container(
                        decoration: BoxDecoration(
                            color: AppColors.whiteClr,
                            borderRadius: BorderRadius.circular(15)),
                        padding: EdgeInsets.all(20),
                        margin:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                        child: ListTile(
                          leading: Image.asset(
                            "assets/images/icon$index.png",
                            width: 40,
                          ),
                          title: Text(drawestring[index].tr),
                        ),
                      )),
              Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Change Language".tr,
                    ),
                    DropdownButtonFormField(
                      value: "العربية",
                      items: langDropdownItemsMenus,
                      onChanged: (value) async {
                        // var GetStorag = GetStorag();
                        late Locale local;
                        if (value == 'English') {
                          await Cashhelper.saveData(
                              key: "lang", value: "en_US");
                          // GetStorag.write('lang', "en_US");
                          local = const Locale("en_US");
                          Get.updateLocale(local);
                          // Get.appUpdate();
                          print(local);
                        } else {
                          await Cashhelper.saveData(
                              key: "lang", value: "ar_EG");
                          // GetStorag.write('lang', "ar_EG");
                          local = const Locale("ar_EG");
                          Get.updateLocale(local);
                          // Get.appUpdate();
                          print(local);
                        }
                      },
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

final List<DropdownMenuItem<String>> langDropdownItemsMenus = langList
    .map((String value) => DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        ))
    .toList();
const langList = <String>[
  'العربية',
  'English',
];
List<String> drawestring = [
  'Fire Ad',
  'Technical support',
  'About our market',
  'packages',
  'Politics and Ethics',
  'Marketing window',
  "Change Language",
];
