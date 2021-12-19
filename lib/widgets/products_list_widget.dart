import 'package:flutter/material.dart';
import 'package:flutter_application_moc/data_models/product_data_model/product_data_model.dart';
import 'package:flutter_application_moc/widgets/product_widget.dart';

class ProductListWidget extends StatelessWidget {
  final List<ProductDataModel> products;
  const ProductListWidget({Key? key, required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
        child: MediaQuery.of(context).size.width > 700
            ? SingleChildScrollView(
                child: Center(
                  child: Wrap(
                    children: [
                      ...products.map((product) => SizedBox(
                            width: 350,
                            height: 700,
                            child: ProductWidget(
                              product: product,
                            ),
                          ))
                    ],
                  ),
                ),
              )
            : ListView(children: [
                ...products.map((prod) =>
                    SizedBox(height: 700, child: ProductWidget(product: prod)))
              ]));
  }
}
