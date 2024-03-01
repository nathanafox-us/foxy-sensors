import 'package:flutter/material.dart';
import 'package:sensor_iot/common/ui/foxy_sensors_app_bar.dart';
import 'package:sensor_iot/common/ui/foxy_sensors_drawer.dart';
import 'package:sensor_iot/sensor/sensor.dart';

class AccountDetailsPage extends StatelessWidget {
  const AccountDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FoxySensor(name: "Test", type: "Test").connectToMqtt();

    return const Scaffold(
      appBar: FoxySensorsAppBar(),
      drawer: FoxySensorsDrawer(),
      body: Center(child: Text('Todo: account details page'),),
    );
  }
}
