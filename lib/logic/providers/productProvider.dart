import 'package:adleft/logic/product.dart';
import 'package:flutter/widgets.dart';

class ProductProvider extends ChangeNotifier {
  final List<Product> products;

  ProductProvider({
    required this.products,
  });

  Product? getFromUid(String uid) {
    for (Product product in products) {
      if (product.uid == uid) return product;
    }
  }
}
