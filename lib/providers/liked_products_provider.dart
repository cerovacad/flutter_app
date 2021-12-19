import 'package:flutter/material.dart';
import 'package:flutter_application_moc/data_models/product_data_model/product_data_model.dart';

class LikedProductsProvider with ChangeNotifier {
  List<ProductDataModel> likedPosts = [];

  like(ProductDataModel product) {
    likedPosts.add(product);
    notifyListeners();
  }

  unlike(ProductDataModel product) {
    likedPosts = likedPosts.where((p) => p.id != product.id).toList();
    notifyListeners();
  }
}
