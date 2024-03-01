import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sensor_iot/sensor/sensor.dart';

class SensorCard extends StatelessWidget {
  const SensorCard({
    required this.sensor,
    Key? key,
  }) : super(key: key);

  final FoxySensor sensor;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          sensor.connectToMqtt();
        },
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const Icon(Icons.face),
              Text(sensor.name)
            ],
          ),
        ),
      ),
    );
  }
}
