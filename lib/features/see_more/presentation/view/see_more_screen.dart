import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:star_wars/core/components/custom_components/custom_loader.dart';
import 'package:star_wars/core/shared/data_providers/data_provider.dart';
import 'package:star_wars/core/utils/app_constants/app_strings.dart';
import 'package:star_wars/core/utils/design_utils/app_theme.dart';
import 'package:star_wars/features/home/presentation/widgets/data_component_widget.dart';
import 'package:star_wars/features/see_more/presentation/view_model_manger/see_more_cubit.dart';

class SeeMoreScreen extends StatelessWidget {
  const SeeMoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> data =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    List dataList = data['data'];
    var cubit = BlocProvider.of<SeeMoreCubit>(context);
    return Scaffold(
      appBar: AppBar(
        title:
            Text(AppLocalizations.of(context).translate(data['screen_name'])),
      ),
      body: BlocBuilder<SeeMoreCubit, SeeMoreState>(
        builder: (context, state) {
          cubit.scrollController.addListener(() {
            cubit.getData(dataList);
          });
          if (state is SeeMoreFailedState) {
            return Center(child: Text(state.error));
          }
          if (state is SeeMoreSuccessState) {
            dataList = state.data;
          }
          return Column(
            children: [
              Expanded(
                child: GridView.builder(
                  itemCount: dataList.length,
                  controller: cubit.scrollController,
                  padding: const EdgeInsets.all(AppSizes.paddingSizeEight),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10),
                  itemBuilder: (context, index) {
                    DataProvider? dataProvider;
                    dataProvider = cubit.getDataProvider(dataList[index]);
                    return DataComponentWidget(
                      upperData: dataProvider.upperData,
                      lowerData: dataProvider.lowerData,
                      isLoading: dataList.isEmpty,
                    );
                  },
                ),
              ),
              Visibility(visible: cubit.loading, child: const CustomLoader())
            ],
          );
        },
      ),
    );
  }
}
