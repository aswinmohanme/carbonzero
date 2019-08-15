import 'package:carbon/core/services/calculator_api.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Calculator Api", () {
    test('get default values and results', () async {
      var defaultsAndResults = await CalculatorApi.getDefaultsAndResults({
        "input_location": "06704",
        "input_location_mode": "1",
        "input_income": "1",
        "input_size": "3"
      });
      expect(defaultsAndResults["response"]["input_location"], '6704');
      expect(defaultsAndResults["response"]["input_size"], '3');
    });
    test('compute footprint of default values', () async {
      var defaultsAndResults = await CalculatorApi.getDefaultsAndResults({
        "input_location": "06704",
        "input_location_mode": "1",
        "input_income": "1",
        "input_size": "3"
      });
      var footprint =
          await CalculatorApi.computeFootprint(defaultsAndResults["response"]);
      expect(footprint["response"]["result_motor_vehicles_direct"], '8.268955');
      expect(footprint["response"]["result_grand_total"], '46.210312');
    });
  });
}
