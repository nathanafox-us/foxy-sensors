import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sensor_iot/models/foxy_sensor_list.dart';
import 'package:sensor_iot/sensor/foxy_sensor.dart';

class RemoveFoxySensorDialog extends StatefulWidget {
  const RemoveFoxySensorDialog({Key? key}) : super(key: key);

  @override
  State<RemoveFoxySensorDialog> createState() => _RemoveFoxySensorDialogState();
}

class _RemoveFoxySensorDialogState extends State<RemoveFoxySensorDialog> {
  FoxySensor? _selectedSensor;
  bool _partTwo = false;

  @override
  Widget build(BuildContext context) {
    final sensorList = Provider.of<FoxySensorList>(context);

    if (_partTwo) {
      return AlertDialog(
        title: const Text('Remove Sensor', textAlign: TextAlign.center,),
        content: const Text('In order to delete the sensor from the list, please type exactly permanently delete below'),
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          ElevatedButton(
            onPressed: () {

            },
            child: const Text('Submit'),
          ),
          ElevatedButton(
            onPressed: Navigator.of(context).pop,
            child: const Text('Cancel'),
          ),
        ],
      );
    }

    if (_selectedSensor != null) {
      return AlertDialog(
        title: const Text('Remove Sensor', textAlign: TextAlign.center,),
        content: const Text('WARNING! Removing the sensor from the list is a permanent action. It will have to be re-added for you to see the information. Continue with the operation?'),
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          ElevatedButton(
            onPressed: (){
              setState(() {
                _partTwo = true;
              });
            },
            child: const Text('Yes'),
          ),
          ElevatedButton(
            onPressed: Navigator.of(context).pop,
            child: const Text('No'),
          ),
        ],
      );
    }

    return AlertDialog(
      title: const Text('Remove Sensor', textAlign: TextAlign.center,),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: sensorList.sensors.map((sensor) => ListTile(
            onTap: () {
              setState(() {
                _selectedSensor = sensor;
              });
            },
            title: Text(sensor.name, textAlign: TextAlign.center,),
            subtitle: (sensor.type != '') ? Text(sensor.type) : null,
          )).toList(),
        ),
      )
    );
  }
}
