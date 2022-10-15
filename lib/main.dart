import 'package:dop_case/services/http/http_service.dart';
import 'package:dop_case/view/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'provider/app_state.dart';

void main() {
  runApp(const WorldClock());
}

class WorldClock extends StatelessWidget {
  const WorldClock({super.key});

  @override
  Widget build(BuildContext context) {
    final HttpService httpService = HttpService();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AppState>(
          create: (context) => AppState(httpService: httpService),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomePage(),
      ),
    );
  }
}
