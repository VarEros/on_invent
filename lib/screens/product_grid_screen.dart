import 'package:flutter/material.dart';
import 'package:on_invent/data/product_data.dart';
import 'package:on_invent/models/product.dart';
import 'package:on_invent/utils/utils.dart';
import 'package:on_invent/widgets/product_card_widget.dart';
import 'package:on_invent/widgets/product_elem_widget.dart';

class ProductGridScreen extends StatefulWidget {
  final Utils utils;
  const ProductGridScreen({ super.key, required this.utils });

  @override
  State<ProductGridScreen> createState() => _ProductGridScreenState();
}

class _ProductGridScreenState extends State<ProductGridScreen> {
  final productList = ProductData().products;
  late TextEditingController controler;
  late List<Product> filteredList;

  @override
  void initState() {
    controler = TextEditingController();
    filteredList = productList;
    super.initState();
  }

  @override
  Widget build(BuildContext context){
    final currentCount = (MediaQuery.of(context).size.width ~/ 250).toInt();

    return Container(
      margin: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          SearchBar(
            leading: const Icon(Icons.search),
            controller: controler, 
            hintText: 'Buscar producto...',
            onChanged: (value) {
              setState(() {
                final searchText = controler.text;
                searchText.isEmpty ? filteredList = productList : filteredList = productList.where((element) => element.name.toLowerCase().contains(searchText.toLowerCase())).toList();
              });
            },
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListenableBuilder(
              listenable: widget.utils,
              builder: (BuildContext context, Widget? child) { 
                if (widget.utils.isGridView) {
                  return GridView.builder(
                    scrollDirection: Axis.vertical,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: currentCount,
                      childAspectRatio: 6/5,
                      crossAxisSpacing: 30,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: filteredList.length,
                    itemBuilder: (context, index) {
                      return ProductCardWidget(product: filteredList[index]);
                    },
                  );
                } else {
                  return ListView.builder(
                    itemCount: filteredList.length,
                    itemBuilder: (context, index) {
                      return ProductElemWidget(product: filteredList[index]);
                    },
                  );
                }
              }
            ),
          ),
        ],
      ),
    );
  }
}
