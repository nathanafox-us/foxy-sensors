import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sensor_iot/common/constants/colors.dart';
import 'package:sensor_iot/common/constants/strings.dart';
import 'package:sensor_iot/sensor/dialogs/add_foxy_sensor_dialog.dart';
import 'package:sensor_iot/sensor/dialogs/remove_foxy_sensor_dialog.dart';

class FoxySensorsDrawer extends StatelessWidget {
  const FoxySensorsDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 170,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          GestureDetector(
            onTap: () {
              context.go('/');
            },
            child: DrawerHeader(
              margin: EdgeInsets.zero,
              decoration: const BoxDecoration(
                color: headerColor,
                border: Border(
                  bottom: BorderSide(),
                  top: BorderSide(),
                )
              ),
              child: Image.asset('assets/foxy_sensor_logo_title.png'),
            ),
          ),
          ListTile(
            title: const Text('Account'),
            onTap: () {
              context.go('/account');
            },
          ),
          ListTile(
            title: const Text('Add Sensor'),
            onTap: () {
              showDialog(context: context, builder: (context) => const AddFoxySensorDialog());
            },
          ),
          ListTile(
            title: const Text('Remove Sensor'),
            onTap: () {
              showDialog(context: context, builder: (context) => const RemoveFoxySensorDialog());
            },
          ),
          const ListTile(
            title: Text(
              appVersion,
              style: TextStyle(color: Color(0xFF536E7C)),
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }
}
