import 'package:flutter/material.dart';
import 'package:on_invent/data/product_data.dart';
import 'package:on_invent/widgets/product_card_widget.dart';

class ProductGridScreen extends StatefulWidget {
  const ProductGridScreen({ super.key });

  @override
  State<ProductGridScreen> createState() => _ProductGridScreenState();
}

class _ProductGridScreenState extends State<ProductGridScreen> {
  final productList = ProductData().products;

  @override
  Widget build(BuildContext context){
    final currentCount = (MediaQuery.of(context).size.width ~/ 300).toInt();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const SearchBar(),
          const SizedBox(height: 20),
          GridView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
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
            ),
        ],
      ),
    );
  }
}