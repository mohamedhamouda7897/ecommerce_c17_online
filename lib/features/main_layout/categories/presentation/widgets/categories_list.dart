import 'package:ecommerce_c17_online/core/resources/color_manager.dart';
import 'package:ecommerce_c17_online/core/resources/values_manager.dart';
import 'package:ecommerce_c17_online/features/main_layout/categories/presentation/bloc/category_bloc.dart';
import 'package:ecommerce_c17_online/features/main_layout/categories/presentation/bloc/category_events.dart';
import 'package:ecommerce_c17_online/features/main_layout/categories/presentation/bloc/category_states.dart';
import 'package:ecommerce_c17_online/features/main_layout/categories/presentation/widgets/category_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoryBloc, CategoryState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: ColorManager.containerGray,
              border: Border(
                // set the border for only 3 sides
                top: BorderSide(
                  width: AppSize.s2,
                  color: ColorManager.primary.withOpacity(0.3),
                ),
                left: BorderSide(
                  width: AppSize.s2,
                  color: ColorManager.primary.withOpacity(0.3),
                ),
                bottom: BorderSide(
                  width: AppSize.s2,
                  color: ColorManager.primary.withOpacity(0.3),
                ),
              ),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(AppSize.s12),
                bottomLeft: Radius.circular(AppSize.s12),
              ),
            ),

            // the categories items list
            child: ClipRRect(
              // clip the corners of the container that hold the list view
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(AppSize.s12),
                bottomLeft: Radius.circular(AppSize.s12),
              ),
              child: ListView.builder(
                itemCount: state.categoryModel?.results??0,
                itemBuilder: (context, index) => CategoryItem(
                  index,
                  state.categoryModel?.data?[index].name??"",
                  state.selectedIndex == index
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
