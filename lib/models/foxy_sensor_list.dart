import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:sensor_iot/sensor/foxy_sensor.dart';

class FoxySensorList extends ChangeNotifier {
  final List<FoxySensor> _sensors = [
    FoxySensor(name: "Faceplant_0", type: ""),
    FoxySensor(name: "Faceplant_1", type: ""),
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
}