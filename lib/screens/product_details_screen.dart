import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_moc/data_models/product_data_model/product_data_model.dart';
import 'package:flutter_application_moc/widgets/liked_widget.dart';
import 'package:my_package/api_calls.dart';

class ProductDetailsScreenArgs {
  final String productId;

  ProductDetailsScreenArgs({required this.productId});
}

class ProductDetailsScreen extends StatefulWidget {
  final String productId;
  const ProductDetailsScreen({Key? key, required this.productId})
      : super(key: key);

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  late ProductDataModel product;
  bool isLoading = false;

  @override
  void initState() {
    _getProduct();
    super.initState();
  }

  void _getProduct() async {
    setState(() {
      isLoading = true;
    });
    var response = await getProduct(widget.productId);

    ProductDataModel parsed =
        (ProductDataModel.fromJson(jsonDecode(response.body)));

    setState(() {
      isLoading = false;
      product = parsed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      product.title!,
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                        height: 300,
                        width: 300,
                        child: Image.network(product.image!)),
                    const SizedBox(
                      height: 10,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text('Category:',
                            style: Theme.of(context).textTheme.subtitle1),
                        const SizedBox(
                          width: 30,
                        ),
                        Text(product.category!.toUpperCase(),
                            style: Theme.of(context).textTheme.bodyText1),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('Description:',
                            style: Theme.of(context).textTheme.subtitle1),
                      ],
                    ),
                    const Divider(),
                    Text(product.description!,
                        style: Theme.of(context).textTheme.bodyText1),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('\$' + product.price!.toString(),
                            style: Theme.of(context).textTheme.headline4),
                        LikedWidget(product: product)
                      ],
                    ),
                    Row(
                      children: [
                        Flexible(
                          flex: 1,
                          child: Row(
                            children: [
                              ...Iterable.generate(
                                      product.rating!.rate!.toInt())
                                  .map((e) => const Icon(Icons.star,
                                      color: Colors.deepOrange)),
                            ],
                          ),
                        ),
                        Flexible(
                          flex: 2,
                          child: Text(
                            product.rating!.count!.toString() + ' reviews',
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
