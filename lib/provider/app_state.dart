import 'package:dop_case/services/http/http_service.dart';
import 'package:flutter/material.dart';

class AppState with ChangeNotifier {
  final HttpService httpService;

  AppState({required this.httpService});
}
