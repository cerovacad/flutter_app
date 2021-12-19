import 'package:flutter/material.dart';
import 'package:flutter_application_moc/data_models/product_data_model/product_data_model.dart';
import 'package:flutter_application_moc/providers/liked_products_provider.dart';
import 'package:flutter_application_moc/widgets/products_list_widget.dart';
import 'package:provider/provider.dart';

class LikedProductsScreen extends StatelessWidget {
  const LikedProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<ProductDataModel> products =
        context.watch<LikedProductsProvider>().likedPosts;
    return Scaffold(
        appBar: AppBar(title: const Text('Liked')),
        body: ProductListWidget(
          products: products,
        ));
  }
}
