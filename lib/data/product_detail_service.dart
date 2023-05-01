import 'package:dio/dio.dart';

import '../model/product.dart';

class ProductDetailService {
  final Dio dio = Dio();

  Future<Product> fetchProductDetail(int productId) async {
    final response = await dio.get(
        'https://api.appworks-school.tw/api/1.0/products/details/',
        queryParameters: {'id': productId});

    final dynamic productJson = response.data['data'];

    if (response.statusCode == 200) {
      return Product.fromJson(productJson);
    } else {
      throw Exception('Failed to load products');
    }
  }
}
