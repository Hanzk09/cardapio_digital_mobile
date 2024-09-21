import 'package:cardapio_digital_mobile/helpers/capitalizeFirstLetter.dart';
import 'package:cardapio_digital_mobile/src/entities/product.dart';
import 'package:flutter/material.dart';

class CardProduct extends StatelessWidget {
  final Product product;
  const CardProduct({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey[400], borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Expanded(
            child: ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(10)),
                child: Image.network(product.image, fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.black26,
                  );
                }, loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress?.cumulativeBytesLoaded ==
                      loadingProgress?.expectedTotalBytes) {
                    return child;
                  }
                  return Container(
                    color: Colors.black26,
                    child: const Center(
                      child: CircularProgressIndicator(
                        color: Colors.black12,
                      ),
                    ),
                  );
                })),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              children: [
                Text(
                  capitalizeFirstLetter(product.name),
                  style: const TextStyle(fontSize: 23),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'R\$${product.price.toStringAsFixed(2)}',
                  textAlign: TextAlign.right,
                  style: const TextStyle(fontSize: 15),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
