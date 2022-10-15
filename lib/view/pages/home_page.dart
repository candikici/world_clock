import 'dart:developer';

import 'package:dop_case/constants/asset_paths.dart';
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
    changeLoading();
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
                    TimezoneList(timezoneList: app.timezones)
                  ],
                ),
        ),
      );
    });
  }
}
