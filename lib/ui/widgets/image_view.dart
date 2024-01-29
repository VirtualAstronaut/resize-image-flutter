import 'dart:typed_data';

import 'package:flutter/material.dart';

class ImageView extends StatelessWidget {
  const ImageView({super.key, required this.imageData});
  final Uint8List imageData;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.memory(
            imageData,
            height: MediaQuery.sizeOf(context).height * .3,
            width: MediaQuery.sizeOf(context).width * .3,
          ),
        ],
      ),
    );
  }
}
