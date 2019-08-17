import 'package:carbon/core/services/coolclimate_api.dart';

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
    return defaultBehavioursResponse["responses"];
  }
}
