// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_footprint_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars

mixin _$UserFootprintStore on _UserFootprintStore, Store {
  Computed<bool> _$hasBehavioursComputed;

  @override
  bool get hasBehaviours =>
      (_$hasBehavioursComputed ??= Computed<bool>(() => super.hasBehaviours))
          .value;
  Computed<bool> _$hasResultsComputed;

  @override
  bool get hasResults =>
      (_$hasResultsComputed ??= Computed<bool>(() => super.hasResults)).value;
  Computed<bool> _$hasErrorOccuredComputed;

  @override
  bool get hasErrorOccured => (_$hasErrorOccuredComputed ??=
          Computed<bool>(() => super.hasErrorOccured))
      .value;
  Computed<dynamic> _$actionsFootprintReductionComputed;

  @override
  dynamic get actionsFootprintReduction =>
      (_$actionsFootprintReductionComputed ??=
              Computed<dynamic>(() => super.actionsFootprintReduction))
          .value;
  Computed<dynamic> _$currentFootprintComputed;

  @override
  dynamic get currentFootprint => (_$currentFootprintComputed ??=
          Computed<dynamic>(() => super.currentFootprint))
      .value;

  final _$behavioursAtom = Atom(name: '_UserFootprintStore.behaviours');

  @override
  ObservableMap<String, dynamic> get behaviours {
    _$behavioursAtom.context.enforceReadPolicy(_$behavioursAtom);
    _$behavioursAtom.reportObserved();
    return super.behaviours;
  }

  @override
  set behaviours(ObservableMap<String, dynamic> value) {
    _$behavioursAtom.context.conditionallyRunInAction(() {
      super.behaviours = value;
      _$behavioursAtom.reportChanged();
    }, _$behavioursAtom, name: '${_$behavioursAtom.name}_set');
  }

  final _$resultsAtom = Atom(name: '_UserFootprintStore.results');

  @override
  ObservableMap<String, dynamic> get results {
    _$resultsAtom.context.enforceReadPolicy(_$resultsAtom);
    _$resultsAtom.reportObserved();
    return super.results;
  }

  @override
  set results(ObservableMap<String, dynamic> value) {
    _$resultsAtom.context.conditionallyRunInAction(() {
      super.results = value;
      _$resultsAtom.reportChanged();
    }, _$resultsAtom, name: '${_$resultsAtom.name}_set');
  }

  final _$actionFootprintsAtom =
      Atom(name: '_UserFootprintStore.actionFootprints');

  @override
  List<ActionFootprint> get actionFootprints {
    _$actionFootprintsAtom.context.enforceReadPolicy(_$actionFootprintsAtom);
    _$actionFootprintsAtom.reportObserved();
    return super.actionFootprints;
  }

  @override
  set actionFootprints(List<ActionFootprint> value) {
    _$actionFootprintsAtom.context.conditionallyRunInAction(() {
      super.actionFootprints = value;
      _$actionFootprintsAtom.reportChanged();
    }, _$actionFootprintsAtom, name: '${_$actionFootprintsAtom.name}_set');
  }

  final _$errorMessageAtom = Atom(name: '_UserFootprintStore.errorMessage');

  @override
  String get errorMessage {
    _$errorMessageAtom.context.enforceReadPolicy(_$errorMessageAtom);
    _$errorMessageAtom.reportObserved();
    return super.errorMessage;
  }

  @override
  set errorMessage(String value) {
    _$errorMessageAtom.context.conditionallyRunInAction(() {
      super.errorMessage = value;
      _$errorMessageAtom.reportChanged();
    }, _$errorMessageAtom, name: '${_$errorMessageAtom.name}_set');
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

  final _$fetchBehavioursAsyncAction = AsyncAction('fetchBehaviours');

  @override
  Future fetchBehaviours() {
    return _$fetchBehavioursAsyncAction.run(() => super.fetchBehaviours());
  }

  final _$fetchResultsAsyncAction = AsyncAction('fetchResults');

  @override
  Future fetchResults() {
    return _$fetchResultsAsyncAction.run(() => super.fetchResults());
  }
}
