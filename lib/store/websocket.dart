import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'dart:io';

class WebSocketStore extends ChangeNotifier {
  late WebSocket webSocket;
  int humidity = 0;
  void connect() async {
    try {
      webSocket = await WebSocket.connect('ws://52.36.218.139');
      webSocket.listen((data) {
        final decoded = jsonDecode(data);
        if (decoded["event"] == "updateMeasureFromIot") {
          humidity = decoded['data']['humidity'];
          notifyListeners();
        }
      });
    } catch (e) {
      rethrow;
    }
  }

  void sendMessage(String message) {}

  void disconnect() {}
}
