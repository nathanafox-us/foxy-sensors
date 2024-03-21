import 'package:flutter/material.dart';

class AddFoxySensorDialog extends StatefulWidget {
  const AddFoxySensorDialog({Key? key}) : super(key: key);

  @override
  State<AddFoxySensorDialog> createState() => _AddFoxySensorDialogState();
}

class _AddFoxySensorDialogState extends State<AddFoxySensorDialog> {
  bool _decidedToTap = false;
  bool _decidedToQR = false;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add Sensor', textAlign: TextAlign.center,),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('Please choose to either TAP your device to the sensor or scan the QR Code'),
          const SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: (){
                  setState(() {
                    _decidedToTap = true;
                  });
                },
                child: const Icon(Icons.nfc),
              ),
              const SizedBox(width: 10,),
              ElevatedButton(
                onPressed: (){
                  setState(() {
                    _decidedToQR = true;
                  });
                },
                child: const Icon(Icons.qr_code),
              ),
            ],
          )
        ],
      )
    );
  }
}
