import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:resize_image/helper/extentions.dart';
import 'package:resize_image/helper/image_helper.dart';
import 'package:resize_image/helper/snackbars.dart';
import 'package:resize_image/ui/widgets/widgets.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Uint8List? imageData;
  void onLoad() async {
    final imageHelper = ImageHelper();
    final xFile = await imageHelper.getImage();
    if (xFile == null && mounted) {
      SnackbarMessages.showSnackBar(context, context.loc.noFileSelected);
      return;
    }
    imageData = await xFile!.readAsBytes();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: imageData != null
          ? ImageView(
              imageData: imageData!,
            )
          : ClickToLoad(
              onTap: onLoad,
            ),
    );
  }
}
