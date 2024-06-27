import 'package:flutter/material.dart';
import 'package:on_invent/data/product_data.dart';
import 'package:on_invent/models/product.dart';
import 'package:on_invent/widgets/product_card_widget.dart';

class ProductGridScreen extends StatefulWidget {
  const ProductGridScreen({ super.key });

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
    final currentCount = (MediaQuery.of(context).size.width ~/ 300).toInt();

    return Container(
      margin: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SearchBar(
              leading: const Icon(Icons.search),
              controller: controler, 
              hintText: 'Buscar producto...',
              // elevation: WidgetStatePropertyAll(0.0),
              onChanged: (value) {
                setState(() {
                  final searchText = controler.text;
                  searchText.isEmpty ? filteredList = productList : filteredList = productList.where((element) => element.name.toLowerCase().contains(searchText.toLowerCase())).toList();
                });
              },
            ),
            const SizedBox(height: 20),
            GridView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: currentCount,
                  childAspectRatio: 3/2,
                  crossAxisSpacing: 30,
                  mainAxisSpacing: 10,
                ),
                itemCount: filteredList.length,
                itemBuilder: (context, index) {
                  return ProductCardWidget(product: filteredList[index]);
                },
              ),
          ],
        ),
      ),
    );
  }
}