import 'package:dop_case/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants/asset_paths.dart';

class SearchInput extends StatelessWidget {
  const SearchInput({
    Key? key,
    required this.onSearchChanged,
    required this.searchController,
  }) : super(key: key);

  final TextEditingController searchController;
  final Function(String)? onSearchChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,
      width: MediaQuery.of(context).size.width - 66,
      child: TextField(
        cursorColor: Theme.of(context).brightness == Brightness.dark
            ? WorldClockColors.dark2
            : WorldClockColors.strokeBlue,
        style: Theme.of(context).inputDecorationTheme.hintStyle,
        controller: searchController,
        onChanged: onSearchChanged,
        decoration: InputDecoration(
          hintText: "Arama",
          prefixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
            child: SvgPicture.asset(AssetPaths.search),
          ),
        ),
      ),
    );
  }
}
