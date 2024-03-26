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
        centerTitle: true,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset('assets/foxy_sensor_logo.png', fit: BoxFit.cover, height: 32,),
            const SizedBox(width: 10,),
            const Text('Foxy Sensors',),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
