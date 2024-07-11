import 'package:flutter/material.dart';
import 'package:star_wars/core/utils/design_utils/app_theme.dart';

import 'see_all_component.dart';

class TitleRowComponent extends StatelessWidget {
  const TitleRowComponent({super.key, this.onTap, required this.headerText});

  final void Function()? onTap;
  final String headerText;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          headerText,
          style: AppTextStyles.titleTextStyle,
        ),
        SeeAllComponent(
          onTap: onTap,
        )
      ],
    );
  }
}
