import 'package:cardapio_digital_mobile/helpers/isConnected.dart';
import 'package:cardapio_digital_mobile/src/entities/product.dart';
import 'package:cardapio_digital_mobile/src/services/products_service.dart';
import 'package:flutter/material.dart';

enum HomePageStatus {
  none,
  sucess,
  loading,
  error,
  notConnected,
}

class HomePageController extends ChangeNotifier {
  final ProductsService _productsService = ProductsService();
  HomePageStatus status = HomePageStatus.none;
  String? error;
  List<Product> _products = [];

  Future<void> initialize() async {
    if (status == HomePageStatus.loading) {
      return;
    }
    status = HomePageStatus.loading;
    try {
      if (!(await isConnected())) {
        status = HomePageStatus.notConnected;
        notifyListeners();
        return;
      }
      _products = await _productsService.getProducts();
      status = HomePageStatus.sucess;
      notifyListeners();
    } catch (e, stc) {
      debugPrint(e.toString());
      debugPrint(stc.toString());
      error = e.toString().replaceAll('Exception: ', '');
      status = HomePageStatus.error;
      notifyListeners();
      return;
    }
  }

  List<Product> getProducts() => _products;

  Future<void> onRefresh() async {
    if (status == HomePageStatus.loading) {
      return;
    }
    status = HomePageStatus.loading;
    try {
      if (!(await isConnected())) {
        status = HomePageStatus.notConnected;
        notifyListeners();
        return;
      }
      _products = await _productsService.getProducts();
      status = HomePageStatus.sucess;
      notifyListeners();
    } catch (e, stc) {
      debugPrint(e.toString());
      debugPrint(stc.toString());
      error = e.toString().replaceAll('Exception: ', '');
      status = HomePageStatus.error;
      notifyListeners();
      return;
    }
  }
}
