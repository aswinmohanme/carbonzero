import 'package:carbon/core/root_store.dart';
import 'package:carbon/core/user_footprint/user_footprint_store.dart';
import 'package:get_it/get_it.dart';

import 'core/climate_news/climate_news_store.dart';

GetIt locator = GetIt();

void setupLocator() {
  locator.registerLazySingleton(() => RootStore());

  locator.registerLazySingleton(() => UserFootprintStore());
  locator.registerLazySingleton(() => ClimateNewsStore());
}
