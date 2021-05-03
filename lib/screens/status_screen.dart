import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:votosapp/providers/socket_provider.dart';

class StatusScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final socketProvider = Provider.of<SocketProvider>(context);

    return Scaffold(
      body: Center(child: Text('ServerStatus: ${socketProvider.serverStatus}')),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.message),
        onPressed: () {
          socketProvider.socket.emit(
              'emit-message', {'nombre': 'Mariana', 'message': 'Hola mundo'});
        },
      ),
    );
  }
}
