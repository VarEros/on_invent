import 'package:flutter/material.dart';
import 'package:on_invent/screens/category_list_screen.dart';
import 'package:on_invent/screens/category_screen.dart';
import 'package:on_invent/screens/product_list_screen.dart';
import 'package:on_invent/screens/product_screen.dart';
import 'package:on_invent/utils/utils.dart';
import 'package:on_invent/widgets/filter_dialog.dart';

class Screen extends StatefulWidget {
  const Screen({super.key});

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  int currentPageIndex = 1;
  Utils utils = Utils();
  
  static const pages =  [
    'Categorias',
    'Productos',
    'Inventario'
  ];
  
  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          title: Text(pages[currentPageIndex]),
          actions: <Widget>[ if (currentPageIndex == 1)
            IconButton(
              icon: const Icon(Icons.filter_list),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return FilterDialog(utils: utils);
                  },
                );
              },
            ),
          ],
        ),
        bottomNavigationBar: NavigationBar(
          onDestinationSelected: (int index) {
            setState(() {
              currentPageIndex = index;
            });
          },
          selectedIndex: currentPageIndex,
          destinations: const <Widget>[
            NavigationDestination(icon: Icon(Icons.category), label: 'Categorias'),
            NavigationDestination(icon: Icon(Icons.shopping_cart), label: 'Productos'),
            NavigationDestination(icon: Icon(Icons.inventory), label: 'Inventario'),
          ],
        ),
        body: <Widget>[
          const CategoryListScreen(),
          ProductListScreen(utils: utils),
        ][currentPageIndex],
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            if (currentPageIndex == 1) FloatingActionButton(
              heroTag: 'changeView',
              mini: true,
              onPressed: () {
                setState(() {
                  utils.changeView();
                });
              },
              child: Icon(utils.isGridView ? Icons.list : Icons.grid_view),
            ),
            const SizedBox(height: 10),
            if (currentPageIndex <= 1) FloatingActionButton(
              heroTag: 'add',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => currentPageIndex == 0 ? const CategoryScreen(category: null) : const ProductScreen(product: null)),
                );
              },
              child: const Icon(Icons.add),
            ),
          ],
        )
      );
  }
}