import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:sensor_iot/sensor/faceplant/faceplant.dart';
import 'package:sensor_iot/sensor/foxy_sensor.dart';

class FoxySensorList extends ChangeNotifier {
  final List<FoxySensor> _sensors = [
    Faceplant(sensorId: "12", name: "Faceplant_0", type: "faceplant"),
    Faceplant(sensorId: "11", name: "Faceplant_1", type: "faceplant"),
    Faceplant(sensorId: "10", name: "Basilio", type: "faceplant", waterState: WaterState.above)
  ];

  UnmodifiableListView<FoxySensor> get sensors => UnmodifiableListView(_sensors);

  void add() {
    debugPrint('TODO ADD SENSOR');
    notifyListeners();
  }
  void remove() {
    debugPrint('TODO REMOVE SENSOR');
    notifyListeners();
  }

  FoxySensor? withId(String id) {
    final FoxySensor sensor;
    try {
      sensor = _sensors.firstWhere((element) => element.sensorId == id);
      return sensor;
    } on StateError {
      return null;
    }
  }
}