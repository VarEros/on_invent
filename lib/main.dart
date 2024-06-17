import 'package:flutter/material.dart';
import 'package:on_invent/screens/product_screen.dart';
import '../screens/category_list_screen.dart';

void main() {
  runApp(const MainApp(title: 'Inicio'));
}

class MainApp extends StatelessWidget {
  final String title;
  const MainApp({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: 'Categorías',
            ),
            BottomNavigationBarItem(

              icon: Icon(Icons.shopping_cart),
              label: 'Productos',
            ),
          ],
          selectedItemColor: Colors.amber[800],
          onTap: (int index) {
            if (index == 0) {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const CategoryListScreen()));
            } else {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProductScreen()),
              );
            }
          },
        ),
      )
    );
  }
}
