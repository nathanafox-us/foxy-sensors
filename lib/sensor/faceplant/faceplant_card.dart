import 'package:flutter/material.dart';
import 'package:sensor_iot/sensor/faceplant/faceplant.dart';
import 'package:sensor_iot/sensor/foxy_sensor_card.dart';

class FacePlantCard extends SensorCard {
  const FacePlantCard({
    super.key,
    required super.sensor,
  });

  @override
  Widget build(BuildContext context) {
    final faceplant = sensor as Faceplant;

    return Card(
      margin: const EdgeInsets.all(5),
      child: InkWell(
        onTap: () {
          goToDetailPage(context);
        },
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            image: DecorationImage(
              fit: BoxFit.contain,
              image: AssetImage('assets/sunny_background.png'),
            ),
          ),
          padding: const EdgeInsets.all(10),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Hero(
                  tag: faceplant.name,
                    child: switch (faceplant.waterState) {
                      WaterState.within => Image.asset('assets/smile_2.png'),
                      WaterState.above => Image.asset('assets/drown.png'),
                      WaterState.below => Image.asset('assets/frown.png'),
                    },
                  )
                ),
                const SizedBox(height: 10,),

                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.white
                  ),
                  width: double.infinity,
                  child: Text(sensor.name, style: const TextStyle(fontSize: 16), textAlign: TextAlign.center,),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}