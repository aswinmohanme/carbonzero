import 'dart:convert';

import 'package:carbon/core/services/climate_news_api.dart';
import 'package:carbon/core/services/coolclimate_api.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:mobx/mobx.dart';

class DataService {
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

  static getActionDefinitionsFromJson(
      Map<String, dynamic> footprintReductionPotential) async {
    var actionDefinitions =
        await rootBundle.loadString('assets/data/actions_definition.json');
    Map<String, dynamic> actionsDefinitionsJson =
        await json.decode(actionDefinitions);
    return actionsDefinitionsJson.entries
        .map((action) => {
              "key": action.key,
              ...action.value,
              "footprint_reduction_potential":
                  footprintReductionPotential[action.key]
            })
        .toList();
  }

  // Climate News
  static getClimateNews() async {
    return await ClimateNewsApi.getLatestClimateNews();
  }
}
