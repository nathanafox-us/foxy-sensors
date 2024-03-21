import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sensor_iot/common/ui/foxy_sensors_app_bar.dart';
import 'package:sensor_iot/common/ui/foxy_sensors_drawer.dart';
import 'package:sensor_iot/models/foxy_sensor_list.dart';
import 'package:sensor_iot/sensor/faceplant/faceplant.dart';
import 'package:sensor_iot/sensor/sensor_detail_page.dart';

class FacePlantDetailPage extends StatelessWidget {
  const FacePlantDetailPage({
    required this.plantId,
    Key? key,
  }) : super(key: key);

  final int plantId;

  @override
  Widget build(BuildContext context) {
    final sensorList = Provider.of<FoxySensorList>(context);
    final faceplant = sensorList.withId(plantId) as Faceplant;

    return Scaffold(
      appBar: const FoxySensorsAppBar(),
      drawer: const FoxySensorsDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(faceplant.name),
            Text(faceplant.type),
            Text('ID: ${faceplant.sensorId}'),
            switch(faceplant.waterState) {
              WaterState.within => Image.asset('assets/smile_2.png'),
              WaterState.above => Image.asset('assets/drown.png'),
              WaterState.below => Image.asset('assets/frown.png'),
            }
          ],
        ),
      ),
    );
  }
}
