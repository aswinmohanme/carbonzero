import 'package:carbon/core/root_store.dart';
import 'package:carbon/core/user/user_store.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt();

void setupLocator() {
  locator.registerLazySingleton(() => RootStore());

  locator.registerLazySingleton(() => UserStore());
}
