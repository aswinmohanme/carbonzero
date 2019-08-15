import 'package:carbon/services/calculator_api.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Calculator Api", () {
    test('get default values and results', () async {
      await CalculatorApi.getDefaultsAndResults({
        "input_location": "06704",
        "input_location_mode": "1",
        "input_income": "1",
        "input_size": "3"
      });
    });
  });
}
