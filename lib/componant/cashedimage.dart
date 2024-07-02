import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:suquna/constant/appcolor.dart';
import 'package:shimmer/shimmer.dart';

class CachedImageCustom extends StatelessWidget {
  const CachedImageCustom(
      {super.key, required this.imageUrl, required this.fiit});
  final String imageUrl;
  final BoxFit fiit;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fit: fiit,
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
    );
  }
}
