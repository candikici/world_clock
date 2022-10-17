import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants/asset_paths.dart';
import '../../constants/routes.dart';

class TimezoneTile extends StatelessWidget {
  const TimezoneTile({
    Key? key,
    required this.timezone,
  }) : super(key: key);

  final String timezone;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed(
          WorldClockRoutes.singleTimezone,
          arguments: {"timezone": timezone}),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
        decoration: BoxDecoration(
            color: Theme.of(context).appBarTheme.backgroundColor,
            borderRadius: BorderRadius.circular(8)),
        child: Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  timezone,
                  style: Theme.of(context).textTheme.caption,
                )),
            Positioned(
              right: -32,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).appBarTheme.backgroundColor,
                    border: Border.all(
                        width: 3,
                        color: Theme.of(context).scaffoldBackgroundColor)),
                child: SvgPicture.asset(
                  AssetPaths.arrowRight,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
