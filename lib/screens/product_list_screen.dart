import 'package:flutter/material.dart';
import 'package:on_invent/data/category_data.dart';
import 'package:on_invent/data/prod_cat_data.dart';
import 'package:on_invent/data/product_data.dart';
import 'package:on_invent/models/category.dart';
import 'package:on_invent/models/prod_cat.dart';
import 'package:on_invent/models/product.dart';
import 'package:on_invent/services/product_service.dart';
import 'package:on_invent/utils/utils.dart';
import 'package:on_invent/widgets/element/product_card_widget.dart';
import 'package:on_invent/widgets/element/product_elem_widget.dart';

class ProductListScreen extends StatefulWidget {
  final Utils utils;
  final ProductService productService;
  const ProductListScreen({ super.key, required this.utils, required this.productService});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  final productList = ProductData().products;
  late List<Product> filteredList;
  final List<Category> categoryList = CategoryData().categories;
  final List<ProdCat> prodCatList = ProdCatData().prodCatList;
  late TextEditingController controler;

  @override
  void initState() {
    controler = TextEditingController();
    filteredList = productList;
    super.initState();
  }

  filterBySearch (String searchText) {
    setState(() {
      searchText.isEmpty ? filteredList = productList : filteredList = productList.where((element) => element.name.toLowerCase().contains(searchText.toLowerCase())).toList();
    });
  }

  @override
  Widget build(BuildContext context){
    final currentCount = (MediaQuery.of(context).size.width ~/ 250).toInt();

    return Container(
      margin: const EdgeInsets.all(8.0),
      child: ListenableBuilder(
        listenable: widget.productService,
        builder: (BuildContext context, Widget? child) {  
          return widget.productService.products.isNotEmpty ? Column(
            children: [
              SearchBar(
                leading: const Icon(Icons.search),
                controller: controler, 
                hintText: 'Buscar producto...',
                onChanged: (value) {
                  if (value == '') return;
                  filterBySearch(value);
                },
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListenableBuilder(
                  listenable: widget.utils,
                  builder: (BuildContext context, Widget? child) { 
                    if (!widget.utils.categoriesSelected.isEmpty) {
                      List<Product> prodListFiltered = productList;
                      for (var categorySelected in widget.utils.categoriesSelected) {
                        final prodCatListFiltered = prodCatList.where((prodCat) => prodCat.idCategory == categorySelected).toList();
                        prodListFiltered = prodListFiltered.where((prod) => prodCatListFiltered.map((e) => e.idProduct).contains(prod.id)).toList();
                      }
                      filteredList = prodListFiltered;
                    } else {
                      filteredList = productList;
                    }
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
          ) : const Center(child: CircularProgressIndicator());
        }
      ),
    );
  }
}
