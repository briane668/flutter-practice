import 'package:dio/dio.dart';

import '../model/product.dart';

class GalleryService {
  final Dio dio = Dio();

  Future<List<Product>> fetchProducts(String category) async {
    final response = await dio
        .get('https://api.appworks-school.tw/api/1.0/products/$category');

    final List<dynamic> productsJson = response.data['data'];

    if (response.statusCode == 200) {
      return productsJson.map((json) => Product.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}
