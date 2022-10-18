import 'package:dop_case/view/widgets/time/dot_widget.dart';
import 'package:flutter/material.dart';

class ColonWidget extends StatelessWidget {
  const ColonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [DotWidget(), SizedBox(height: 16), DotWidget()],
    );
  }
}
