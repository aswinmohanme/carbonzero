import 'package:carbon/ui/styles.dart';
import 'package:flutter/material.dart';
import 'package:typicons_flutter/typicons.dart';

class Screen extends StatelessWidget {
  final Widget child;
  final bool isLoading;
  final String errorMessage;
  final Function errorRectifyAction;
  final int screenIndex;

  const Screen(
      {Key key,
      @required this.child,
      this.isLoading = false,
      this.errorMessage = "",
      this.errorRectifyAction,
      this.screenIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: screenIndex,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Theme.of(context).backgroundColor,
        unselectedItemColor: Theme.of(context).backgroundColor,
        showSelectedLabels: false,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Typicons.news),
              title: Padding(
                padding: const EdgeInsets.all(s_1),
                child: Text("Feed"),
              )),
          BottomNavigationBarItem(
              icon: Icon(Typicons.compass),
              title: Padding(
                padding: const EdgeInsets.all(s_1),
                child: Text("Home"),
              )),
          BottomNavigationBarItem(
              icon: Icon(Typicons.user_outline),
              title: Padding(
                padding: const EdgeInsets.all(s_1),
                child: Text("Profile"),
              )),
        ],
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(s_8),
          child: this.errorMessage.isEmpty
              ? (this.isLoading
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : this.child)
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(errorMessage),
                    Container(
                      padding: EdgeInsets.only(top: s_4),
                      child: MaterialButton(
                        onPressed: () {
                          this.errorRectifyAction();
                        },
                        color: Theme.of(context).primaryColor,
                        textColor: Theme.of(context).backgroundColor,
                        child: Text("Reload"),
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
