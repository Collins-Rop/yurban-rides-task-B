import 'package:flutter/foundation.dart';
import '../models/driver.dart';
import '../models/customer.dart';

class AuthProvider with ChangeNotifier {
  Driver? _driver;
  Customer? _customer;

  Driver? get driver => _driver;
  Customer? get customer => _customer;

  void setDriver(Driver driver) {
    _driver = driver;
    notifyListeners();
  }

  void setCustomer(Customer customer) {
    _customer = customer;
    notifyListeners();
  }

}