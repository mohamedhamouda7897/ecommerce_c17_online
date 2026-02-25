import 'package:ecommerce_c17_online/core/resources/values_manager.dart';
import 'package:ecommerce_c17_online/di.dart';
import 'package:ecommerce_c17_online/features/main_layout/categories/presentation/bloc/category_events.dart';
import 'package:ecommerce_c17_online/features/main_layout/categories/presentation/bloc/category_states.dart';
import 'package:ecommerce_c17_online/features/main_layout/categories/presentation/widgets/categories_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/category_bloc.dart';
import 'widgets/sub_categories_list.dart';

class CategoriesTab extends StatelessWidget {
  const CategoriesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      getIt<CategoryBloc>()
        ..add(GetCategoriesEvent())..add(GetSubCategoriesEvent()),
      child:  Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppPadding.p12,
          vertical: AppPadding.p12,
        ),
        child: BlocConsumer<CategoryBloc, CategoryState>(
          listener: (context, state) {

          },
          builder: (context, state) {
            return Row(
              children: [
                CategoriesList(),
                SizedBox(width: AppSize.s16),
                SubCategoriesList(),
              ],
            );
          },
        ),
      ),
    );
  }
}
