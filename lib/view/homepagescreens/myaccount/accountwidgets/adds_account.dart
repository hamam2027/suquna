// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:suquna/constant/appcolor.dart';
import 'package:suquna/constant/appstyle.dart';
import 'package:shimmer/shimmer.dart';

class AccountAdds extends StatelessWidget {
  AccountAdds({
    super.key,
    required this.name,
    required this.description,
    required this.imglink,
    this.edit,
    required this.deletAd,
  });
  final String name;
  final String description;
  final String imglink;

  final Function? edit;
  final Function deletAd;

  //  final int listlength ;

  @override
  Widget build(BuildContext context) {
    Size devsize = MediaQuery.of(context).size;
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
                imageUrl: imglink,
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
                    name,
                    style: AppStyle.normalb,
                  ),
                  Expanded(
                      child: Text(
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
                            edit!();
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
                            deletAd();
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

class AccountFavorate extends StatelessWidget {
  AccountFavorate({
    Key? key,
    required this.name,
    required this.description,
    required this.imglink,
    required this.removeAd,
    required this.loding,
    required this.ud,
    required this.udi,
  }) : super(key: key);
  final String name;
  final String description;
  final String imglink;

  final Function removeAd;
  final bool loding;
  final int ud;
  final int udi;

  //  final int listlength ;

  @override
  Widget build(BuildContext context) {
    Size devsize = MediaQuery.of(context).size;
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
                imageUrl: imglink,
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
                    name,
                    style: AppStyle.normalb,
                  ),
                  Expanded(
                      child: Text(
                    description,
                  )),
                  // Spacer(),
                  Row(
                    children: [
                      Spacer(),
                      (loding && udi == ud)
                          ? CircularProgressIndicator()
                          : MaterialButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              padding: EdgeInsets.all(5),
                              color: AppColors.warningClr,
                              onPressed: () {
                                removeAd();
                                // controller.deleteMyAdd(
                                //   controller
                                //       .myAddsModel!.items![index].id
                                //       .toString(),
                                // );
                              },
                              child: Text("ازالة"),
                            ),
                    ],
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
