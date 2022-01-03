import 'package:flutter/cupertino.dart';

class Product {
  final String uid;
  final String name;
  final String description;
  final double price;
  final String link;
  final String imagePath;
  late final Image image;
  final String category;

  Product({
    required this.uid,
    required this.name,
    required this.description,
    required this.price,
    required this.link,
    required this.imagePath,
    required this.category,
  }) {
    image = Image.asset(imagePath);
  }
}
