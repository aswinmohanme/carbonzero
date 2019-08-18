import 'package:carbon/core/user_footprint/user_footprint_store.dart';
import 'package:carbon/locator.dart';
import 'package:carbon/ui/components/screen.dart';
import 'package:carbon/ui/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

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
    var textTheme = Theme.of(context).textTheme;
    return Observer(
      builder: (BuildContext context) => Screen(
        isLoading: userFootprintStore.isLoading,
        errorMessage: userFootprintStore.errorMessage,
        errorRectifyAction: () {
          userFootprintStore.fetchResults();
        },
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                        style: textTheme.caption,
                      ),
                      Container(
                        padding: EdgeInsets.only(top: s_1),
                        child: Observer(
                          builder: (BuildContext context) {
                            return Text(
                              userFootprintStore.currentFootprint,
                              style: textTheme.display3,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: s_40),
                child: Center(
                  child: Text("A picture of earth will be here soon"),
                ),
              ),
              Text(
                "Actions",
                style: textTheme.display2,
              ),
              Container(
                margin: EdgeInsets.only(top: s_4),
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: userFootprintStore.actionFootprints.length,
                  itemBuilder: (BuildContext context, int index) {
                    var actionFootprint =
                        userFootprintStore.actionFootprints[index];
                    return Card(
                      elevation: 0,
                      margin:
                          EdgeInsets.symmetric(vertical: s_3, horizontal: s_1),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: s_5, horizontal: s_3),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    actionFootprint.label,
                                    style: textTheme.display1,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: s_1),
                                    child: Text(
                                      actionFootprint.fact,
                                      style: textTheme.subtitle,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(s_2),
                              child: Center(
                                child: Text(
                                    "- ${actionFootprint.footprint_reduction_potential.toString()}"),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
