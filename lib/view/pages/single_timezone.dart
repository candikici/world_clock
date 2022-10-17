import 'package:dop_case/constants/asset_paths.dart';
import 'package:dop_case/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../provider/app_state.dart';

class SingleTimezone extends StatefulWidget {
  const SingleTimezone({super.key, required this.timezone});
  final String timezone;
  @override
  State<SingleTimezone> createState() => _SingleTimezoneState();
}

class _SingleTimezoneState extends State<SingleTimezone> {
  bool isLoading = false;
  changeLoading() => setState(() => isLoading = !isLoading);
  List<String> timezone = [];

  @override
  void initState() {
    getSelectedTimezone();
    super.initState();
  }

  getSelectedTimezone() async {
    changeLoading();

    var app = Provider.of<AppState>(context, listen: false);
    await app.getSingleTimezone(zone: widget.timezone);
    if (app.selectedTimezone != null) {
      timezone = app.selectedTimezone!.timezone.split("/");
    }
    changeLoading();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(builder: (context, app, child) {
      return Scaffold(
        appBar: AppBar(
          title: SvgPicture.asset(
            AssetPaths.worldTime,
            height: 16,
            width: 149,
            color: Theme.of(context).appBarTheme.iconTheme!.color,
          ),
          toolbarHeight: 111,
          centerTitle: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(32),
                bottomRight: Radius.circular(32)),
          ),
        ),
        body: isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : app.selectedTimezone == null
                ? Padding(
                    padding: const EdgeInsets.all(33),
                    child: Center(
                      child: Text(
                        "Seçtiğiniz saat dilimi alınamadı.",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    ),
                  )
                : Padding(
                    padding:
                        const EdgeInsets.only(left: 33, right: 33, top: 50),
                    child: Column(
                      children: [
                        TimeWidget(time: app.selectedTimezone!.datetime),
                        const SizedBox(height: 28),
                        Text(
                          timezone.last,
                          style: Theme.of(context).textTheme.headline4,
                        ),
                        Text(
                          timezone.first,
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "${DateFormat("EEEE", "tr").format(app.selectedTimezone!.datetime)},  GMT ${app.selectedTimezone!.utcOffset}",
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        Text(
                          DateFormat("MMMM d, yyyy", "tr")
                              .format(app.selectedTimezone!.datetime),
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ],
                    ),
                  ),
      );
    });
  }
}

class TimeWidget extends StatelessWidget {
  const TimeWidget({
    Key? key,
    required this.time,
  }) : super(key: key);

  final DateTime time;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TimeItemWidget(
            item: time.hour < 10
                ? "0${time.hour.toString()}"
                : time.hour.toString()),
        const SizedBox(width: 10),
        const ColonWidget(),
        const SizedBox(width: 10),
        TimeItemWidget(
            item: time.minute < 10
                ? "0${time.minute.toString()}"
                : time.minute.toString()),
      ],
    );
  }
}

class ColonWidget extends StatelessWidget {
  const ColonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [DotWidget(), SizedBox(height: 16), DotWidget()],
    );
  }
}

class DotWidget extends StatelessWidget {
  const DotWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 9,
      width: 9,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Theme.of(context).textTheme.headline3!.color),
    );
  }
}

class TimeItemWidget extends StatelessWidget {
  const TimeItemWidget({
    Key? key,
    required this.item,
  }) : super(key: key);

  final String item;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 22),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondaryContainer,
          border: Border.all(width: 2, color: WorldClockColors.dark),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Center(
            child: Text(
          item,
          style: Theme.of(context).textTheme.headline3,
        )),
      ),
    );
  }
}
