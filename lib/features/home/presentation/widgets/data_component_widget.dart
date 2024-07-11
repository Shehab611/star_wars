import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:star_wars/core/utils/design_utils/app_theme.dart';

class DataComponentWidget extends StatelessWidget {
  const DataComponentWidget(
      {super.key,
      this.onFavouritePressed,
      required this.upperData,
      required this.lowerData,
      required this.isLoading});

  final void Function()? onFavouritePressed;
  final String upperData, lowerData;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Shimmer.fromColors(
            baseColor: AppColors.primaryColor,
            highlightColor: AppColors.cardColor,
            child: DataComponent(
              lowerData: lowerData,
              upperData: upperData,
              onFavouritePressed: onFavouritePressed,
            ),
          )
        : DataComponent(
            lowerData: lowerData,
            upperData: upperData,
            onFavouritePressed: onFavouritePressed);
  }
}

class DataComponent extends StatelessWidget {
  const DataComponent(
      {super.key,
      this.onFavouritePressed,
      required this.upperData,
      required this.lowerData});

  final void Function()? onFavouritePressed;
  final String upperData, lowerData;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          width: size.width * 0.45,
          height: size.width * 0.32,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.blue.withOpacity(0.5),
                offset: const Offset(15, 15),
                blurRadius: 3,
                spreadRadius: -10,
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                upperData,
                textAlign: TextAlign.center,
              ),
              Text(
                lowerData,
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
        Positioned(
          right: 1,
          top: -5,
          child: IconButton(
              onPressed: onFavouritePressed,
              icon: CircleAvatar(
                radius: size.width * 0.05,
                backgroundColor: AppColors.cardColor,
                child: Icon(
                  Icons.favorite_border,
                  size: size.width * 0.065,
                  color: AppColors.primaryColor,
                ),
              )),
        )
      ],
    );
  }
}
