import 'package:flutter/material.dart';
import 'package:quantity_input/quantity_input.dart';

class InventaryDialog extends StatelessWidget {
  const InventaryDialog({ super.key });

  @override
  Widget build(BuildContext context){
    int xsCant = 0;
    int sCant = 0;
    int mCant = 0;
    int lCant = 0;
    int xlCant = 0;

    return AlertDialog(
      title: const Text('Añadir Inventario'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          QuantityInput(
            label: 'XS',
            acceptsZero: true,
            value: 14,
            onChanged: (value) {
              xsCant = int.parse(value.replaceAll(',', ''));
            },
            minValue: 0,
            maxValue: 100,
          ),
        ],
      ),
    );
  }
}