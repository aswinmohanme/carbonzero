import 'package:http/http.dart' as http;

class ClimateNewsApi {
  static const String BASE_URL =
      'https://news.google.com/rss/search?cf=all&pz=1&q=global+warming&hl=en-US&gl=US&ceid=US:en';

  static var _httpClient = new http.Client();

  static getLatestClimateNews() async {
    var xmlResponse = await _httpClient.get(BASE_URL);
    return xmlResponse.body;
  }
}
