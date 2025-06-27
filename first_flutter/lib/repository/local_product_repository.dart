import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/product.dart';
import 'product_repository.dart';

class LocalProductRepository implements ProductRepository {
  final String assetPath;
  LocalProductRepository({this.assetPath = 'assets/products.json'});

  @override
  Future<List<Product>> getProducts() async {
    final String response = await rootBundle.loadString(assetPath);
    final List<dynamic> data = json.decode(response);
    return data.map((json) => Product.fromJson(json)).toList();
  }
}
