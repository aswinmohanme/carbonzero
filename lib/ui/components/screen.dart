import 'package:carbon/ui/styles.dart';
import 'package:flutter/material.dart';

class Screen extends StatelessWidget {
  final Widget child;
  final bool isLoading;

  const Screen({Key key, @required this.child, @required this.isLoading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(s_6),
          child: this.isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : this.child,
        ),
      ),
    );
  }
}
