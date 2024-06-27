
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:on_invent/data/category_data.dart';
import 'package:on_invent/data/prod_cat_data.dart';
import 'package:on_invent/models/category.dart';
import 'package:on_invent/models/product.dart';
import 'package:on_invent/widgets/inventary_dialog.dart';

class ProductScreen extends StatefulWidget {
  final Product? product;
  const ProductScreen({ super.key,  required this.product});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final imagePicker = ImagePicker();
  XFile? imageFile;

  final _formKey = GlobalKey<FormState>();
  bool enableButton = false;

  final categoryList = CategoryData().categories;
  final prodCatList = ProdCatData().prodCatList;
  List<Category> selectedCategories = [];

  String name = '';
  String description = '';
  int buyingPrice = 0;
  int sellingPrice = 0;

  @override
  void initState() {
    super.initState();
      if (widget.product != null) {
        name = widget.product!.name;
        description = widget.product!.description;
        buyingPrice = widget.product!.buyingPrice;
        sellingPrice = widget.product!.sellingPrice;

        final categoriesOfProduct = ProdCatData().prodCatList.where((element) => element.idProduct == widget.product!.id).map((e) => e.idCategory).toList();
        selectedCategories = categoryList.where((element) => categoriesOfProduct.contains(element.id)).toList();
        enableButton = true;
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.product != null ? 'Editar Producto' : 'Agregar Producto'),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('Eliminar Producto'),
                    content: const Text('¿Estás seguro de que deseas eliminar este producto?'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(false),
                        child: const Text('Cancelar'),
                      ),
                      TextButton(
                        onPressed: () {
                          // Delete product
                          Navigator.of(context).pop(true);
                        },
                        child: const Text('Eliminar'),
                      ),
                    ],
                  );
                },
              ).then((value) {
                if (value) {
                  Navigator.of(context).pop();
                }
              });
            },
          )],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          onChanged: () => setState(() => enableButton = _formKey.currentState!.validate()),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    initialValue: name,
                    onChanged: (value) => name = value,
                    decoration: const InputDecoration(
                      labelText: 'Nombre',
                    ),
                    validator: (value) => value!.isEmpty ? 'Por favor, ingrese un nombre' : null,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    initialValue: description,
                    onChanged: (value) => description = value,
                    decoration: const InputDecoration(
                      labelText: 'Descripción',
                    ),
                    validator: (value) => value!.isEmpty ? 'Por favor, ingrese una descripción' : null,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    initialValue: buyingPrice == 0 ? '' : buyingPrice.toString(),
                    onChanged: (value) {
                      buyingPrice = int.tryParse(value) ?? 0;
                    },
                    decoration: const InputDecoration(
                      labelText: 'Precio de compra',
                      suffix: Text('C\$')
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    validator: (value) => value!.isEmpty ? 'Por favor, ingrese un precio de compra' : null,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    initialValue: sellingPrice == 0 ? '' : sellingPrice.toString(),
                    onChanged: (value) => sellingPrice = int.tryParse(value) ?? 0,
                    decoration: const InputDecoration(
                      labelText: 'Precio de venta',
                      suffix: Text('C\$')
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Por favor, ingrese un precio de venta';
                      } else if (int.parse(value) < buyingPrice) {
                        enableButton = false;
                        return 'El precio de venta debe ser mayor al precio de compra';
                      }
                      return null;
                    },
                    autovalidateMode: AutovalidateMode.always,
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: _getImage,
                        child: const Text('Seleccina una imagen'),
                      ),
                      imageFile == null ? const Text('Ninguna imagen seleccionada.') : Text(imageFile!.name),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Wrap( 
                    spacing: 8.0, 
                    children: 
                      List<Widget>.generate(
                        categoryList.length,
                        (index) => ChoiceChip(
                          showCheckmark: false,
                          label: Text(categoryList[index].name),
                          avatar: Icon(IconData(categoryList[index].icon, fontFamily: 'MaterialIcons')),
                          selected: selectedCategories.contains(categoryList[index]),
                          onSelected: (selected) {
                            setState(() {
                              if (selected) {
                                selectedCategories.add(categoryList[index]);
                              } else {
                                selectedCategories.remove(categoryList[index]);
                              }
                            });
                          },
                        ),
                      ),
                  ),
                ],
              ),
              FilledButton(
                style: FilledButton.styleFrom(
                  // backgroundColor: Theme.of(context).primaryColor,
                  // foregroundColor: Theme.of(context).colorScheme.onPrimary,
                  // disabledBackgroundColor: Theme.of(context).disabledColor,
                  // disabledForegroundColor: Theme.of(context).colorScheme.onPrimary,
                  minimumSize: const Size.fromHeight(50),
                  shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
                ),
                onPressed: enableButton ? saveProduct : null,
                child: Text(widget.product != null ? 'Guardar Cambios' : 'Guardar Producto'),
              )
            ],
          ),
        ),
      ),
    );
  }

  void saveProduct () {
    showDialog(
      context: context,
      builder: (context) => const InventaryDialog(),
    ).then((value) {
      if (value == null) return;
      if (widget.product != null) {
        // Update category
      } else {

      }
      Navigator.of(context).pop();
    });
  }

  void _getImage() async {
    final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      imageFile = pickedFile;
    });
  }
}