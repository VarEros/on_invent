import 'package:flutter/material.dart';
import 'package:on_invent/screens/category_list_screen.dart';
import 'package:on_invent/screens/category_screen.dart';
import 'package:on_invent/screens/product_list_screen.dart';

class Screen extends StatefulWidget {
  const Screen({super.key});

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
    int currentPageIndex = 0;
  
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
          const ProductListScreen(),
        ][currentPageIndex],
        floatingActionButton: currentPageIndex == 0 ? FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CategoryScreen(category: null)),
            );
          },
          child: const Icon(Icons.add),
        ) : null,
      );
  }
}