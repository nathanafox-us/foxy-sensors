import 'package:sensor_iot/sensor/foxy_sensor.dart';

enum WaterState {
  below,
  within,
  above
}

class Faceplant extends FoxySensor {
  Faceplant({
    required super.sensorId,
    required super.name,
    required super.type,
    this.waterState = WaterState.within,
    this.capacitance = 40.0,
    this.temperature = 0.0,
    this.lastReportedDate,
  });

  WaterState waterState;
  double capacitance;
  double temperature;
  DateTime? lastReportedDate = DateTime(2020);
}