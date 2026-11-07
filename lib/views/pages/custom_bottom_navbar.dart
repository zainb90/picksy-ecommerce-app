import 'package:ecommerce_app/utils/theme/app_color.dart';
import 'package:ecommerce_app/views/pages/cart_page.dart';
import 'package:ecommerce_app/views/pages/favorites_page.dart';
import 'package:ecommerce_app/views/pages/home_page.dart';
import 'package:ecommerce_app/views/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

class CustomBottomNavbar extends StatefulWidget {
  const CustomBottomNavbar({super.key});

  @override
  State<CustomBottomNavbar> createState() => _CustomBottomNavbarState();
}

class _CustomBottomNavbarState extends State<CustomBottomNavbar> {
  late PersistentTabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }

  List<PersistentTabConfig> _tabs() {
    return [
      PersistentTabConfig(
        screen: HomePage(),
        item: ItemConfig(
          icon: Icon(Icons.home),
          inactiveIcon: Icon(Icons.home_outlined),
          title: "Home",
          activeForegroundColor: AppColors.primary,
          inactiveForegroundColor: AppColors.secondary,
        ),
      ),
      PersistentTabConfig(
        screen: CartPage(),
        item: ItemConfig(
          icon: Icon(Icons.shopping_cart),
          inactiveIcon: Icon(Icons.shopping_cart_outlined),
          title: "My Order",
          activeForegroundColor: AppColors.primary,
          inactiveForegroundColor: AppColors.secondary,
        ),
      ),
      PersistentTabConfig(
        screen: FavoritesPage(),
        item: ItemConfig(
          icon: Icon(Icons.favorite),
          inactiveIcon: Icon(Icons.favorite_border_rounded),
          title: "Favorite",
          activeForegroundColor: AppColors.primary,
          inactiveForegroundColor: AppColors.secondary,
        ),
      ),
      PersistentTabConfig(
        screen: ProfilePage(),
        item: ItemConfig(
          icon: Icon(Icons.person),
          inactiveIcon: Icon(Icons.person_outlined),
          title: "My Profile",
          activeForegroundColor: AppColors.primary,
          inactiveForegroundColor: AppColors.secondary,
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      controller: _controller,

      tabs: _tabs(),

      navBarBuilder: (navBarConfig) => Style7BottomNavBar(
        navBarConfig: navBarConfig,
        navBarDecoration: NavBarDecoration(
          color: AppColors.whiteBackground,
          borderRadius: BorderRadius.circular(8),
        ),
        itemAnimationProperties: ItemAnimation(
          duration: const Duration(microseconds: 200),
          curve: Curves.easeInOut,
        ),
      ),
    );
  }
}
