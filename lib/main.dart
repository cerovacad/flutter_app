import 'package:flutter/material.dart';
import 'package:flutter_application_moc/providers/liked_products_provider.dart';
import 'package:flutter_application_moc/screens/liked_products_screen.dart';
import 'package:flutter_application_moc/screens/product_details_screen.dart';
import 'package:flutter_application_moc/screens/products_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => LikedProductsProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final _router = GoRouter(
      urlPathStrategy: UrlPathStrategy.path,
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const ProductListScreen(),
        ),
        GoRoute(
          path: '/liked',
          builder: (context, state) => const LikedProductsScreen(),
        ),
        GoRoute(
            path: '/details/:productId',
            builder: (context, state) {
              return ProductDetailsScreen(
                productId: state.params['productId']!,
              );
            }),
      ],
    );
    return MaterialApp.router(
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          textTheme: const TextTheme(
              headline3: TextStyle(fontWeight: FontWeight.w700)),
          primarySwatch: Colors.teal),
    );
  }
}
