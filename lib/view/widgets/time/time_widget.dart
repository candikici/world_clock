import 'package:dop_case/view/widgets/time/colon_widget.dart';
import 'package:dop_case/view/widgets/time/time_item_widget.dart';
import 'package:flutter/material.dart';

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
