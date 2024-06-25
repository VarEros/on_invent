
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:on_invent/data/category_data.dart';
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
  final _formKey = GlobalKey<FormState>();
  XFile? imageFile;
  final categoryList = CategoryData().categories;
  final categoriesOfProduct = [1,2,4];
  List<Category> selectedCategories = [];

  @override
  void initState() {
    super.initState();
    for (var category in categoryList) {
      if (categoriesOfProduct.contains(category.id)) {
        selectedCategories.add(category);
      }
    }
  }
  

  void _getImage() async {
    final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      imageFile = pickedFile;
    });
  }

  @override
  Widget build(BuildContext context) {
    String name = '';
    String description = '';
    int buyingPrice = 0;
    int sellingPrice = 0;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.product != null ? 'Editar Producto' : 'Agregar Producto'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    initialValue: widget.product != null ? widget.product!.name : '',
                    onChanged: (value) => name = value,
                    decoration: const InputDecoration(
                      labelText: 'Nombre',
                    ),
                    validator: (value) => value!.isEmpty ? 'Por favor, ingrese un nombre' : null,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    initialValue: widget.product != null ? widget.product!.description : '',
                    onChanged: (value) => description = value,
                    decoration: const InputDecoration(
                      labelText: 'Descripción',
                    ),
                    validator: (value) => value!.isEmpty ? 'Por favor, ingrese una descripción' : null,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    initialValue: widget.product != null ? widget.product!.buyingPrice.toString() : '',
                    onChanged: (value) => buyingPrice = int.tryParse(value) ?? 0,
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
                    initialValue: widget.product != null ? widget.product!.sellingPrice.toString() : '',
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
                      } else if (int.parse(value) <= buyingPrice) {
                        return 'El precio de venta debe ser mayor al precio de compra';
                      }
                      return null;
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),const SizedBox(height: 16),
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
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                  foregroundColor: Colors.white,
                  minimumSize: const Size.fromHeight(50),
                  shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
                ),
                onPressed: () {
                  if(!_formKey.currentState!.validate()){return;}
                  showDialog(
                    context: context,
                    builder: (context) => const InventaryDialog(),
                  ).then((value) {
                    if (widget.product != null) {
                      // Update category
                    } else {

                    }
                    Navigator.of(context).pop();
                  });
                },
                child: Text(widget.product != null ? 'Guardar Cambios' : 'Guardar Producto'),
              )
            ],
          ),
        ),
      ),
    );
  }
}