// Copyright 2019 Aleksander Woźniak
// SPDX-License-Identifier: Apache-2.0

import 'package:ambulance_flutter/api/dispatch_services.dart';
import 'package:ambulance_flutter/models/models.dart';
import 'package:ambulance_flutter/screens/auth.dart';

Future<Map<DateTime, List<Dispatch>>> getTask(type) async {
  Map<DateTime, List<Dispatch>> mapFetch = {};
  List<Dispatch> dispatch;

  switch (type) {
    case 'driver':
      dispatch =
          await DispatchServices().getDriverDispatch(Auth.user.id.toString());
      break;
    case 'emt':
      dispatch =
          await DispatchServices().getEmtDispatch(Auth.user.id.toString());
      break;
    default:
      dispatch = await DispatchServices().getAllDispatch();
  }

  for (int i = 0; i < dispatch.length; i++) {
    var dispatchTime = DateTime(
        DateTime.parse(dispatch[i].dDate).year,
        DateTime.parse(dispatch[i].dDate).month,
        DateTime.parse(dispatch[i].dDate).day);
    //print(formattedDate);
    var original = mapFetch[dispatchTime];
    if (original == null) {
      //print("null");
      mapFetch[dispatchTime] = [dispatch[i]];
    } else {
      //print(dispatch[i].dDate);
      mapFetch[dispatchTime] = List.from(original)..addAll([dispatch[i]]);
    }
  }

  return mapFetch;
}

Future<List<Dispatch>> checkTask() async {
  List<Dispatch> dispatch = await DispatchServices().checkDispatchTask();
  return dispatch;
}
