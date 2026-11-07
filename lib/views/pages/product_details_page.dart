import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/utils/theme/app_color.dart';
import 'package:ecommerce_app/view_models/product_cubit/product_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailsPage extends StatefulWidget {
  final String productId;
  const ProductDetailsPage({super.key, required this.productId});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
      bloc: BlocProvider.of<ProductDetailsCubit>(context),
      builder: (context, state) {
        if (state is ProductDetailsLoading) {
          return Scaffold(
            body: Center(child: CircularProgressIndicator.adaptive()),
          );
        } else if (state is ProductDetailsLoaded) {
          final product = state.product;

          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              centerTitle: true,
              title: Text("Product Details "),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.favorite_outline_outlined),
                ),
              ],
            ),
            extendBodyBehindAppBar: true,
            body: Stack(
              children: [
                Container(
                  height: size.height * 0.5,
                  width: double.infinity,
                  decoration: BoxDecoration(color: AppColors.greyBackground),
                  child: Column(
                    children: [
                      const SizedBox(height: 70),
                      CachedNetworkImage(
                        imageUrl: product.imgUrl,
                        fit: BoxFit.contain,
                        height: size.height * 0.4,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: size.height * 0.48),
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.whiteBackground,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        topLeft: Radius.circular(30),
                      ),
                    ),
                    child: Column(children: [
                      Row(
                       
                      )
                    ]),
                  ),
                ),
              ],
            ),
          );
        } else if (state is ProductDetailsError) {
          return Scaffold(body: Center(child: Text("Error")));
        } else {
          return Scaffold(body: Center(child: Text("Somethong went wrong!")));
        }
      },
    );
  }
}
