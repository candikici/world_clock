import 'package:dop_case/provider/app_state.dart';
import 'package:dop_case/provider/theme_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';
import '../widgets/homepage_appbar.dart';
import '../widgets/search_input.dart';
import '../widgets/timezone/timezone_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoading = false;
  changeLoading() => setState(() => isLoading = !isLoading);
  DateTime localTime = DateTime.now();
  TextEditingController searchController = TextEditingController();
  List<String> timezoneSearchResults = [];

  @override
  void initState() {
    getTimezones();
    super.initState();
  }

  getTimezones() async {
    changeLoading();
    var app = Provider.of<AppState>(context, listen: false);

    await app.getTimezoneList();
    timezoneSearchResults = app.timezones;
    changeLoading();
    FlutterNativeSplash.remove();
  }

  onSearchInputChange(String key, AppState app) {
    if (key.trim().isEmpty) {
      timezoneSearchResults = app.timezones;
    } else {
      timezoneSearchResults = app.timezones
          .where((element) => element.toLowerCase().contains(key.toLowerCase()))
          .toList();
    }
    setState(() {});
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(builder: (context, app, child) {
      return AnnotatedRegion<SystemUiOverlayStyle>(
        value: Theme.of(context).brightness == Brightness.dark
            ? SystemUiOverlayStyle.light
            : SystemUiOverlayStyle.dark,
        child: Scaffold(
          body: isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  children: [
                    Stack(
                      alignment: Alignment.bottomCenter,
                      clipBehavior: Clip.none,
                      children: [
                        HomepageAppbar(
                          localTime: localTime,
                          themeSelection: () => _themeSelection(context),
                        ),
                        Positioned(
                          bottom: -22,
                          child: SearchInput(
                            searchController: searchController,
                            onSearchChanged: (key) =>
                                onSearchInputChange(key, app),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 42),
                    TimezoneList(timezoneList: timezoneSearchResults)
                  ],
                ),
        ),
      );
    });
  }

  void _themeSelection(BuildContext context) {
    var currentBrightness = Theme.of(context).brightness;
    var themeModeToSet =
        currentBrightness == Brightness.dark ? ThemeMode.light : ThemeMode.dark;
    var themeNotifier = Provider.of<ThemeNotifier>(context, listen: false);
    themeNotifier.setTheme(themeModeToSet);
  }
}
