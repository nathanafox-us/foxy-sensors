import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FoxySensorsDrawer extends StatelessWidget {
  const FoxySensorsDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 180,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          GestureDetector(
            onTap: () {
              context.go('/');
            },
            child: DrawerHeader(
              decoration: BoxDecoration(color: Theme.of(context).colorScheme.inversePrimary),
              child: Image.asset('assets/foxy_sensor_logo.png'),
            ),
          ),
          ListTile(
            title: const Text('Account'),
            onTap: () {
              context.go('/account');
            },
          ),
          ListTile(
            title: const Text('Sensors'),
            onTap: () {
              context.go('/');
            },
          ),
          ListTile(
            title: const Text('Add a Sensor'),
            onTap: () {
              debugPrint('TODO: ADD A SENSOR');
            },
          ),
          ListTile(
            title: const Text('Remove a Sensor'),
            onTap: () {
              debugPrint('TODO: REMOVE A SENSOR');
            },
          )
        ],
      ),
    );
  }
}
