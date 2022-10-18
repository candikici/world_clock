import 'package:flutter/material.dart';

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
