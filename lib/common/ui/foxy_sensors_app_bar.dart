import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FoxySensorsAppBar extends StatelessWidget implements PreferredSizeWidget {
  const FoxySensorsAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        context.go('/');
      },
      child: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Foxy Sensors'),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
