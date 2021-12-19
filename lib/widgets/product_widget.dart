import 'package:flutter/material.dart';
import 'package:flutter_application_moc/data_models/product_data_model/product_data_model.dart';
import 'package:flutter_application_moc/widgets/liked_widget.dart';
import 'package:go_router/go_router.dart';

class ProductWidget extends StatelessWidget {
  final ProductDataModel product;
  const ProductWidget({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push('/details/${product.id}'),
      child: SizedBox(
        width: double.infinity,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              children: [
                SizedBox(
                    height: 300,
                    width: 300,
                    child: Image.network(product.image!)),
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
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('\$' + product.price!.toString(),
                        style: Theme.of(context).textTheme.headline4),
                    LikedWidget(
                      product: product,
                    )
                  ],
                ),
                Row(
                  children: [
                    Flexible(
                      flex: 1,
                      child: Row(
                        children: [
                          ...Iterable.generate(product.rating!.rate!.toInt())
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
      ),
    );
  }
}
