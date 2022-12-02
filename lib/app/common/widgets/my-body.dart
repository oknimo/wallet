// ignore_for_file: file_names

import 'package:flutter/material.dart';

class MyBody extends StatelessWidget {
  const MyBody({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: child,
    );
  }
}
