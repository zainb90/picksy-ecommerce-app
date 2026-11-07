import 'package:ecommerce_app/utils/routers/app_router.dart';
import 'package:ecommerce_app/views/pages/custom_bottom_navbar.dart';

import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-commerce App',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home:  CustomBottomNavbar(),
     onGenerateRoute:AppRouter.onGenerateRoute ,
    );
  }
}
