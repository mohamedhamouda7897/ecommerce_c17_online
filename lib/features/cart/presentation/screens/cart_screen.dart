import 'package:ecommerce_c17_online/core/resources/assets_manager.dart';
import 'package:ecommerce_c17_online/core/resources/color_manager.dart';
import 'package:ecommerce_c17_online/core/resources/styles_manager.dart';
import 'package:ecommerce_c17_online/core/resources/values_manager.dart';
import 'package:ecommerce_c17_online/di.dart';
import 'package:ecommerce_c17_online/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:ecommerce_c17_online/features/cart/presentation/bloc/cart_events.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loader_overlay/loader_overlay.dart';

import '../../../auth/presentation/bloc/auth_states.dart';
import '../bloc/cart_state.dart';
import '../widgets/cart_item_widget.dart';
import '../widgets/total_price_and_checkout_botton.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LoaderOverlay(
      child: BlocProvider(
        create: (context) => getIt<CartBloc>()..add(GetCartDetailsDataEvent()),
        child: BlocConsumer<CartBloc, CartState>(
          listener: (context, state) {
            if (state.getCartDetailsStatus == RequestStatus.loading) {
              context.loaderOverlay.show();
            } else {
              context.loaderOverlay.hide();
            }
          },
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                title: Text(
                  'Cart',
                  style: getMediumStyle(
                    fontSize: 20,
                    color: ColorManager.textColor,
                  ),
                ),
                centerTitle: true,
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: ImageIcon(
                      AssetImage(IconsAssets.icSearch),
                      color: ColorManager.primary,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: ImageIcon(
                      AssetImage(IconsAssets.icCart),
                      color: ColorManager.primary,
                    ),
                  ),
                ],
              ),
              body: Padding(
                padding: const EdgeInsets.all(AppPadding.p14),
                child: Column(
                  children: [
                    Expanded(
                      // the list of cart items ===============
                      child: ListView.separated(
                        itemBuilder: (context, index) => CartItemWidget(
                          imagePath:
                              state
                                  .cartResponse
                                  ?.data
                                  ?.products?[index]
                                  .product
                                  ?.imageCover ??
                              "",
                          title:
                              state
                                  .cartResponse
                                  ?.data
                                  ?.products?[index]
                                  .product
                                  ?.title ??
                              "",
                          price:
                              state
                                  .cartResponse
                                  ?.data
                                  ?.products?[index]
                                  .price ??
                              0,
                          quantity:
                              state
                                  .cartResponse
                                  ?.data
                                  ?.products?[index]
                                  .count ??
                              0,
                          onDeleteTap: () {},
                          onDecrementTap: (value) {},
                          onIncrementTap: (value) {},
                          size: 40,
                          color: Colors.black,
                          colorName: 'Black',
                        ),
                        separatorBuilder: (context, index) =>
                            SizedBox(height: AppSize.s12.h),
                        itemCount: state.cartResponse?.numOfCartItems ?? 0,
                      ),
                    ),
                    // the total price and checkout button========
                    TotalPriceAndCheckoutBotton(
                      totalPrice: state.cartResponse?.data?.totalCartPrice??0,
                      checkoutButtonOnTap: () {},
                    ),
                    SizedBox(height: 10.h),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
