import 'package:dop_case/services/http/http_service.dart';
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

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
