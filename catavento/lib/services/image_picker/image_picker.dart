import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

Future<File?> selecionarFoto(BuildContext context) async {
  final ImagePicker picker = ImagePicker();
  final XFile? imagemSelecionada = await picker.pickImage(
    source: ImageSource.gallery,
    maxHeight: 800,
    maxWidth: 800,
    imageQuality: 85,
  );

  if (imagemSelecionada != null) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Foto selecionada com sucesso!')),
    );
    return File(imagemSelecionada.path);
  } else {
    return null;
  }
}
