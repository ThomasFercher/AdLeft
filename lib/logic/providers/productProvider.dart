import 'package:adleft/logic/objects/product.dart';
import 'package:flutter/widgets.dart';

class ProductProvider extends ChangeNotifier {
  String? user;
  final List<Product> products;
  final List<Product> wishlist;

  ProductProvider({
    required this.products,
    required this.wishlist,
  });

  Product? getFromUid(String uid) {
    for (Product product in products) {
      if (product.uid == uid) return product;
    }
  }

  bool isOnWishlist(Product p) {
    return wishlist.contains(p);
  }

  void addToWishlist(Product p) {
    if (isOnWishlist(p))
      wishlist.remove(p);
    else
      wishlist.add(p);
    notifyListeners();
  }

  void login(String user) {
    this.user = user;
    notifyListeners();
  }
}
