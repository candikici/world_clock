import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants/asset_paths.dart';

class ThemeSelectionWidget extends StatelessWidget {
  const ThemeSelectionWidget({
    Key? key,
    required this.themeSelection,
  }) : super(key: key);

  final VoidCallback themeSelection;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: themeSelection,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Theme.of(context).colorScheme.secondary,
            border: Border.all(
                strokeAlign: StrokeAlign.outside,
                width: 3,
                color:
                    Theme.of(context).colorScheme.secondary.withOpacity(0.2))),
        child: SvgPicture.asset(Theme.of(context).brightness == Brightness.dark
            ? AssetPaths.sun
            : AssetPaths.moon),
      ),
    );
  }
}
