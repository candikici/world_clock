import 'package:dop_case/constants/theme_data.dart';
import 'package:dop_case/provider/theme_notifier.dart';
import 'package:dop_case/services/http/http_service.dart';
import 'package:dop_case/utilities/router.dart';
import 'package:dop_case/view/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'provider/app_state.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  final HttpService httpService = HttpService();
  var prefs = await SharedPreferences.getInstance();
  bool? isDarkTheme = prefs.getBool("isDarkTheme");

  ThemeMode themeMode = isDarkTheme != null
      ? (isDarkTheme ? ThemeMode.dark : ThemeMode.light)
      : ThemeMode.system;

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<AppState>(
        create: (context) => AppState(httpService: httpService),
      ),
      ChangeNotifierProvider<ThemeNotifier>(
        create: (context) => ThemeNotifier(themeMode),
      ),
    ],
    child: WorldClock(appRouter: AppRouter()),
  ));
  initializeDateFormatting("tr", null);
}

class WorldClock extends StatelessWidget {
  const WorldClock({
    super.key,
    required this.appRouter,
  });

  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(builder: (context, themeNotifier, child) {
      return MaterialApp(
        onGenerateRoute: (settings) => appRouter.onGenerateRoute(settings),
        debugShowCheckedModeBanner: false,
        themeMode: themeNotifier.getTheme(),
        theme: WorldClockThemeData.lightTheme,
        darkTheme: WorldClockThemeData.darkTheme,
        home: const HomePage(),
      );
    });
  }
}
