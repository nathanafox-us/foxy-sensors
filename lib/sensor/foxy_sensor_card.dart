import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sensor_iot/sensor/faceplant/faceplant_card.dart';
import 'package:sensor_iot/sensor/foxy_sensor.dart';

abstract class SensorCard extends StatelessWidget {
  const SensorCard({
    required this.sensor,
    Key? key,
  }) : super(key: key);

  final FoxySensor sensor;

  void goToDetailPage(BuildContext context) {
    context.go('/sensor_detail', extra: sensor);
  }

  factory SensorCard.factory({required FoxySensor sensor}) {
    return switch(sensor.type) {
      _ => FacePlantCard(sensor: sensor,),
    };
  }
}