import 'package:flutter/material.dart';
import 'package:on_invent/models/product.dart';
import 'package:on_invent/screens/product_screen.dart';

class ProductCardWidget extends StatelessWidget {
  final Product product;
  const ProductCardWidget({ super.key, required this.product});

  @override
  Widget build(BuildContext context){
    return InkResponse(
      child: GridTile(
        footer: GridTileBar(
          backgroundColor: Colors.black45,
          title: Text(product.name),
          subtitle: Text('\$${product.sellingPrice}'),
        ),
        child: Image.asset(product.imageUrl, fit: BoxFit.cover), 
      ),
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ProductScreen(product: product))),
    );
  }
}