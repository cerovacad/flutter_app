import 'package:http/http.dart' as http;

Future getProducts() {
  return http.get(Uri.https('fakestoreapi.com', '/products'));
}

Future getProduct(String productId) {
  return http.get(Uri.https('fakestoreapi.com', '/products/$productId'));
}
