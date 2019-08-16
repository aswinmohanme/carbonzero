import 'package:carbon/core/services/calculator_api.dart';
import 'package:mobx/mobx.dart';

part 'user_footprint_store.g.dart';

class UserFootprintStore = _UserFootprintStore with _$UserFootprintStore;

abstract class _UserFootprintStore with Store {
  @observable
  ObservableMap<String, dynamic> defaultBehaviours = emptyResponse;

  @observable
  bool isLoading = false;

  @computed
  bool get hasResults => defaultBehaviours != emptyResponse;

  @action
  fetchDefaultBehaviours() async {
    isLoading = true;
    final defaultBehavioursHashMap = await CalculatorApi.getDefaultsAndResults({
      "input_location": "06704",
      "input_location_mode": "1",
      "input_income": "1",
      "input_size": "3"
    });
    defaultBehaviours =
        ObservableMap.linkedHashMapFrom(defaultBehavioursHashMap);
    isLoading = false;
  }

  static ObservableMap<String, dynamic> emptyResponse =
      ObservableMap.linkedHashMapFrom({});
}
