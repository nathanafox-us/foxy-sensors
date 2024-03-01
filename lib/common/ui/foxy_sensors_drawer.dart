import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FoxySensorsDrawer extends StatelessWidget {
  const FoxySensorsDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(child: Text('Foxy Sensors')),
          ListTile(
            title: const Text('Sensors'),
            onTap: () {
              context.go('/');
            },
          ),
          ListTile(
            title: const Text('Account'),
            onTap: () {
              context.go('/account');
            },
          ),
          ListTile(
            title: const Text('Friends'),
            onTap: () {
              context.go('/account');
            },
          ),
        ],
      ),
    );
  }
}
