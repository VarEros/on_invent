import 'package:flutter/material.dart';
import 'package:on_invent/data/category_data.dart';
import 'package:on_invent/data/product_data.dart';
import 'package:on_invent/models/category.dart';
import 'package:on_invent/models/product.dart';
import 'package:on_invent/utils/utils.dart';
import 'package:on_invent/widgets/product_card_widget.dart';
import 'package:on_invent/widgets/product_elem_widget.dart';

class ProductListScreen extends StatefulWidget {
  final Utils utils;
  const ProductListScreen({ super.key, required this.utils });

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  final productList = ProductData().products;
  late List<Product> filteredList;
  final List<Category> categoryList = CategoryData().categories;
  List<Category> selectedCategories = [];
  late TextEditingController controler;

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
          Row(
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
              const SizedBox(width: 10),
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(68),
                    shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(70)),
                  ),
                  onPressed: () {
                    setState(() {
                      filteredList = productList;
                      controler.clear();
                      selectedCategories.clear();
                    });
                  }, 
                  child: const Row(
                    children: [
                      Icon(Icons.filter),
                      Text('Agregar Filtro'),
                    ],
                  ),
                ),
              )
            ],
          ),
          // const SizedBox(height: 10),
          // Wrap( 
          //   spacing: 8.0, 
          //   children: 
          //     List<Widget>.generate(
          //       categoryList.length,
          //       (index) => ChoiceChip(
          //         showCheckmark: false,
          //         label: Text(categoryList[index].name),
          //         avatar: Icon(IconData(categoryList[index].icon, fontFamily: 'MaterialIcons')),
          //         selected: selectedCategories.contains(categoryList[index]),
          //         onSelected: (selected) {
          //           setState(() {
          //             if (selected) {
          //               selectedCategories.add(categoryList[index]);
          //             } else {
          //               selectedCategories.remove(categoryList[index]);
          //             }
          //           });
          //         },
          //       ),
          //     ),
          // ),
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
