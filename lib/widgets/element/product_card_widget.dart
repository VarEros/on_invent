import 'package:flutter/material.dart';
import 'package:on_invent/models/product.dart';
import 'package:on_invent/screens/product_screen.dart';

class ProductCardWidget extends StatelessWidget {
  final Product product;
  final bool isInventary;
  const ProductCardWidget({ super.key, required this.product, this.isInventary = false});

  @override
  Widget build(BuildContext context){
    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ProductScreen(product: product))),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).shadowColor.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(4, 4),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: GridTile(
            footer: GridTileBar(
              backgroundColor: Theme.of(context).dialogBackgroundColor,
              title: Text(product.name, style: TextStyle(fontWeight: FontWeight.bold, color: Theme.of(context).hintColor)),
              subtitle: Text('C\$${product.sellingPrice}.00', style: TextStyle(color: Theme.of(context).hintColor)),
            ),
            child: Image.asset(product.imageUrl, fit: BoxFit.cover), 
          ),
        ),
      ),
    );
  }
}