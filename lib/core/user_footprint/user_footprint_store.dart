import 'package:carbon/core/services/api_service.dart';
import 'package:mobx/mobx.dart';

part 'user_footprint_store.g.dart';

class UserFootprintStore = _UserFootprintStore with _$UserFootprintStore;

abstract class _UserFootprintStore with Store {
  @observable
  ObservableMap<String, dynamic> defaultBehaviours = emptyResponse;
  @observable
  ObservableMap<String, dynamic> results = emptyResponse;

  @observable
  String errorMessage = "";
  @observable
  bool isLoading = false;

  @computed
  bool get hasDefaultBehaviours => defaultBehaviours != emptyResponse;
  @computed
  bool get hasResults => results != emptyResponse;
  @computed
  bool get hasErrorOccured => errorMessage.isNotEmpty;

  @computed
  get currentFootprint {
    return hasResults ? results["result_grand_total"] : "-1.0";
  }

  @action
  fetchDefaultBehaviours() async {
    isLoading = true;
    try {
      final defaultBehavioursHashMap =
          await ApiService.getDefaultResultsForDefaultLocation();
      defaultBehaviours =
          ObservableMap.linkedHashMapFrom(defaultBehavioursHashMap);
    } catch (error) {
      errorMessage = "A network error occured, please check your connection";
    }
    isLoading = false;
  }

  @action
  fetchResults() async {
    isLoading = true;
    if (!hasDefaultBehaviours) await fetchDefaultBehaviours();
    try {
      final resultsHashMap = await ApiService.getResults(defaultBehaviours);
      results = ObservableMap.linkedHashMapFrom(resultsHashMap);
    } catch (error) {
      errorMessage = "A network error occured, please check your connection";
    }
    isLoading = false;
  }

  static ObservableMap<String, dynamic> emptyResponse =
      ObservableMap.linkedHashMapFrom({});
}
