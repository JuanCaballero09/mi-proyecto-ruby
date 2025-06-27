import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/product.dart';
import 'product_repository.dart';

class HttpProductRepository implements ProductRepository {
  final String apiUrl;

  HttpProductRepository({required this.apiUrl});

  @override
  Future<List<Product>> getProducts() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = jsonDecode(response.body);
      return jsonList.map((json) => Product(
        id: json['id'],
        name: json['name'],
        price: (json['price'] is int)
            ? (json['price'] as int).toDouble()
            : (json['price'] as num).toDouble(),
        description: json['description'] ?? '',
        image: json['image'] ?? '',
      )).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}
