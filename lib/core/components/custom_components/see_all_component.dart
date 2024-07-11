import 'package:flutter/material.dart';
import 'package:star_wars/core/utils/app_constants/app_strings.dart';
import 'package:star_wars/core/utils/design_utils/app_theme.dart';

class SeeAllComponent extends StatelessWidget {
  const SeeAllComponent({super.key, this.onTap});

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Text(
            AppLocalizations.of(context).translate(AppStrings.seeAll),
            style: AppTextStyles.highlightTextStyle,
          ),
          Container(
            margin: const EdgeInsets.only(left: AppSizes.paddingSizeDefault),
            decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(AppSizes.paddingSizeDefault),
                color: AppColors.cardColor),
            child: const Icon(
              Icons.arrow_forward_ios_sharp,
              color: AppColors.primaryColor,
            ),
          )
        ],
      ),
    );
  }
}
