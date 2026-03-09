import 'package:ecommerce_c17_online/core/resources/constants_manager.dart';
import 'package:ecommerce_c17_online/core/resources/values_manager.dart';
import 'package:ecommerce_c17_online/features/main_layout/favourite/presentation/widgets/favourite_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../di.dart';
import 'bloc/wish_bloc.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<WishBloc>()..add(GetWishList()),
      child: BlocConsumer<WishBloc, WishState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppSize.s14.w,
              vertical: AppSize.s10.h,
            ),
            child: ListView.builder(
              itemCount:state.response?.count??0,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: AppSize.s12.h),
                  child: FavoriteItem(product: state.response!.data![index]),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
