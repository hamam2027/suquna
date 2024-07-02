import 'package:flutter/material.dart';
import 'package:suquna/constant/appcolor.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreenProductsLoding extends StatelessWidget {
  const HomeScreenProductsLoding({
    super.key,
    required this.div,
  });

  final Size div;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: 5,
      itemBuilder: (BuildContext context, int index) {
        return Row(
          children: [
            Expanded(
              child: Container(
                  height: 250,
                  width: div.width * 0.4,
                  margin: EdgeInsets.all(5),
                  child: Center(
                    child: Shimmer.fromColors(
                        baseColor: AppColors.primaryClr,
                        highlightColor: AppColors.secondaryClr,
                        child: Text("loding")),
                  )),
            ),
            Expanded(
              child: Container(
                  height: 250,
                  width: div.width * 0.4,
                  margin: EdgeInsets.all(5),
                  child: Center(
                    child: Shimmer.fromColors(
                        baseColor: AppColors.primaryClr,
                        highlightColor: AppColors.secondaryClr,
                        child: Text("loding")),
                  )),
            ),
          ],
        );
      },
    );
  }
}

class CategorisLoding extends StatelessWidget {
  const CategorisLoding({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 5,
      itemBuilder: (BuildContext context, int index) {
        return Container(
            height: 120,
            width: 100,
            margin: EdgeInsets.all(5),
            child: Shimmer.fromColors(
                baseColor: AppColors.primaryClr,
                highlightColor: AppColors.secondaryClr,
                child: Text("loding")));
      },
    );
  }
}
