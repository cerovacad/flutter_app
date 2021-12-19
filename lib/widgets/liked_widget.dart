import 'package:flutter/material.dart';
import 'package:flutter_application_moc/data_models/product_data_model/product_data_model.dart';
import 'package:flutter_application_moc/providers/liked_products_provider.dart';
import 'package:provider/provider.dart';

class LikedWidget extends StatelessWidget {
  final ProductDataModel product;
  const LikedWidget({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductDataModel found =
        context.watch<LikedProductsProvider>().likedPosts.firstWhere(
              (p) => p.id == product.id,
              orElse: () => ProductDataModel(id: null),
            );
    bool liked = found.id != null;
    return IconButton(
        onPressed: () {
          if (liked) {
            context.read<LikedProductsProvider>().unlike(product);
          } else {
            context.read<LikedProductsProvider>().like(product);
          }
        },
        icon: liked
            ? const Icon(
                Icons.favorite,
                color: Colors.redAccent,
                size: 30,
              )
            : const Icon(
                Icons.favorite_outline,
                size: 30,
              ));
  }
}
