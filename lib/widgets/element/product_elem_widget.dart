import 'package:flutter/material.dart';
import 'package:on_invent/models/product.dart';
import 'package:on_invent/screens/product_screen.dart';

class ProductElemWidget extends StatelessWidget {
  final Product product;
  final bool isInventary;
  const ProductElemWidget({ super.key, required this.product, this.isInventary = false});

  @override
  Widget build(BuildContext context){
    return ListTile(
      leading: ClipRRect(borderRadius: BorderRadius.circular(10), child: Image.asset(product.imageUrl)),
      title: Text(product.name),
      subtitle: Text(product.description),
      trailing: isInventary ? Text('Cant.: ${product.stock}') : Text('\$${product.sellingPrice}'),
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ProductScreen(product: product))),
    );
  }
}