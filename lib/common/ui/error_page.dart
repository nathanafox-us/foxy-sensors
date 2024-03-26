import 'package:flutter/material.dart';
import 'package:sensor_iot/common/ui/foxy_sensors_app_bar.dart';
import 'package:sensor_iot/common/ui/foxy_sensors_drawer.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const FoxySensorsAppBar(),
      drawer: const FoxySensorsDrawer(),
      body: Center(
        child: Column(
          children: [
            const Text('Error, that is not a page that you can go to...'),
            TextButton(
              onPressed: Navigator.of(context).pop,
              child: const Text('Back')
            ),
          ],
        )
      ),
    );
  }
}
