import 'package:flutter/material.dart';
import 'package:on_invent/data/product_data.dart';
import 'package:on_invent/widgets/product_card_widget.dart';

class ProductGridScreen extends StatelessWidget {
  const ProductGridScreen({ super.key });
  

  @override
  Widget build(BuildContext context){
    final productList = ProductData().products;
    final currentCount = (MediaQuery.of(context).size.width ~/ 300).toInt();

    return GridView.builder(
      padding: const EdgeInsets.only(left:16.0, right:16.0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: currentCount,
        childAspectRatio: 3/2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: productList.length,
      itemBuilder: (context, index) {
        return ProductCardWidget(product: productList[index]);
      },
    );
  }
}