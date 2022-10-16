import 'package:dop_case/constants/asset_paths.dart';
import 'package:dop_case/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
  @override
  void initState() {
    getSelectedTimezone();
    super.initState();
  }

  getSelectedTimezone() async {
    changeLoading();
    var app = Provider.of<AppState>(context, listen: false);
    await app.getSingleTimezone(zone: widget.timezone);

    changeLoading();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SvgPicture.asset(AssetPaths.worldTime),
        toolbarHeight: 111,
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(32),
              bottomRight: Radius.circular(32)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 33, right: 33, top: 50),
        child: Column(
          children: [
            TimeWidget(time: DateTime.now()),
            const SizedBox(height: 28),
            Text(
              "Abidjan",
              style: Theme.of(context).textTheme.headline4,
            ),
            Text(
              "Africa",
              style: Theme.of(context).textTheme.headline5,
            ),
            const SizedBox(height: 10),
            Text(
              "Çarşamba,  GMT +01:00",
              style: Theme.of(context).textTheme.headline6,
            ),
            Text(
              "Haziran 8, 2022",
              style: Theme.of(context).textTheme.headline6,
            ),
          ],
        ),
      ),
    );
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
        TimeItemWidget(item: time.hour.toString()),
        const SizedBox(width: 10),
        const ColonWidget(),
        const SizedBox(width: 10),
        TimeItemWidget(item: time.minute.toString()),
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
