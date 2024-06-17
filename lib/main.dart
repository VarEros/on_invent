import 'package:flutter/material.dart';
import 'package:on_invent/screens/category_screen.dart';
import 'package:on_invent/screens/product_screen.dart';
import '../screens/category_list_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

    @override
  State<StatefulWidget> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int currentPageIndex = 0;
  
  static const pages =  [
    'Categorias',
    'Productos',
  ];

  @override
  Widget build(BuildContext context) {

    return  MaterialApp(
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      home: Scaffold(
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
          const ProductScreen(),
        ][currentPageIndex],
        floatingActionButton: currentPageIndex == 0 ? FloatingActionButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const CategoryScreen(category: null)));
          },
          child: const Icon(Icons.add),
        ) : null,
      )
    );
  }
}
