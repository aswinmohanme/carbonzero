import 'package:carbon/core/services/data_service.dart';
import 'package:mobx/mobx.dart';
import 'package:webfeed/domain/rss_feed.dart';

part 'climate_new_store.g.dart';

class ClimateNewsStore = _ClimateNewsStore with _$ClimateNewsStore;

abstract class _ClimateNewsStore with Store {
  @observable
  bool isLoading = false;
  @observable
  String errorMessage = "";

  @observable
  RssFeed _rssFeed;

  @action
  fetchNewsRss() async {
    isLoading = true;
    errorMessage = "";

    try {
      var newsXmlResponse = DataService.getClimateNews();
      _rssFeed = RssFeed.parse(newsXmlResponse);
    } catch (error) {
      print(error);
      errorMessage =
          "A network error occured while fetching the News, check if Global Warming didn't mess up the Internet.";
    }

    isLoading = false;
  }
}
