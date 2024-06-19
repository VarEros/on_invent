import 'package:flutter/material.dart';
import 'package:on_invent/data/product_data.dart';
import 'package:on_invent/widgets/product_elem_widget.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({ super.key });

  @override
  Widget build(BuildContext context){
    final productList = ProductData().products;
    
    return ListView.builder(
      itemCount: productList.length,
      itemBuilder: (context, index) {
        return ProductElemWidget(product: productList[index]);
      },
    );
  }
}