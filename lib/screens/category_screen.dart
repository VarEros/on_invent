import 'package:flutter/material.dart';
import 'package:flutter_iconpicker/flutter_iconpicker.dart';
import 'package:on_invent/data/icon_data.dart';

import '../models/category.dart';

class CategoryScreen extends StatefulWidget {
  final Category? category;
  const CategoryScreen({super.key, required this.category});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  Icon? _icon;
  final _formKey = GlobalKey<FormState>();

  _pickIcon() async {
    IconData? icon = await showIconPicker(
      context, 
      iconPackModes: [IconPack.custom], 
      customIconPack: IconDataList().clothIcons, 
      iconColor: Theme.of(context).secondaryHeaderColor
    );

    setState(() {
      if (icon != null) {
        _icon = Icon(icon);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    String name = '';
    String description = '';

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category != null ? 'Editar Categoria' : 'Agregar Categoría'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                initialValue: widget.category != null ? widget.category!.name : '',
                onChanged: (value) => name = value,
                decoration: const InputDecoration(
                  labelText: 'Nombre',
                ),
                validator: (value) => value!.isEmpty ? 'Por favor, ingrese un nombre' : null,
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
              const SizedBox(height: 16),
              TextFormField(
                initialValue: widget.category != null ? widget.category!.description : '',
                onChanged: (value) => description = value,
                decoration: const InputDecoration(
                  labelText: 'Descripción',
                ),
                validator: (value) => value!.isEmpty ? 'Por favor, ingrese una descripción' : null,
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Text('Icono: '),
                      const SizedBox(width: 16),
                      _icon ?? const Icon(Icons.error),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: _pickIcon,
                    child: const Text('Seleccionar'),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              InkWell(
                
                onTap: () {
                  if (!_formKey.currentState!.validate()) {return;}
                    // Save category
                  if (widget.category != null) {
                    // Update category
                  } else {
                    
                  }
                  Navigator.of(context).pop();
                },
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(12),
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    color: Theme.of(context).colorScheme.primaryContainer,
                  ),
                  child: Text(widget.category != null ? 'Guardar cambios' : 'Guardar categoría'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}