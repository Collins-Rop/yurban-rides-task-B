import 'package:flutter/material.dart';
import '../services/api_service.dart';

class RequestRideScreen extends StatefulWidget {
  @override
  _RequestRideScreenState createState() => _RequestRideScreenState();
}

class _RequestRideScreenState extends State<RequestRideScreen> {
  final _formKey = GlobalKey<FormState>();
  final ApiService _apiService = ApiService();

  String pickupPoint = '';
  String dropoffPoint = '';
  int numberOfPassengers = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Request Ride')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Pick-up Point'),
                onChanged: (value) => pickupPoint = value,
                validator: (value) => value!.isEmpty ? 'Please enter your pick-up point' : null,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Drop-off Point'),
                onChanged: (value) => dropoffPoint = value,
                validator: (value) => value!.isEmpty ? 'Please enter your drop-off point' : null,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Number of Passengers'),
                keyboardType: TextInputType.number,
                onChanged: (value) => numberOfPassengers = int.tryParse(value) ?? 1,
                validator: (value) => value!.isEmpty ? 'Please enter number of passengers' : null,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    try {
                      final response = await _apiService.requestRide(pickupPoint, dropoffPoint, numberOfPassengers);
                      if (response.success) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Ride requested successfully!')));
                        Navigator.pop(context);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(response.message)));
                      }
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed to request ride. Please try again.')));
                    }
                  }
                },
                child: Text('Request Ride'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}