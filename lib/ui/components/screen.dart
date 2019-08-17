import 'package:carbon/ui/styles.dart';
import 'package:flutter/material.dart';

class Screen extends StatelessWidget {
  final child;

  const Screen({Key key, @required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(s_6),
          child: this.child,
        ),
      ),
    );
  }
}
