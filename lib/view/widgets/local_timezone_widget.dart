import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class LocalTimezoneWidget extends StatelessWidget {
  const LocalTimezoneWidget({
    Key? key,
    required this.localTime,
  }) : super(key: key);

  final DateTime localTime;

  @override
  Widget build(BuildContext context) {
    return Column(
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
          DateFormat("d MMMM, EEEE", "tr").format(localTime),
          style: Theme.of(context).textTheme.headline2,
        )
      ],
    );
  }
}
