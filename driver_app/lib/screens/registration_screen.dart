import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController pinController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  String? selectedCounty;
  String? selectedSubCounty;
  List<String> counties = ['Nairobi', 'Mombasa', 'Kisumu'];
  List<String> subCounties = [];

  void _fetchSubCounties(String county) {
    setState(() {
      if (county == 'Nairobi') {
        subCounties = ['Westlands', 'Kibra', 'Langata'];
      } else if (county == 'Mombasa') {
        subCounties = ['Mvita', 'Likoni'];
      } else {
        subCounties = ['Nyakach', 'Muhoroni'];
      }
      selectedSubCounty = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Driver Registration')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: firstNameController,
                decoration: InputDecoration(labelText: 'First Name'),
                validator: (value) => value!.isEmpty ? 'Enter your first name' : null,
              ),
              TextFormField(
                controller: lastNameController,
                decoration: InputDecoration(labelText: 'Last Name'),
                validator: (value) => value!.isEmpty ? 'Enter your last name' : null,
              ),
              TextFormField(
                controller: phoneController,
                decoration: InputDecoration(labelText: 'Phone Number'),
                keyboardType: TextInputType.phone,
                validator: (value) => value!.isEmpty ? 'Enter your phone number' : null,
              ),
              TextFormField(
                controller: pinController,
                decoration: InputDecoration(labelText: '4-digit PIN'),
                obscureText: true,
                validator: (value) {
                  if (value!.isEmpty) return 'Enter a PIN';
                  if (value.length != 4) return 'PIN must be 4 digits';
                  return null;
                },
              ),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(labelText: 'Email'),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value!.isEmpty) return 'Enter your email';
                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) return 'Enter a valid email';
                  return null;
                },
              ),
              DropdownButtonFormField<String>(
                value: selectedCounty,
                decoration: InputDecoration(labelText: 'County'),
                items: counties.map((county) {
                  return DropdownMenuItem(
                    value: county,
                    child: Text(county),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedCounty = value;
                    _fetchSubCounties(value!);
                  });
                },
                validator: (value) => value == null ? 'Select a county' : null,
              ),
              DropdownButtonFormField<String>(
                value: selectedSubCounty,
                decoration: InputDecoration(labelText: 'Sub-County'),
                items: subCounties.map((subCounty) {
                  return DropdownMenuItem(
                    value: subCounty,
                    child: Text(subCounty),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedSubCounty = value;
                  });
                },
                validator: (value) => value == null ? 'Select a sub-county' : null,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Call API to register driver here
                    print("Register driver with details");
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
