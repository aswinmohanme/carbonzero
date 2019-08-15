import 'package:http/http.dart' as http;

class CalculatorApi {
  static const String BASE_URL = 'coolclimate.berkeley.edu';
  static const String API_URL = '/calculators/household/api.php';

  static const String APP_TOKEN = 'DPP6zZDkSQAlRKfQ-iWgdg';

  static var _httpClient = new http.Client();

  static getDefaultsAndResults(location) async {
    var uri = new Uri.https(
        BASE_URL, API_URL, {"op": "get_defaults_and_results", ...location});
    var response = await _httpClient.get(uri,
        headers: {"X-DEV-TOKEN": APP_TOKEN, "Accept": "applicaton/xml"});
    print(response.body);
  }
}
