import 'package:flutter/material.dart';
// ignore: library_prefixes
import 'package:socket_io_client/socket_io_client.dart' as IO;

enum ServerStatus { offline, online, connecting }

class SocketService with ChangeNotifier {
  ServerStatus _serverStatus = ServerStatus.connecting;
  ServerStatus get serverStatus => _serverStatus;
  late IO.Socket _socket;
  IO.Socket get socket => _socket;

  SocketService() {
    initConfig();
  }

  void initConfig() {
    _socket = IO.io('https://notificaciones.studio1900web.com', {
      'transports': ['websocket'],
      'autoConnect': true
    });
    _socket.onConnect((_) {
      _serverStatus = ServerStatus.online;
      notifyListeners();
    });
    _socket.onDisconnect((_) {
      _serverStatus = ServerStatus.offline;
      notifyListeners();
    });
  }
}
