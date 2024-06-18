
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({ super.key });

  @override
  _ProductScreenState createState() => _ProductScreenState();
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
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // imageFile == null ? const Text('No image selected.') : Image.file(File(imageFile!.path), height: 100, width: 100),
            imageFile == null ? const Text('No image selected.') : Text(imageFile!.name),
            ElevatedButton(
              onPressed: _getImage,
              child: const Text('Select Image'),
            ),
          ],
        ),
      ),
    );
  }
}