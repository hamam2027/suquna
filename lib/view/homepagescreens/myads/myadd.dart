import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:suquna/componant/sharedwidgets.dart';
import 'package:suquna/constant/appcolor.dart';
import 'package:suquna/constant/appstyle.dart';
import 'package:suquna/controller/homescreeenscontollers/myaddsscreencontroller.dart';

class MyAddScreen extends GetView<MyAddsScreenController> {
  const MyAddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size devsize = MediaQuery.of(context).size;
    return MyMainContainer(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "اعلاناتي",
            style: AppStyle.largo,
          ),
          centerTitle: true,
        ),
        body: ListView.builder(
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: devsize.height / 5,
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  Container(
                    clipBehavior: Clip.antiAlias,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(15)),
                    child: Image.network(
                      controller.img,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "عنوان المنتج",
                        style: AppStyle.normalb,
                      ),
                      Expanded(
                          child: Text(
                              "ويُستخدم في صناعات المطابع ودور النشر. كان لوريم إيبسوم ولايزال المعيار للنص الشكلي منذ القرن الخامس عشر عندما قامت مطبعة مجهولة برص مجموعة من الأحرف بشكل عشوائي أخذتها من نص، لتكوّن كتيّب بمثابة دليل أو مرجع شكلي لهذه الأحرف. خمسة قرون من الزمن لم تقضي على هذا النص، بل انه حتى صار مستخدماً وبشكله الأصلي في الطباعة والتنضيد الإلكتروني. انتشر بشكل كبير في ستينيّات هذا القرن مع إصدار رقائق ")),
                      // Spacer(),
                      Row(
                        children: [
                          Expanded(
                            child: MaterialButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              padding: EdgeInsets.all(5),
                              color: AppColors.infoClr,
                              onPressed: () {},
                              child: Text("تعديل"),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: MaterialButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              padding: EdgeInsets.all(5),
                              color: AppColors.warningClr,
                              onPressed: () {},
                              child: Text("حذف"),
                            ),
                          ),
                        ],
                      )
                    ],
                  ))
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
