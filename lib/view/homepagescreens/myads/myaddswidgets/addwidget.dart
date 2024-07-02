import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:suquna/constant/appcolor.dart';
import 'package:suquna/constant/appstyle.dart';
import 'package:shimmer/shimmer.dart';

class MyAddWidget extends StatelessWidget {
  const MyAddWidget({
    super.key,
    required this.devsize,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.delete,
    required this.edit,
  });

  final Size devsize;
  final String name;
  final String description;
  final String imageUrl;
  final Function delete;
  final Function edit;

  @override
  Widget build(BuildContext context) {
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
          Expanded(
            flex: 1,
            child: Container(
              clipBehavior: Clip.antiAlias,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(15)),
              child: CachedNetworkImage(
                placeholder: (context, url) => Shimmer.fromColors(
                  baseColor: AppColors.primaryClr,
                  highlightColor: AppColors.grayClr,
                  child: Container(
                    child: Center(
                      child: Text("loding"),
                    ),
                  ),
                ),
                imageUrl:
                    // "${ApiLinks.imagelink + controller.myAddsModel!.items![index].image!}",
                    imageUrl,
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    // controller
                    //     .myAddsModel!.items![index].name!,
                    name,
                    style: AppStyle.normalb,
                  ),
                  Expanded(
                      child: Text(
                    // controller.myAddsModel!.items![index]
                    //     .description!,
                    description,
                  )),
                  // Spacer(),
                  Row(
                    children: [
                      Expanded(
                        child: MaterialButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          padding: EdgeInsets.all(5),
                          color: AppColors.infoClr,
                          onPressed: () {
                            edit();
                          },
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
                          onPressed: () {
                            delete();
                            // print(controller.myAddsModel!
                            //     .items![index].id);
                            // controller.deleteMyAdd(
                            //   controller
                            //       .myAddsModel!.items![index].id
                            //       .toString(),
                            // );
                          },
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
  }
}
