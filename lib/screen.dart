import 'package:flutter/material.dart';
import 'package:on_invent/screens/category_list_screen.dart';
import 'package:on_invent/screens/category_screen.dart';
import 'package:on_invent/screens/product_grid_screen.dart';
import 'package:on_invent/screens/product_list_screen.dart';
import 'package:on_invent/screens/product_screen.dart';

class Screen extends StatefulWidget {
  const Screen({super.key});

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  int currentPageIndex = 1;
  bool isGridView = true;
  
  static const pages =  [
    'Categorias',
    'Productos',
  ];
  
  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          title: Text(pages[currentPageIndex]),
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
          ],
        ),
        body: <Widget>[
          const CategoryListScreen(),
          isGridView ? const ProductGridScreen() : const ProductListScreen(),
        ][currentPageIndex],
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            if (currentPageIndex == 1) FloatingActionButton(
              mini: true,
              onPressed: () {
                setState(() {
                  isGridView = !isGridView;
                });
              },
              child: Icon(isGridView ? Icons.list : Icons.grid_on),
            ),
            const SizedBox(height: 10),
            if (currentPageIndex <= 1) FloatingActionButton(
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
        // floatingActionButton: currentPageIndex <= 1 ? FloatingActionButton(
        //   onPressed: () {
        //     Navigator.push(
        //       context,
        //       MaterialPageRoute(builder: (context) => const CategoryScreen(category: null)),
        //     );
        //   },

        //   child: const Icon(Icons.add),
        // ) : null,
      );
  }
}