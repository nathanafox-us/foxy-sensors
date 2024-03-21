import 'package:flutter/material.dart';

class WaterSlider extends StatelessWidget {
  const WaterSlider({
    Key? key,
    required this.value,
  }) : super(key: key);

  final double value;

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      value: (value - 20) / 180,
    );
  }
}
