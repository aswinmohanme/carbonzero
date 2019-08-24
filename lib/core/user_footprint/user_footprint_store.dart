import 'dart:convert';

import 'package:carbon/core/services/data_service.dart';
import 'package:carbon/core/user_footprint/action_footprint.dart';
import 'package:mobx/mobx.dart';

part 'user_footprint_store.g.dart';

class UserFootprintStore = _UserFootprintStore with _$UserFootprintStore;

abstract class _UserFootprintStore with Store {
  @observable
  ObservableMap<String, dynamic> behaviours = emptyResponse;
  @observable
  ObservableMap<String, dynamic> results = emptyResponse;
  @observable
  List<ActionFootprint> actionFootprints = [];

  @observable
  String errorMessage = "";
  @observable
  bool isLoading = true;

  @computed
  bool get hasBehaviours => behaviours != emptyResponse;
  @computed
  bool get hasResults => results != emptyResponse;
  @computed
  bool get hasErrorOccured => errorMessage.isNotEmpty;

  @computed
  get actionsFootprintReduction =>
      hasResults ? json.decode(results["result_takeaction_pounds"]) : [];
  @computed
  double get currentFootprint =>
      hasResults ? double.parse(results["result_grand_total"]) : 0.0;
  @computed
  get actionsSortedByPotential => actionFootprints
    ..sort((a, b) =>
        b.footprintReductionPotential.compareTo(a.footprintReductionPotential))
    ..reversed;

  @action
  fetchBehaviours() async {
    final behavioursHashMap =
        await DataService.getDefaultResultsForDefaultLocation();
    behaviours = ObservableMap.linkedHashMapFrom(behavioursHashMap);
  }

  @action
  fetchResults() async {
    if (hasResults) return;
    isLoading = true;
    errorMessage = "";

    try {
      if (!hasBehaviours) await fetchBehaviours();
      final resultsHashMap = await DataService.getResults(behaviours);
      results = ObservableMap.linkedHashMapFrom(resultsHashMap);
      final actionFootprintsRaw =
          await DataService.getActionDefinitionsFromJson(
              actionsFootprintReduction);
      actionFootprints = actionFootprintsRaw
          .map<ActionFootprint>(
              (action) => ActionFootprint.fromJson({...action}))
          .toList();
    } catch (error) {
      print(error);
      errorMessage = "A network error occured, please check your connection";
    }
    isLoading = false;
  }

  static ObservableMap<String, dynamic> emptyResponse =
      ObservableMap.linkedHashMapFrom({});
}
