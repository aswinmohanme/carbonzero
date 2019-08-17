import 'package:carbon/core/services/coolclimate_api.dart';
import 'package:mobx/src/api/observable_collections.dart';

class ApiService {
  static Future<Map<String, dynamic>>
      getDefaultResultsForDefaultLocation() async {
    final defaultBehavioursResponse =
        await CoolClimateApi.getDefaultsAndResults({
      "input_location": "06704",
      "input_location_mode": "1",
      "input_income": "1",
      "input_size": "3"
    });
    return defaultBehavioursResponse["response"];
  }

  static getResults(ObservableMap<String, dynamic> behaviours) async {
    final resultsResponse = await CoolClimateApi.computeFootprint(behaviours);
    return resultsResponse["response"];
  }
}
