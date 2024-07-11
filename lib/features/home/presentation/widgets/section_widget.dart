import 'package:flutter/material.dart';
import 'package:star_wars/core/components/custom_components/custom_loader.dart';
import 'package:star_wars/core/components/custom_components/title_row_component.dart';
import 'package:star_wars/core/shared/data_providers/data_provider.dart';
import 'package:star_wars/core/utils/design_utils/app_theme.dart';
import 'package:star_wars/features/home/presentation/widgets/data_component_widget.dart';

class SectionWidget<T> extends StatelessWidget {
  const SectionWidget({
    super.key,
    required this.headerText,
    required this.data,
    this.onTap,
    required this.getDataProvider,
  });

  final String headerText;
  final List<T> data;
  final void Function()? onTap;
  final DataProvider Function(T data) getDataProvider;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        TitleRowComponent(
          headerText: headerText,
          onTap: onTap,
        ),
        SizedBox(
          height: size.width * 0.45,
          child: Visibility(
            visible: data.isNotEmpty,
            replacement: const CustomLoader(),
            child: ListView.separated(
                padding: const EdgeInsets.symmetric(
                    vertical: AppSizes.paddingSizeSeventeen),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  DataProvider dataProvider = getDataProvider(data[index]);
                  return SizedBox(
                      width: size.width * 0.47,
                      child: DataComponentWidget(
                        upperData: dataProvider.upperData,
                        lowerData: dataProvider.lowerData,
                      ));
                },
                separatorBuilder: (context, index) => SizedBox(
                      width: size.width * 0.02,
                    ),
                itemCount: data.length),
          ),
        )
      ],
    );
  }
}
