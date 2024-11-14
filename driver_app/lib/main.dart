import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/driver_login_screen.dart';
import 'screens/driver_home_screen.dart';
import 'screens/driver_registration_screen.dart';
import 'providers/auth_provider.dart';

void main() {
  runApp(DriverApp());
}

class DriverApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AuthProvider(),
      child: MaterialApp(
        title: 'Driver App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => DriverLoginScreen(),
          '/driver_home': (context) => DriverHomeScreen(),
          '/driver_registration': (context) => DriverRegistrationScreen(),
          '/driver_login': (context) => DriverLoginScreen(),
        },
      ),
    );
  }
}