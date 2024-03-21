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
    this.waterState = WaterState.within
  });

  WaterState waterState;
}