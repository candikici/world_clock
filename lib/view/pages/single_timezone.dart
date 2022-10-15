import 'package:flutter/material.dart';

class SingleTimezone extends StatefulWidget {
  const SingleTimezone({super.key, required this.timezone});
  final String timezone;
  @override
  State<SingleTimezone> createState() => _SingleTimezoneState();
}

class _SingleTimezoneState extends State<SingleTimezone> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
