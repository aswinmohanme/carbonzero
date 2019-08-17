import 'package:carbon/core/services/api_service.dart';
import 'package:mobx/mobx.dart';

part 'user_footprint_store.g.dart';

class UserFootprintStore = _UserFootprintStore with _$UserFootprintStore;

abstract class _UserFootprintStore with Store {
  @observable
  ObservableMap<String, dynamic> defaultBehaviours = emptyResponse;
  @observable
  String errorMessage = "";
  @observable
  bool isLoading = false;

  @computed
  bool get hasResults => defaultBehaviours != emptyResponse;
  @computed
  bool get hasErrorOccured => errorMessage.isNotEmpty;

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

  static ObservableMap<String, dynamic> emptyResponse =
      ObservableMap.linkedHashMapFrom({});
}
