import 'package:ecommerce_c17_online/core/resources/assets_manager.dart';
import 'package:ecommerce_c17_online/core/resources/color_manager.dart';
import 'package:ecommerce_c17_online/core/widget/home_screen_app_bar.dart';
import 'package:ecommerce_c17_online/di.dart';
import 'package:ecommerce_c17_online/features/auth/presentation/bloc/auth_states.dart';
import 'package:ecommerce_c17_online/features/main_layout/categories/presentation/categories_tab.dart';
import 'package:ecommerce_c17_online/features/main_layout/favourite/presentation/favourite_screen.dart';
import 'package:ecommerce_c17_online/features/main_layout/home/presentation/bloc/home_bloc.dart';
import 'package:ecommerce_c17_online/features/main_layout/home/presentation/bloc/home_events.dart';
import 'package:ecommerce_c17_online/features/main_layout/profile_tab/presentation/profile_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';

import 'home/presentation/bloc/home_states.dart';
import 'home/presentation/home_tab.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int currentIndex = 0;
  List<Widget> tabs = [
    const HomeTab(),
    const CategoriesTab(),
    const FavouriteScreen(),
    const ProfileTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return LoaderOverlay(
      child: BlocProvider(
        create: (context) => getIt<HomeBloc>()..add(GetCartDetailsEvent()),
        child: BlocConsumer<HomeBloc, HomeState>(
          listener: (context, state) {
            if(state.getCartDetailsStatus==RequestStatus.loading){
              context.loaderOverlay.show();
            }else{
              context.loaderOverlay.hide();
            }
          },
          builder: (context, state) {
            return Scaffold(
              appBar:  HomeScreenAppBar(
                cartNumber: state.cartResponse?.numOfCartItems??0,
              ),
              extendBody: false,
              body: tabs[currentIndex],
              bottomNavigationBar: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.11,
                  child: BottomNavigationBar(
                    currentIndex: currentIndex,
                    onTap: (value) => changeSelectedIndex(value),
                    backgroundColor: ColorManager.primary,
                    type: BottomNavigationBarType.fixed,
                    selectedItemColor: ColorManager.primary,
                    unselectedItemColor: ColorManager.white,
                    showSelectedLabels: false,
                    // Hide selected item labels
                    showUnselectedLabels: false,
                    // Hide unselected item labels
                    items: [
                      // Build BottomNavigationBarItem widgets for each tab
                      CustomBottomNavBarItem(IconsAssets.icHome, "Home"),
                      CustomBottomNavBarItem(IconsAssets.icCategory, "Category"),
                      CustomBottomNavBarItem(IconsAssets.icWithList, "WishList"),
                      CustomBottomNavBarItem(IconsAssets.icProfile, "Profile"),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  changeSelectedIndex(int selectedIndex) {
    setState(() {
      currentIndex = selectedIndex;
    });
  }
}

class CustomBottomNavBarItem extends BottomNavigationBarItem {
  String iconPath;
  String title;

  CustomBottomNavBarItem(this.iconPath, this.title)
    : super(
        label: title,
        icon: ImageIcon(
          AssetImage(iconPath), // Inactive icon image
          color: ColorManager.white, // Inactive icon color
        ),
        activeIcon: CircleAvatar(
          backgroundColor: ColorManager.white, // Background of active icon
          child: ImageIcon(
            AssetImage(iconPath),
            color: ColorManager
                .primary, // Active icon imagecolor: ColorManager.primary, // Active icon color
          ),
        ),
      );
}
