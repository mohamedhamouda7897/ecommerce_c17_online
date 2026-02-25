import 'package:ecommerce_c17_online/core/resources/color_manager.dart';
import 'package:ecommerce_c17_online/core/resources/font_manager.dart';
import 'package:ecommerce_c17_online/core/resources/styles_manager.dart';
import 'package:ecommerce_c17_online/core/resources/values_manager.dart';
import 'package:ecommerce_c17_online/features/main_layout/categories/presentation/bloc/category_bloc.dart';
import 'package:ecommerce_c17_online/features/main_layout/categories/presentation/bloc/category_events.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryItem extends StatelessWidget {
  final int index;
  final String title;

  final bool isSelected;

  const CategoryItem(this.index, this.title, this.isSelected, {super.key});

  @override
  Widget build(BuildContext context) {
    // Handle item click by calling onItemClick callback
    return InkWell(
      onTap: () {
        context.read<CategoryBloc>().add(ChangeSelectedIndex(index));
      },
      child: Container(
        // Set background color based on selection
        color: isSelected ? ColorManager.white : Colors.transparent,
        padding: const EdgeInsets.all(AppPadding.p8),
        child: Row(
          children: [
            //Show/hide the indicator based on selection
            Visibility(
              visible: isSelected,
              child: Container(
                width: AppSize.s8,
                height: AppSize.s60,
                decoration: BoxDecoration(
                  color: ColorManager.primary,
                  borderRadius: BorderRadius.circular(AppSize.s100),
                ),
              ),
            ),
            // wrap the text with expanded to avoid overflow error
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: AppPadding.p16,
                  horizontal: AppPadding.p8,
                ),
                child: Text(
                  title,
                  textAlign: TextAlign.start,
                  style: getMediumStyle(
                    color: ColorManager.primary,
                    fontSize: FontSize.s14,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
