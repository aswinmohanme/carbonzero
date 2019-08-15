import 'package:carbon/services/calculator_api.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Calculator Api", () {
    test('get default values and results', () async {
      var defaults_and_results = await CalculatorApi.getDefaultsAndResults({
        "input_location": "06704",
        "input_location_mode": "1",
        "input_income": "1",
        "input_size": "3"
      });
      expect(defaults_and_results["response"]["input_location"]["\$t"], '6704');
      expect(defaults_and_results["response"]["input_size"]["\$t"], '3');
    });
  });
}
