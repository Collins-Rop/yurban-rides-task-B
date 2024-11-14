import 'package:flutter/material.dart';
import '../services/api_service.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';

class DriverHomeScreen extends StatelessWidget {
  final ApiService _apiService = ApiService();

  Future<void> _goOnline(BuildContext context) async {
    try {
      await _apiService.updateDriverStatus(true);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('You are now online')));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed to go online. Please try again.')));
    }
  }

  Future<void> _goOffline(BuildContext context) async {
    try {
      await _apiService.updateDriverStatus(false);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('You are now offline')));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed to go offline. Please try again.')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Driver Home')),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(child: Text('Driver Menu')),
            ListTile(
              title: Text('Profile'),
              onTap: () {
                Navigator.pushNamed(context, '/driver_profile');
              },
            ),
            ListTile(
              title: Text('My Rides'),
              onTap: () {
                Navigator.pushNamed(context, '/driver_rides');
              },
            ),
            ListTile(
              title: Text('Logout'),
              onTap: () {
                Provider.of<AuthProvider>(context, listen: false).logout();
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(height: 200, color: Colors.blue),
            ElevatedButton(
              onPressed: () {
                _goOnline(context);
              },
              child: Text('Go Online'),
            ),
            ElevatedButton(
              onPressed: () {
                _goOffline(context);
              },
              child: Text('Go Offline'),
            ),
          ],
        ),
      ),
    );
  }
}