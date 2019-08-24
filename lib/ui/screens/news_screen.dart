import 'package:carbon/core/climate_news/climate_news_store.dart';
import 'package:carbon/locator.dart';
import 'package:carbon/ui/components/screen.dart';
import 'package:carbon/ui/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webfeed/webfeed.dart';

class NewsScreen extends StatefulWidget {
  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  final climateNewsStore = locator<ClimateNewsStore>();

  @override
  void initState() {
    super.initState();
    climateNewsStore.fetchNewsRss();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Observer(
      builder: (BuildContext context) {
        return Screen(
          isLoading: climateNewsStore.isLoading,
          errorMessage: climateNewsStore.errorMessage,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(bottom: s_6),
                child: Text(
                  "News",
                  style: textTheme.display2,
                ),
              ),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: climateNewsStore.newsItems.length,
                  itemBuilder: (BuildContext context, int index) {
                    RssItem newsItem = climateNewsStore.newsItems[index];
                    return GestureDetector(
                      onTap: () async {
                        await launch(newsItem.link);
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: s_6),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(newsItem.title, style: textTheme.display1),
                            Container(
                              padding: EdgeInsets.only(top: s_1),
                              child: Text(
                                newsItem.link,
                                style: textTheme.subtitle,
                                overflow: TextOverflow.ellipsis,
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
        );
      },
    );
  }
}
