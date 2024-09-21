import 'dart:convert';

import 'package:cardapio_digital_mobile/helpers/isConnected.dart';
import 'package:cardapio_digital_mobile/src/entities/product.dart';
import 'package:cardapio_digital_mobile/src/services/my_http_service.dart';

class ProductsService {
  final MyHttpService _httpService = MyHttpService.instance;

  Future<List<Product>> getProducts() async {
    if (!(await isConnected())) {
      throw Exception(
          'Para buscar produtos é necessário estar conectado a internet');
    }

    var response = await _httpService.get(uri: '/product');
    Map<String, dynamic> body = json.decode(response.body);
    if (response.statusCode == 200) {
      List<Map<String, dynamic>> listMapProducts =
          List<Map<String, dynamic>>.from(body['data']['products']);
      return listMapProducts
          .map(
            (e) => Product.fromMap(e),
          )
          .toList();
    } else {
      throw Exception(body['message']);
    }
  }

  Future<Product?> getProductById(int productId) async {
    if (!(await isConnected())) {
      throw Exception(
          'Para buscar produtos é necessário estar conectado a internet');
    }

    var response = await _httpService.get(uri: '/product/$productId');
    Map<String, dynamic> body = json.decode(response.body);
    if (response.statusCode == 200) {
      return body['data'] != null ? Product.fromMap(body['data']) : null;
    } else {
      throw Exception(body['message']);
    }
  }
}
