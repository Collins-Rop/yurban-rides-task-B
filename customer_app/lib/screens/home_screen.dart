import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';
import 'login_screen.dart';

class CustomerHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Customer Home')),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(child: Text('Customer Menu')),
            ListTile(
              title: Text('Profile'),
              onTap: () {
                Navigator.pushNamed(context,
                    MaterialPageRoute(builder: (context) => ProfileScreen()));
              },
            ),
            ListTile(
              title: Text('My Rides'),
              onTap: () {
                Navigator.pushNamed(context,
                    MaterialPageRoute(builder: (context) => MyRidesScreen()));
              },
            ),
            ListTile(
              title: Text('Logout'),
              onTap: () {
                Provider.of<AuthProvider>(context, listen: false).logout();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(height: 200, color: Colors.green),
            ElevatedButton(
              onPressed: () {
                _requestRide(context);
              },
              child: Text('Request Ride'),
            ),
          ],
        ),
      ),
    );
  }
}