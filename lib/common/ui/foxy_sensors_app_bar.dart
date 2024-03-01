import 'package:flutter/material.dart';

class FoxySensorsAppBar extends StatelessWidget implements PreferredSizeWidget {
  const FoxySensorsAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      title: const Text('Foxy Sensors'),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
