import 'package:ecommerce_app/utils/routers/app_routes.dart';
import 'package:ecommerce_app/view_models/home_cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/utils/theme/app_color.dart';
import 'package:ecommerce_app/views/widgets/product_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';

class HomeTabView extends StatelessWidget {
  const HomeTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      bloc: BlocProvider.of<HomeCubit>(context),
      builder: (context, state) {
        if (state is HomeLoading) {
          return Center(child: CircularProgressIndicator.adaptive());
        } else if (state is HomeLoaded) {
          return SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 16),
                FlutterCarousel.builder(
                  itemCount: state.carouselItems.length,
                  itemBuilder: (context, index, realIndex) {
                    final product = state.carouselItems[index];
                    return Container(
                      width: double.infinity,
                      height: 200,
                      decoration: BoxDecoration(
                        color: AppColors.greyBackground,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(product.imgUrl, fit: BoxFit.cover),
                      ),
                    );
                  },

                  options: FlutterCarouselOptions(
                    autoPlayInterval: Duration(seconds: 4),
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    height: 200,
                    autoPlay: true,
                    enlargeCenterPage: true,
                    viewportFraction: 1,
                    slideIndicator: CircularSlideIndicator(
                      slideIndicatorOptions: SlideIndicatorOptions(
                        indicatorBorderColor: AppColors.greyBackground,
                        currentIndicatorColor: AppColors.primary,
                        indicatorBackgroundColor: AppColors.greyBackground,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "New Arrivals",
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    Text(
                      "See All",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                GridView.builder(
                  itemCount: state.products.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 0.7,
                  ),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap:(){
                        Navigator.of(context).pushNamed(AppRoutes.productDetailsRoute , arguments: state.products[index].id);
                      },
                      child: ProductItem(productItem: state.products[index]));
                  },
                ),
              ],
            ),
          );
        } else if (state is HomeError) {
          return Center (child: Text(state.message),);
        } else {
          return Center(child: Text('test'),) ;
        }
      },
    );
  }
}
