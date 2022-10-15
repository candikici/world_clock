import 'package:dop_case/constants/colors.dart';
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
            color: WorldClockColors.lightBlue,
            borderRadius: BorderRadius.circular(8)),
        child: Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            Align(alignment: Alignment.centerLeft, child: Text(timezone)),
            Positioned(
              right: -32,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: WorldClockColors.lightBlue,
                    border: Border.all(width: 3, color: Colors.white)),
                child: SvgPicture.asset(AssetPaths.arrowRight),
              ),
            ),
          ],
        ),
      ),
    );
  }
}