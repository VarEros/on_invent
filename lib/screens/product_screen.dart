
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:on_invent/models/product.dart';

class ProductScreen extends StatefulWidget {
  final Product? product;
  const ProductScreen({ super.key,  required this.product});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final imagePicker = ImagePicker();
  XFile? imageFile;

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
          child: Column(
            children: [
              TextFormField(
                initialValue: widget.product != null ? widget.product!.name : '',
                onChanged: (value) => name = value,
                decoration: const InputDecoration(
                  labelText: 'Nombre',
                ),
                validator: (value) => value!.isEmpty ? 'Por favor, ingrese un nombre' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                initialValue: widget.product != null ? widget.product!.description : '',
                onChanged: (value) => description = value,
                decoration: const InputDecoration(
                  labelText: 'Descripción',
                ),
                validator: (value) => value!.isEmpty ? 'Por favor, ingrese una descripción' : null,
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
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  imageFile == null ? const Text('No image selected.') : Text(imageFile!.name),
                  ElevatedButton(
                    onPressed: _getImage,
                    child: const Text('Select Image'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}