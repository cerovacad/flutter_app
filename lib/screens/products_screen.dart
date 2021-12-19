import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_moc/data_models/product_data_model/product_data_model.dart';
import 'package:flutter_application_moc/widgets/products_list_widget.dart';
import 'package:go_router/go_router.dart';
import 'package:my_package/api_calls.dart';
import 'package:rive/rive.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({Key? key}) : super(key: key);

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  List<ProductDataModel> products = [];
  bool isLoading = false;

  @override
  void initState() {
    _getProducts();

    super.initState();
  }

  void _getProducts() async {
    setState(() {
      isLoading = true;
    });
    var response = await getProducts();
    List<ProductDataModel> parsed = [];
    jsonDecode(response.body).forEach((prod) {
      parsed.add(ProductDataModel.fromJson(prod));
    });

    setState(() {
      products = parsed;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.teal,
            child: const Center(
              child: RiveAnimation.asset('assets/load.riv'),
            ),
          )
        : Scaffold(
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
