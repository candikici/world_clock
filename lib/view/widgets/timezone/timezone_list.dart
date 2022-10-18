import 'package:dop_case/view/widgets/timezone/timezone_tile.dart';
import 'package:flutter/material.dart';

class TimezoneList extends StatelessWidget {
  const TimezoneList({
    Key? key,
    required this.timezoneList,
  }) : super(key: key);

  final List<String> timezoneList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        separatorBuilder: (_, __) => const SizedBox(height: 10),
        itemCount: timezoneList.length,
        padding: const EdgeInsets.only(left: 33, right: 33, bottom: 42),
        itemBuilder: (BuildContext context, int index) {
          var timezone = timezoneList[index];
          return TimezoneTile(timezone: timezone);
        },
      ),
    );
  }
}
