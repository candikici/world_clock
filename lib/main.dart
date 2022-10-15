import 'package:dop_case/constants/colors.dart';
import 'package:dop_case/services/http/http_service.dart';
import 'package:dop_case/utilities/router.dart';
import 'package:dop_case/view/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'provider/app_state.dart';

void main() {
  runApp(WorldClock(appRouter: AppRouter()));
}

class WorldClock extends StatelessWidget {
  const WorldClock({
    super.key,
    required this.appRouter,
  });

  final AppRouter appRouter;

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
        onGenerateRoute: (settings) => appRouter.onGenerateRoute(settings),
        title: 'Flutter Demo',
        theme: ThemeData(
          scaffoldBackgroundColor: WorldClockColors.lightBG,
          primarySwatch: Colors.blue,
        ),
        home: const HomePage(),
      ),
    );
  }
}
