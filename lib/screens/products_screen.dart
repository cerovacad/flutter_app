import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_moc/api_calls.dart';
import 'package:flutter_application_moc/data_models/product_data_model/product_data_model.dart';
import 'package:flutter_application_moc/widgets/products_list_widget.dart';
import 'package:go_router/go_router.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({Key? key}) : super(key: key);

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  List<ProductDataModel> products = [];

  @override
  void initState() {
    _getProducts();

    super.initState();
  }

  void _getProducts() async {
    var response = await getProducts();
    List<ProductDataModel> parsed = [];
    jsonDecode(response.body).forEach((prod) {
      parsed.add(ProductDataModel.fromJson(prod));
    });

    setState(() {
      products = parsed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () => context.push('/liked'),
                icon: const Icon(Icons.favorite))
          ],
          title: const Text('Products'),
        ),
        body: ProductListWidget(
          products: products,
        ));
  }
}
