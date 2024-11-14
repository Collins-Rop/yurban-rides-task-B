import 'package:flutter/material.dart';
import '../models/driver.dart';
import '../services/api_service.dart';

class DriverRegistrationScreen extends StatefulWidget {
  @override
  _DriverRegistrationScreenState createState() => _DriverRegistrationScreenState();
}

class _DriverRegistrationScreenState extends State<DriverRegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  final ApiService _apiService = ApiService();

  String firstName = '';
  String lastName = '';
  String phoneNumber = '';
  String pin = '';
  String gender = '';
  String email = '';
  String county = '';
  String subCounty = '';


  List<String> counties = ['County1', 'County2'];
  List<String> subCounties = ['SubCounty1', 'SubCounty2'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Driver Registration')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'First Name'),
                onChanged: (value) => firstName = value,
                validator: (value) => value!.isEmpty ? 'Please enter your first name' : null,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Last Name'),
                onChanged: (value) => lastName = value,
                validator: (value) => value!.isEmpty ? 'Please enter your last name' : null,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Phone Number'),
                onChanged: (value) => phoneNumber = value,
                validator: (value) => value!.isEmpty ? 'Please enter your phone number' : null,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'PIN'),
                obscureText: true,
                onChanged: (value) => pin = value,
                validator: (value) => value!.length != 4 ? 'PIN must be 4 digits' : null,
              ),
              DropdownButtonFormField<String>(
                value: gender,
                items: ['Male', 'Female', 'Other']
                    .map((gender) => DropdownMenuItem(value: gender, child: Text(gender)))
                    .toList(),
                onChanged: (value) => setState(() => gender = value!),
                decoration: InputDecoration(labelText: 'Gender'),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Email'),
                onChanged: (value) => email = value,
                validator: (value) => value!.isEmpty ? 'Please enter your email' : null,
              ),
              DropdownButtonFormField<String>(
                value: county,
                items: counties
                    .map((county) => DropdownMenuItem(value: county, child: Text(county)))
                    .toList(),
                onChanged: (value) => setState(() => county = value!),
                decoration: InputDecoration(labelText: 'County'),
              ),
              DropdownButtonFormField<String>(
                value: subCounty,
                items: subCounties
                    .map((subCounty) => DropdownMenuItem(value: subCounty, child: Text(subCounty)))
                    .toList(),
                onChanged: (value) => setState(() => subCounty = value!),
                decoration: InputDecoration(labelText: 'Sub-County'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    Driver driver = Driver(
                      firstName: firstName,
                      lastName: lastName,
                      phoneNumber: phoneNumber,
                      pin: pin,
                      gender: gender,
                      email: email,
                      county: county,
                      subCounty: subCounty,
                    );
                    try {
                      await _apiService.registerDriver(driver);
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Registration successful. Please login.')));
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Registration failed. Please try again.')));
                    }
                  }
                },
                child: Text('Register'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}