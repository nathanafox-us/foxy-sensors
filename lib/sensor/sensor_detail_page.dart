import 'package:flutter/material.dart';
import 'package:sensor_iot/sensor/faceplant/faceplant_detail_page.dart';
import 'package:sensor_iot/sensor/foxy_sensor.dart';

class SensorDetailPage extends StatelessWidget {
  const SensorDetailPage({
    Key? key,
    required this.sensor,
  }) : super(key: key);

  final FoxySensor sensor;

  @override
  Widget build(BuildContext context) {
    return switch (sensor.type) {
      _ => FacePlantDetailPage(plantId: sensor.sensorId,),
    };
  }
}
