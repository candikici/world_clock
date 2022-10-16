import 'package:dop_case/constants/colors.dart';
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
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light));
  runApp(WorldClock(appRouter: AppRouter()));
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
    final HttpService httpService = HttpService();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AppState>(
          create: (context) => AppState(httpService: httpService),
        ),
      ],
      child: MaterialApp(
        onGenerateRoute: (settings) => appRouter.onGenerateRoute(settings),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: WorldClockColors.lightBG,
          fontFamily: GoogleFonts.montserrat().fontFamily,
          inputDecorationTheme: InputDecorationTheme(
              fillColor: Colors.white,
              filled: true,
              contentPadding: const EdgeInsets.symmetric(vertical: 14.5),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(99),
                borderSide:
                    const BorderSide(color: WorldClockColors.strokeBlue),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(99),
                borderSide:
                    const BorderSide(color: WorldClockColors.strokeBlue),
              ),
              hintStyle: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w300,
              )),
          textTheme: const TextTheme(
            headline1: TextStyle(
                color: WorldClockColors.dark,
                fontSize: 32,
                fontWeight: FontWeight.w600),
            headline2: TextStyle(
                color: WorldClockColors.dark,
                fontSize: 15,
                fontWeight: FontWeight.w600),
            caption: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: WorldClockColors.dark,
            ),
            headline3: TextStyle(
              fontSize: 79,
              fontWeight: FontWeight.w600,
              color: WorldClockColors.dark,
            ),
            headline4: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: WorldClockColors.dark,
            ),
            headline5: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: WorldClockColors.dark,
            ),
            headline6: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: WorldClockColors.dark,
            ),
          ),
        ),
        home: const HomePage(),
      ),
    );
  }
}
