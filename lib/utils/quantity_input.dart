import 'package:flutter/material.dart';

class QuantityInput extends StatefulWidget {
  final ValueChanged<int> quantity;
  final String label;
  const QuantityInput({ super.key, required this.quantity, required this.label});

  @override
  State<QuantityInput> createState() => _QuantityInputState();
}

class _QuantityInputState extends State<QuantityInput> {
  int quantity = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(widget.label, style: const TextStyle(fontWeight: FontWeight.bold)),
        Row(
          
          children: [
            IconButton(onPressed: () => setState(()=> widget.quantity(--quantity)) , icon: const Icon(Icons.remove)),
            const SizedBox(width: 10),
            Text(quantity.toString(), style: const TextStyle(fontSize: 20)),
            const SizedBox(width: 10),
            IconButton(onPressed: () => setState(() => widget.quantity(++quantity)), icon: const Icon(Icons.add)),
          ],
        ),
      ],
    );
  }
}