import 'package:flutter/material.dart';
import 'package:on_invent/models/product.dart';
import 'package:on_invent/screens/product_screen.dart';

class ProductElemWidget extends StatelessWidget {
  final Product product;
  const ProductElemWidget({ super.key, required this.product});

  @override
  Widget build(BuildContext context){
    return ListTile(
      leading: Image.asset(product.imageUrl),
      title: Text(product.name),
      subtitle: Text(product.description),
      trailing: Text('\$${product.sellingPrice}'),
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ProductScreen(product: product))),
    );
  }
}