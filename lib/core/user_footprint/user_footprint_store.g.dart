// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_footprint_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars

mixin _$UserFootprintStore on _UserFootprintStore, Store {
  Computed<bool> _$hasResultsComputed;

  @override
  bool get hasResults =>
      (_$hasResultsComputed ??= Computed<bool>(() => super.hasResults)).value;

  final _$defaultBehavioursAtom =
      Atom(name: '_UserFootprintStore.defaultBehaviours');

  @override
  ObservableMap<String, dynamic> get defaultBehaviours {
    _$defaultBehavioursAtom.context.enforceReadPolicy(_$defaultBehavioursAtom);
    _$defaultBehavioursAtom.reportObserved();
    return super.defaultBehaviours;
  }

  @override
  set defaultBehaviours(ObservableMap<String, dynamic> value) {
    _$defaultBehavioursAtom.context.conditionallyRunInAction(() {
      super.defaultBehaviours = value;
      _$defaultBehavioursAtom.reportChanged();
    }, _$defaultBehavioursAtom, name: '${_$defaultBehavioursAtom.name}_set');
  }

  final _$isLoadingAtom = Atom(name: '_UserFootprintStore.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.context.enforceReadPolicy(_$isLoadingAtom);
    _$isLoadingAtom.reportObserved();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.context.conditionallyRunInAction(() {
      super.isLoading = value;
      _$isLoadingAtom.reportChanged();
    }, _$isLoadingAtom, name: '${_$isLoadingAtom.name}_set');
  }

  final _$fetchDefaultBehavioursAsyncAction =
      AsyncAction('fetchDefaultBehaviours');

  @override
  Future fetchDefaultBehaviours() {
    return _$fetchDefaultBehavioursAsyncAction
        .run(() => super.fetchDefaultBehaviours());
  }
}
