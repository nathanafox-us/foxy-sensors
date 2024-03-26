import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sensor_iot/common/ui/error_page.dart';
import 'package:sensor_iot/models/foxy_sensor_list.dart';
import 'package:sensor_iot/sensor/faceplant/faceplant.dart';
import 'package:sensor_iot/sensor/faceplant/faceplant_detail_page.dart';

class SensorDetailPage extends StatelessWidget {
  const SensorDetailPage({
    Key? key,
    required this.sid,
  }) : super(key: key);

  final String sid;

  @override
  Widget build(BuildContext context) {
    final sensorList = Provider.of<FoxySensorList>(context);
    final sensor = sensorList.withId(sid);

    return switch (sensor?.type) {
      null => const ErrorPage(),
      _ => FacePlantDetailPage(faceplant: sensor as Faceplant,),
    };
  }
}
