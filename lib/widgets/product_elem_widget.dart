import 'package:flutter/material.dart';
import 'package:on_invent/models/product.dart';

class ProductElemWidget extends StatelessWidget {
  final Product product;
  const ProductElemWidget({ super.key, required this.product});

  @override
  Widget build(BuildContext context){
    return Card(
      child: ListTile(
        leading: Image.network(product.imageUrl),
        title: Text(product.name),
        subtitle: Text(product.description),
        trailing: Text('\$${product.sellingPrice}'),
      ),
    );
  }
}