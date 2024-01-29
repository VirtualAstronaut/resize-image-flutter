import 'package:flutter/material.dart';
import 'package:resize_image/helper/extentions.dart';

class ClickToLoad extends StatelessWidget {
  const ClickToLoad({super.key, required this.onTap});
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: FilledButton.tonalIcon(
        onPressed: onTap,
        icon: const Icon(Icons.image),
        label: Text(
          context.loc.clickToSelect,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
    );
  }
}
