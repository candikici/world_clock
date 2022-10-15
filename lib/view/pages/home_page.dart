import 'package:dop_case/provider/app_state.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

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
                    Expanded(
                      child: ListView.builder(
                        itemCount: app.timezones.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Text(app.timezones[index]);
                        },
                      ),
                    )
                  ],
                ),
        ),
      );
    });
  }
}
