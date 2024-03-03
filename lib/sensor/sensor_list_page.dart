import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sensor_iot/common/ui/foxy_sensors_app_bar.dart';
import 'package:sensor_iot/common/ui/foxy_sensors_drawer.dart';
import 'package:sensor_iot/models/foxy_sensor_list.dart';
import 'package:sensor_iot/sensor/foxy_sensor_card.dart';

class SensorListPage extends StatelessWidget {
  const SensorListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sensorList = Provider.of<FoxySensorList>(context);

    return Scaffold(
      appBar: const FoxySensorsAppBar(),
      drawer: const FoxySensorsDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(5),
        child: GridView.count(
          crossAxisCount: 2,
          children: sensorList.sensors.map((sensor) => SensorCard(sensor: sensor)).toList(),
        ),
      ),
    );
  }
}
