import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';
import 'package:mqtt_client/mqtt_browser_client.dart';
import 'package:sensor_iot/common/constants/strings.dart';

class FoxySensor {
  final int sensorId;
  final String type;
  final String name;
  final MqttServerClient _client = MqttServerClient(iotEndpoint, 'MAKE_ME_UNIQUE_LATER_TODO_');

  FoxySensor({required this.sensorId, required this.type, required this.name});

  Future<bool> connectToMqtt() async {
    ByteData rootCA = await rootBundle.load('assets/certs/AmazonRootCA1.pem');
    ByteData deviceCert = await rootBundle.load('assets/certs/certificate.pem.crt');
    ByteData deviceKey = await rootBundle.load('assets/certs/private.pem.key');

    final sc = SecurityContext.defaultContext;
    sc.setClientAuthoritiesBytes(rootCA.buffer.asUint8List());
    sc.useCertificateChainBytes(deviceCert.buffer.asUint8List());
    sc.usePrivateKeyBytes(deviceKey.buffer.asUint8List());

    _client.logging(on: true);
    _client.secure = true;
    _client.securityContext = sc;
    _client.setProtocolV311();
    _client.onConnected = onConnect;
    _client.onDisconnected = onDisconnect;
    _client.onSubscribed = onSubscribe;
    _client.onUnsubscribed = onUnsubscribe;
    _client.port = 8883;
    _client.keepAlivePeriod = 20;

    final connMessage = MqttConnectMessage().startClean();
    _client.connectionMessage = connMessage;

    try {
      await _client.connect();
    } catch (err) {
      debugPrint(err.toString());
      return false;
    }

    if (_client.connectionStatus!.state == MqttConnectionState.connected) {
      debugPrint('Connected to AWS MUHUHUHAHAHA');
    } else {
      debugPrint('Failed to connect to AWS');
      return false;
    }

    const topic = '/things/face_plant_0/shadow';
    _client.subscribe(topic, MqttQos.atLeastOnce);

    return true;
  }

  void onConnect() {
    debugPrint('\n\nSUCCESSFULLY CONNECTED');
  }
  void onDisconnect() {
    debugPrint('\n\nDISCONNECTED');
  }
  void onSubscribe(String topic) {
    debugPrint('Subscribed to $topic');
  }
  void onUnsubscribe(String? topic) {
    debugPrint('Unsubscribed from $topic');
  }
}