// Copyright 2019 Aleksander Woźniak
// SPDX-License-Identifier: Apache-2.0

import 'package:ambulance_flutter/api/user_services.dart';
import 'package:ambulance_flutter/models/customer.dart';
import 'package:ambulance_flutter/models/models.dart';

Future<List<User>> getUserList() async {
  List<User> user = await UserServices().getUserList();
  return user;
}

Future<List<Customer>> getCustomerList() async {
  List<Customer> user = await UserServices().getCustomerList();
  return user;
}
