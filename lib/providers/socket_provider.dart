import 'package:flutter/material.dart';

import 'package:socket_io_client/socket_io_client.dart' as IO;

enum ServerStatus {
  Online, // Conectado
  Offline, // Desconectado
  Connecting //Conectando..
}

class SocketProvider with ChangeNotifier {

  ServerStatus _serverStatus = ServerStatus.Connecting;
  IO.Socket _socket;

  ServerStatus get serverStatus => this._serverStatus;
  IO.Socket get socket => this._socket;

  SocketProvider() {
    this._initConfig();
  }

  void _initConfig() {
    /* Añadir android:usesCleartextTraffic="true" en el AndroidManifest /main  */
    this._socket = IO.io('http://192.168.1.64:3000/', {
      'transports': ['websocket'],
      'autoConnect': true,
      /* 'forceNew': true */
    });

    this._socket.on('connect', (_) {
      this._serverStatus = ServerStatus.Online;
      notifyListeners();
    });

    this._socket.on('disconnect', (_) {
      this._serverStatus = ServerStatus.Offline;
      notifyListeners();
    });
    

  }
}
