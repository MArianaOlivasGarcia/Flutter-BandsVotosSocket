
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:votosapp/providers/socket_provider.dart';
import 'package:votosapp/screens/home_screen.dart';
import 'package:votosapp/screens/status_screen.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SocketProvider() )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Votos App',
        initialRoute: 'home',
        routes: {
          'home': (_) => HomeScreen(),
          'status': (_) => StatusScreen(),
        }
      ),
    );
  }
}