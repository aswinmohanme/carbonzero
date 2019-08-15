import 'package:carbon/core/user/user_store.dart';
import 'package:carbon/locator.dart';
import 'package:mobx/mobx.dart';

part 'root_store.g.dart';

class RootStore = _RootStore with _$RootStore;

abstract class _RootStore with Store {}
