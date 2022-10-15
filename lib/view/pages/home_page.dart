import 'dart:developer';

import 'package:dop_case/constants/asset_paths.dart';
import 'package:dop_case/constants/colors.dart';
import 'package:dop_case/constants/routes.dart';
import 'package:dop_case/main.dart';
import 'package:dop_case/provider/app_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
    await app.getSingleTimezone();
    await app.getTimezoneList();
    timezoneSearchResults = app.timezones;
    changeLoading();
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
      return SafeArea(
        child: Scaffold(
          body: isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  children: [
                    Text(app.localTimezone?.timezone ?? "null"),
                    TextField(
                      controller: searchController,
                      onChanged: (key) => onSearchInputChange(key, app),
                      decoration: InputDecoration(
                        hintText: "Arama",
                        fillColor: Colors.white,
                        contentPadding:
                            const EdgeInsets.symmetric(vertical: 14.5),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(99),
                          borderSide: const BorderSide(
                              color: WorldClockColors.strokeBlue),
                        ),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 12),
                          child: SvgPicture.asset(AssetPaths.search),
                        ),
                      ),
                    ),
                    TimezoneList(timezoneList: timezoneSearchResults)
                  ],
                ),
        ),
      );
    });
  }
}
