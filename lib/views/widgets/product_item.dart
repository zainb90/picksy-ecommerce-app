import 'package:ecommerce_app/models/product_item_model.dart';
import 'package:ecommerce_app/utils/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ProductItem extends StatelessWidget {
  final ProductItemModel productItem;
  const ProductItem({super.key, required this.productItem});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              width: double.infinity,
              height: 180,
              decoration: BoxDecoration(
                color: AppColors.greyBackground,
                borderRadius: BorderRadius.circular(20),
              ),

              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: CachedNetworkImage(
                    imageUrl: productItem.imgUrl,
                    fit: BoxFit.contain,
                    placeholder: (context, url) =>
                        Center(child: CircularProgressIndicator.adaptive()),
                    errorWidget: (context, url, error) =>
                        Icon(Icons.error, color: AppColors.error),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 8,
              right: 8,
              child: IconButton(
                onPressed: () {},
                iconSize: 20,
                icon: const Icon(Icons.favorite_border),
                color: AppColors.whiteBackground,
                style: IconButton.styleFrom(
                  backgroundColor: AppColors.greyText,
                ),
                constraints: BoxConstraints(minWidth: 25, minHeight: 25),
              ),
            ),
          ],
        ),
        SizedBox(height: 8.0),
        Text(
          productItem.name,
          style: Theme.of(
            context,
          ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
        ),
        Text(
          productItem.category,
          style: Theme.of(
            context,
          ).textTheme.labelLarge?.copyWith(color: AppColors.greyText),
        ),
        Text(
          "\$${productItem.price}",
          style: Theme.of(
            context,
          ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
