import 'package:carbon/ui/styles.dart';
import 'package:flutter/material.dart';

class Screen extends StatelessWidget {
  final Widget child;
  final bool isLoading;
  final String errorMessage;
  final Function errorRectifyAction;

  const Screen(
      {Key key,
      @required this.child,
      this.isLoading = false,
      this.errorMessage = "",
      this.errorRectifyAction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
