import 'package:ecommerce_c17_online/core/routes_manager/routes.dart';
import 'package:ecommerce_c17_online/features/auth/presentation/screens/sign_in_screen.dart';
import 'package:ecommerce_c17_online/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:ecommerce_c17_online/features/main_layout/main_layout.dart';
import 'package:ecommerce_c17_online/features/product_details/presentation/screen/product_details.dart';
import 'package:ecommerce_c17_online/features/products_screen/data/models/ProductResponse.dart';
import 'package:ecommerce_c17_online/features/products_screen/presentation/screens/products_screen.dart';
import 'package:flutter/material.dart';

import '../../features/cart/presentation/screens/cart_screen.dart';

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.cartRoute:
        return MaterialPageRoute(builder: (_) => const CartScreen());
      case Routes.mainRoute:
        return MaterialPageRoute(builder: (_) => const MainLayout());

      case Routes.productsScreenRoute:
        {
          String catId = settings.arguments as String;
          return MaterialPageRoute(
            builder: (_) => ProductsScreen(catId: catId),
          );
        }

      case Routes.productDetails:
        {
          Data product = settings.arguments as Data;
          return MaterialPageRoute(
            builder: (_) => ProductDetails(product: product),
          );
        }

      case Routes.signInRoute:
        return MaterialPageRoute(builder: (_) => SignInScreen());

      case Routes.signUpRoute:
        return MaterialPageRoute(builder: (_) => SignUpScreen());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(title: const Text('No Route Found')),
        body: const Center(child: Text('No Route Found')),
      ),
    );
  }
}
