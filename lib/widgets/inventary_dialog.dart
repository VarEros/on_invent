import 'package:flutter/material.dart';
import 'package:on_invent/utils/quantity_input.dart';

class InventaryDialog extends StatelessWidget {
  const InventaryDialog({ super.key });

  @override
  Widget build(BuildContext context) {
    List<int> inventary = [0, 0, 0, 0, 0, 0];

    return AlertDialog(
      title: const Text('Añadir Inventario'),
      
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              QuantityInput(quantity: (value) => inventary[0] = value, label: 'XS'),
              const SizedBox(width: 50),
              QuantityInput(quantity: (value) => inventary[1] = value, label: 'S'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              QuantityInput(quantity: (value) => inventary[2] = value, label: 'M'),
              const SizedBox(width: 50),
              QuantityInput(quantity: (value) => inventary[3] = value, label: 'L'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              QuantityInput(quantity: (value) => inventary[4] = value, label: 'XL'),
              const SizedBox(width: 50),
              QuantityInput(quantity: (value) => inventary[5] = value, label: 'XXL'),
            ],
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancelar'),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(inventary),
          child: const Text('Añadir'),
        ),
      ],
    );
  }
  

}