import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sensor_iot/common/ui/foxy_sensors_app_bar.dart';
import 'package:sensor_iot/common/ui/foxy_sensors_drawer.dart';
import 'package:sensor_iot/models/foxy_sensor_list.dart';
import 'package:sensor_iot/sensor/faceplant/faceplant.dart';
import 'package:sensor_iot/sensor/faceplant/water_slider.dart';

class FacePlantDetailPage extends StatelessWidget {
  const FacePlantDetailPage({
    required this.faceplant,
    Key? key,
  }) : super(key: key);

  final Faceplant faceplant;

  @override
  Widget build(BuildContext context) {
    final sensorList = Provider.of<FoxySensorList>(context);

    return Scaffold(
      appBar: const FoxySensorsAppBar(),
      drawer: const FoxySensorsDrawer(),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/sunny_background.png')
          ),
        ),
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                child: Hero(
                  tag: faceplant.name,
                  child: switch (faceplant.waterState) {
                    WaterState.within => Image.asset('assets/smile_2.png'),
                    WaterState.above => Image.asset('assets/drown.png'),
                    WaterState.below => Image.asset('assets/frown.png'),
                  },
                ),
              ),

              Container(
                margin: const EdgeInsets.all(20),
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.white
                ),
                child: Column(
                  children: [
                    Text(faceplant.name, style: const TextStyle(fontSize: 30),),
                    const SizedBox(height: 10,),
                    Text(faceplant.type,),
                    const SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: WaterSlider(value: faceplant.capacitance),
                    ),
                    const SizedBox(height: 20,),
                    DataTable(
                        headingRowHeight: 0,
                        showBottomBorder: true,
                        columns: const [
                          DataColumn(label: Text('')),
                          DataColumn(label: Text(''))
                        ],
                        rows: [
                          DataRow(cells: [
                            const DataCell(Text('Water Level (20 - 200):')),
                            DataCell(Text(faceplant.capacitance.toStringAsFixed(2))),
                          ]),
                          DataRow(cells: [
                            const DataCell(Text('Temperature (Celsius):')),
                            DataCell(Text(faceplant.temperature.toStringAsFixed(2))),
                          ])
                        ]
                    ),
                    const SizedBox(height: 20,),
                    Text('Last reported: ${faceplant.lastReportedDate.toString()}'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
