import 'package:flutter/material.dart';
import 'package:on_invent/models/product.dart';
import 'package:on_invent/screens/product_screen.dart';

class ProductCardWidget extends StatelessWidget {
  final Product product;
  const ProductCardWidget({ super.key, required this.product});

  @override
  Widget build(BuildContext context){
    return Container(
     decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).shadowColor.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(4, 4),
          ),
        ],
      ),
      child: InkResponse(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: GridTile(
            footer: GridTileBar(
              backgroundColor: Theme.of(context).dialogBackgroundColor,
              title: Text(product.name, style: TextStyle(fontWeight: FontWeight.bold, color: Theme.of(context).hintColor)),
              subtitle: Text('C\$${product.sellingPrice}.00', style: TextStyle(color: Theme.of(context).hintColor)),
            ),
            child: Image.asset(product.imageUrl, fit: BoxFit.cover), 
          ),
        ),
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ProductScreen(product: product))),
      ),
    );
  }
}