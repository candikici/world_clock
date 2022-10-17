import 'package:dop_case/constants/asset_paths.dart';
import 'package:dop_case/constants/colors.dart';
import 'package:dop_case/provider/app_state.dart';
import 'package:dop_case/provider/theme_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

import 'package:provider/provider.dart';

import '../widgets/timezone_list.dart';

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
      return Scaffold(
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
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.only(
                            left: 33, right: 33, top: 69, bottom: 45),
                        decoration: BoxDecoration(
                            color:
                                Theme.of(context).appBarTheme.backgroundColor,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(32),
                              bottomRight: Radius.circular(32),
                            )),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Günaydın, Özgür!",
                                  style: Theme.of(context).textTheme.headline2,
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  DateFormat("kk : mm").format(localTime),
                                  style: Theme.of(context).textTheme.headline1,
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  DateFormat("d MMMM, EEEE", "tr")
                                      .format(localTime),
                                  style: Theme.of(context).textTheme.headline2,
                                )
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                var currentBrightness =
                                    Theme.of(context).brightness;
                                var themeModeToSet =
                                    currentBrightness == Brightness.dark
                                        ? ThemeMode.light
                                        : ThemeMode.dark;
                                var themeNotifier = Provider.of<ThemeNotifier>(
                                    context,
                                    listen: false);
                                themeNotifier.setTheme(themeModeToSet);
                              },
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                    border: Border.all(
                                        strokeAlign: StrokeAlign.outside,
                                        width: 3,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary
                                            .withOpacity(0.2))),
                                child: SvgPicture.asset(
                                    Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? AssetPaths.sun
                                        : AssetPaths.moon),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        bottom: -22,
                        child: SizedBox(
                          height: 44,
                          width: MediaQuery.of(context).size.width - 66,
                          child: TextField(
                            cursorColor: WorldClockColors.strokeBlue,
                            style: Theme.of(context)
                                .inputDecorationTheme
                                .hintStyle,
                            controller: searchController,
                            onChanged: (key) => onSearchInputChange(key, app),
                            decoration: InputDecoration(
                              hintText: "Arama",
                              prefixIcon: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 12),
                                child: SvgPicture.asset(AssetPaths.search),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 42),
                  TimezoneList(timezoneList: timezoneSearchResults)
                ],
              ),
      );
    });
  }
}
