import 'package:ecommerce_app/view_models/product_cubit/product_details_cubit.dart';
import 'package:ecommerce_app/views/pages/product_details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'app_routes.dart';
import 'package:ecommerce_app/views/pages/custom_bottom_navbar.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.homeRoute:
        return MaterialPageRoute(
          builder: (context) => const CustomBottomNavbar(),
          settings: settings,
        );
      case AppRoutes.productDetailsRoute:
        final String productId = settings.arguments as String;
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) {final  cubit = ProductDetailsCubit();
            cubit.GetProductDetails(productId);
            return cubit;},
            child: ProductDetailsPage(productId: productId),
          ),
          settings: settings,
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text("No route defined for ${settings.name}")),
          ),
        );
    }
  }
}
