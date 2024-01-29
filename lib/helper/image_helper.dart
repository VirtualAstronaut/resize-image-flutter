import 'dart:convert';
import 'dart:ui';
import 'dart:html' as html;
import 'dart:js' as js;
import 'package:path/path.dart' as p;

import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';

class ImageHelper {
  final ImagePicker _picker = ImagePicker();
  static final ImageHelper _imageHelper = ImageHelper._internal();
  factory ImageHelper() => _imageHelper;
  ImageHelper._internal();
  XFile? originalImage;
  Image? modifiedImage;
  Future<XFile?> getImage() async {
    return originalImage = await _picker.pickImage(source: ImageSource.gallery);
  }

  void modifyImageSave() async {
    await getImage();
    if (originalImage == null) {
      throw Exception('originalImage null');
    }
    final bytesData = await originalImage!.readAsBytes();
    final modifiedXFileData = await FlutterImageCompress.compressWithList(
      bytesData,
      quality: 50,
    );
    modifiedImage = Image.memory(modifiedXFileData);
    final fileName = 'modified${originalImage!.name}';
    download(modifiedXFileData, fileName);
  }

  void download(List<int> bytes, String fileName) {
    js.context.callMethod('saveAs', <Object>[
      html.Blob(<Object>[bytes]),
      fileName
    ]);
  }
}
