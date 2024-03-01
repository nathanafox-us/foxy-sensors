import 'package:flutter/material.dart';
import 'package:sensor_iot/common/ui/foxy_sensors_app_bar.dart';
import 'package:sensor_iot/common/ui/foxy_sensors_drawer.dart';
import 'package:sensor_iot/sensor/sensor.dart';
import 'package:sensor_iot/sensor/sensor_card.dart';

class SensorListPage extends StatelessWidget {
  const SensorListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const FoxySensorsAppBar(),
      drawer: const FoxySensorsDrawer(),
      body: Center(
        child: Column(
          children: [
            SensorCard(sensor: FoxySensor(name: "Faceplant_0", type: "")),
          ],
        ),
      )
    );
  }
}
