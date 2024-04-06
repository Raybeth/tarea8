import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddEventScreen extends StatefulWidget {
  const AddEventScreen({super.key});

  @override
  AddEventScreenState createState() => AddEventScreenState();
}

class AddEventScreenState extends State<AddEventScreen> {
  final _formKey = GlobalKey<FormState>();
  String _titulo = '';
  String _descripcion = '';
  File? _image;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedImage = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  void _saveForm() {
    final isValid = _formKey.currentState?.validate();
    if (!isValid!) {
      return;
    }
    _formKey.currentState?.save();

    // Mostrar un AlertDialog como ejemplo de "uso" de las variables
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Guardar Evento'),
        content: Text('Titulo: $_titulo\nDescripcion: $_descripcion'),
        actions: <Widget>[
          TextButton(
            child: const Text('Ok'),
            onPressed: () {
              Navigator.of(ctx).pop(); // Cerrar el dialog
            },
          ),
        ],
      ),
    );

    // Nota: Aquí es donde podrías implementar la lógica para guardar los datos capturados
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Añadir Evento'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: _saveForm,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(labelText: 'Título'),
                textInputAction: TextInputAction.next,
                onSaved: (value) {
                  _titulo = value!;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor ingresa un título.';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Descripción'),
                maxLines: 3,
                keyboardType: TextInputType.multiline,
                onSaved: (value) {
                  _descripcion = value!;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor ingresa una descripción.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _pickImage,
                child: const Text('Seleccionar Imagen'),
              ),
              const SizedBox(height: 20),
              if (_image != null) Image.file(_image!),
            ],
          ),
        ),
      ),
    );
  }
}
