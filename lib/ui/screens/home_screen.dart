import 'package:carbon/core/user_footprint/user_footprint_store.dart';
import 'package:carbon/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final user_footprint_store = locator<UserFootprintStore>();

  @override
  void initState() {
    super.initState();
    user_footprint_store.fetchDefaultBehaviours();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
