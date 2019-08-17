import 'package:carbon/core/user_footprint/user_footprint_store.dart';
import 'package:carbon/locator.dart';
import 'package:carbon/ui/components/screen.dart';
import 'package:carbon/ui/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:charcode/ascii.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final userFootprintStore = locator<UserFootprintStore>();

  @override
  void initState() {
    super.initState();
    userFootprintStore.fetchResults();
  }

  @override
  Widget build(BuildContext context) {
    return Screen(
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(
                    "tons of CO2/year",
                    style: Theme.of(context).textTheme.caption,
                  ),
                  Container(
                    padding: EdgeInsets.only(top: s_1),
                    child: Observer(
                      builder: (BuildContext context) {
                        return Text(
                          userFootprintStore.currentFootprint,
                          style: Theme.of(context).textTheme.display3,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
