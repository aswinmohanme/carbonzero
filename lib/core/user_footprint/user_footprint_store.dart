import 'package:carbon/core/services/api_service.dart';
import 'package:mobx/mobx.dart';

part 'user_footprint_store.g.dart';

class UserFootprintStore = _UserFootprintStore with _$UserFootprintStore;

abstract class _UserFootprintStore with Store {
  @observable
  ObservableMap<String, dynamic> behaviours = emptyResponse;
  @observable
  ObservableMap<String, dynamic> results = emptyResponse;

  @observable
  String errorMessage = "";
  @observable
  bool isLoading = false;

  @computed
  bool get hasBehaviours => behaviours != emptyResponse;
  @computed
  bool get hasResults => results != emptyResponse;
  @computed
  bool get hasErrorOccured => errorMessage.isNotEmpty;

  @computed
  get currentFootprint => results["result_grand_total"];

  @action
  fetchBehaviours() async {
    final behavioursHashMap =
        await ApiService.getDefaultResultsForDefaultLocation();
    behaviours = ObservableMap.linkedHashMapFrom(behavioursHashMap);
  }

  @action
  fetchResults() async {
    isLoading = true;
    try {
      if (!hasBehaviours) await fetchBehaviours();
      final resultsHashMap = await ApiService.getResults(behaviours);
      results = ObservableMap.linkedHashMapFrom(resultsHashMap);
    } catch (error) {
      errorMessage = "A network error occured, please check your connection";
    }
    isLoading = false;
  }

  static ObservableMap<String, dynamic> emptyResponse =
      ObservableMap.linkedHashMapFrom({});
}
