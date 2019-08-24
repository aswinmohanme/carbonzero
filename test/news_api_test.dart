import 'package:carbon/core/services/climate_news_api.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:webfeed/domain/rss_feed.dart';

void main() {
  group("News", () {
    test('get latest news feed', () async {
      var xmlResponse = await ClimateNewsApi.getLatestClimateNews();
      var rssFeed = RssFeed.parse(xmlResponse);
      expect(rssFeed.title, "\"global warming\" - Google News");
    });
  });
}
