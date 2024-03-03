import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sensor_iot/sensor/foxy_sensor.dart';

class SensorCard extends StatelessWidget {
  const SensorCard({
    required this.sensor,
    Key? key,
  }) : super(key: key);

  final FoxySensor sensor;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(5),
      child: InkWell(
        onTap: () {
          sensor.connectToMqtt();
        },
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.face, size: 100,),
              Text(sensor.name)
            ],
          ),
        ),
      ),
    );
  }
}
