import 'package:flutter/material.dart';

class DriverLoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Driver Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Phone Number'),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'PIN'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle login logic
              },
              child: Text('Login'),
            ),
            TextButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  try {
                    // Call the API to log in the driver
                    final response = await _apiService.loginDriver(phoneNumber, pin);
                    if (response.success) {
                      // Save driver details and navigate to home screen
                      Provider.of<AuthProvider>(context, listen: false).setDriver(response.driver);
                      Navigator.pushReplacementNamed(context, '/driver_home');
                    } else {
                      // Show error message
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(response.message)));
                    }
                  } catch (e) {
                    // Handle error
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Login failed. Please try again.')));
                  }
                }
              },
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}