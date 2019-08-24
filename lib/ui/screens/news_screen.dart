import 'package:carbon/core/climate_news/climate_news_store.dart';
import 'package:carbon/locator.dart';
import 'package:carbon/ui/components/screen.dart';
import 'package:carbon/ui/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
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
                padding: EdgeInsets.only(bottom: s_4),
                child: Text(
                  "News",
                  style: textTheme.display2,
                ),
              ),
              Text(
                "Latest news on Global Warming and Climate Change, published by the global media and aggregated by Google",
                style: textTheme.subtitle,
              ),
              Expanded(
                child: Swiper(
                  layout: SwiperLayout.STACK,
                  itemHeight: 400,
                  itemWidth: 320,
                  itemCount: climateNewsStore.newsItems.length,
                  itemBuilder: (BuildContext context, int index) {
                    RssItem newsItem = climateNewsStore.newsItems[index];
                    return GestureDetector(
                      onTap: () async {
                        await launch(newsItem.link);
                      },
                      child: Card(
                        color: Theme.of(context).primaryColor,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: s_4, vertical: s_8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(newsItem.title,
                                      style: textTheme.display3.copyWith(
                                          color: Theme.of(context)
                                              .backgroundColor)),
                                  Container(
                                    margin: EdgeInsets.only(top: s_4),
                                    child: Text(
                                      newsItem.pubDate,
                                      style: textTheme.body1.copyWith(
                                          color: Theme.of(context)
                                              .backgroundColor),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                newsItem.link,
                                style: textTheme.subtitle.copyWith(
                                    color: Theme.of(context).backgroundColor),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
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
