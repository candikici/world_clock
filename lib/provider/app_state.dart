import 'dart:convert';
import 'dart:developer';

import 'package:dop_case/constants/api_endpoints.dart';
import 'package:dop_case/models/timezone.dart';
import 'package:dop_case/services/http/http_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';

class AppState with ChangeNotifier {
  final HttpService httpService;

  AppState({required this.httpService});

  List<String> timezones = [];
  Timezone? localTimezone;
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

  getSingleTimezone({String? zone}) async {
    try {
      String timezone = "";
      if (zone != null) {
        timezone = zone;
      } else {
        timezone = await FlutterNativeTimezone.getLocalTimezone();
      }
      var response = await httpService.get(
          url: WorldClockURLs.singleTimezoneURL
              .replaceAll("{timezone}", timezone));
      if (response.statusCode >= 200 && response.statusCode <= 299) {
        log(response.body.toString());
        var decodedJson = jsonDecode(response.body);
        if (zone == null) {
          localTimezone = Timezone.fromMap(decodedJson);
        } else {
          selectedTimezone = Timezone.fromMap(decodedJson);
        }
      }
      notifyListeners();
    } catch (e) {
      log(e.toString(), name: "SINGLE TIMEZONE ERROR");
    }
  }
}
