import 'package:ecommerce_app/models/category_model.dart';
import 'package:ecommerce_app/utils/theme/app_color.dart';
import 'package:flutter/material.dart';

class CategoryTabView extends StatelessWidget {
  const CategoryTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: dummyCategories.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: InkWell(
            onTap: () {
              // Handle category tap
              
            },
            child: Container(
              width: double.infinity,
              height: 145,
              decoration: BoxDecoration(
                border:   Border.all(color: AppColors.greyBackground),
                image: DecorationImage(
                  image: AssetImage(dummyCategories[index].imageUrl),
                  fit: BoxFit.fitWidth,
                ),
                borderRadius:   BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 50 , left :35),
                child: Column(
                  crossAxisAlignment:   CrossAxisAlignment.start,
                  children: [
                    Text(
                      dummyCategories[index].name,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: AppColors.blackText,
                        fontWeight: FontWeight.w600,
                        
                      ),
                    ),
                    Text("${dummyCategories[index].productsCount} Products",
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: AppColors.blackText,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
