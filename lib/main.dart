import 'package:dop_case/constants/colors.dart';
import 'package:dop_case/constants/theme_data.dart';
import 'package:dop_case/provider/theme_notifier.dart';
import 'package:dop_case/services/http/http_service.dart';
import 'package:dop_case/utilities/router.dart';
import 'package:dop_case/view/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';

import 'provider/app_state.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  final HttpService httpService = HttpService();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<AppState>(
        create: (context) => AppState(httpService: httpService),
      ),
      ChangeNotifierProvider<ThemeNotifier>(
        create: (context) => ThemeNotifier(ThemeMode.system),
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
