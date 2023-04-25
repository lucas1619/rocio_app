import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'dart:io';

class WebSocketStore extends ChangeNotifier {
  late WebSocket webSocket;
  int humidity = 0;
  void connect() async {
    try {
      webSocket = await WebSocket.connect('ws://52.36.218.139');
      print("Conectado al WebSocket");
      webSocket.listen((data) {
        final decoded = jsonDecode(data);
        if (decoded["event"] == "updateMeasureFromIot") {
          humidity = decoded['data']['humidity'];
          print(humidity);
          notifyListeners();
        }
        print('WebSocket: $data');
      });
    } catch (e) {
      print('Error al conectarse al WebSocket: $e');
    }
  }

  void sendMessage(String message) {}

  void disconnect() {}
}
