import 'package:flutter/material.dart';

import '../../../constants/colors.dart';

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
