import 'package:flutter/material.dart';

class DriverHomeScreen extends StatelessWidget {
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
                // Navigate to profile screen
              },
            ),
            ListTile(
              title: Text('My Rides'),
              onTap: () {
                // Navigate to My Rides screen
              },
            ),
            ListTile(
              title: Text('Logout'),
              onTap: () {
                // Handle logout
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Sample map widget
            Container(height: 200, color: Colors.blue),
            ElevatedButton(
              onPressed: () {
                // Go Online logic
              },
              child: Text('Go Online'),
            ),
            ElevatedButton(
              onPressed: () {
                // Go Offline logic
              },
              child: Text('Go Offline'),
            ),
          ],
        ),
      ),
    );
  }
}