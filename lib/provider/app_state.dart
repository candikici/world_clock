import 'dart:convert';
import 'dart:developer';

import 'package:dop_case/constants/api_endpoints.dart';
import 'package:dop_case/models/timezone.dart';
import 'package:dop_case/services/http/http_service.dart';
import 'package:flutter/material.dart';

class AppState with ChangeNotifier {
  final HttpService httpService;

  AppState({required this.httpService});

  List<String> timezones = [];

  Timezone? selectedTimezone;

  getTimezoneList() async {
    try {
      var response = await httpService.get(url: WorldClockURLs.timezonesURL);
      if (response.statusCode >= 200 && response.statusCode <= 299) {
        var decodedJson = jsonDecode(response.body);
        timezones = List.from(decodedJson.map((x) => x as String));
      }
      notifyListeners();
    } catch (e) {
      log(e.toString(), name: "TIMEZONE LIST ERROR");
    }
  }

  getSingleTimezone({required String zone}) async {
    try {
      var response = await httpService.get(
          url: WorldClockURLs.singleTimezoneURL.replaceAll("{timezone}", zone));
      if (response.statusCode >= 200 && response.statusCode <= 299) {
        log(response.body.toString());
        var decodedJson = jsonDecode(response.body);
        selectedTimezone = Timezone.fromMap(decodedJson);
      }
      notifyListeners();
    } catch (e) {
      log(e.toString(), name: "SINGLE TIMEZONE ERROR");
    }
  }
}
