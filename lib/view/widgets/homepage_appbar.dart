import 'package:dop_case/view/widgets/local_timezone_widget.dart';
import 'package:dop_case/view/widgets/theme_selection_widget.dart';
import 'package:flutter/material.dart';

class HomepageAppbar extends StatelessWidget {
  const HomepageAppbar({
    Key? key,
    required this.localTime,
    required this.themeSelection,
  }) : super(key: key);

  final DateTime localTime;
  final VoidCallback themeSelection;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(left: 33, right: 33, top: 69, bottom: 45),
      decoration: BoxDecoration(
          color: Theme.of(context).appBarTheme.backgroundColor,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(32),
            bottomRight: Radius.circular(32),
          )),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          LocalTimezoneWidget(localTime: localTime),
          ThemeSelectionWidget(themeSelection: themeSelection),
        ],
      ),
    );
  }
}
