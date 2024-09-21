import 'package:cardapio_digital_mobile/src/controllers/home_page_controller.dart';
import 'package:cardapio_digital_mobile/src/widgets/card_product.dart';
import 'package:cardapio_digital_mobile/src/widgets/my_app_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomePageController _homePageController = HomePageController();

  @override
  void initState() {
    super.initState();
    _homePageController.addListener(
      () {
        switch (_homePageController.status) {
          case HomePageStatus.error:
            if (_homePageController.error != null) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(_homePageController.error!),
                backgroundColor: Colors.red,
              ));
            }
            break;
          default:
        }
        setState(() {});
      },
    );
    _homePageController.initialize();
  }

  @override
  void dispose() {
    _homePageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: const MyAppBar(title: 'Cardapio Digital'),
          body: RefreshIndicator(
            onRefresh: _homePageController.onRefresh,
            child: GridView(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              padding: const EdgeInsets.all(10),
              children: _homePageController
                  .getProducts()
                  .map(
                    (e) => CardProduct(product: e),
                  )
                  .toList(),
            ),
          )),
    );
  }
}
