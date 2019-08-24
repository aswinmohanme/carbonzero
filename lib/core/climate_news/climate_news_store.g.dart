// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'climate_news_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars

mixin _$ClimateNewsStore on _ClimateNewsStore, Store {
  Computed<dynamic> _$newsItemsComputed;

  @override
  dynamic get newsItems =>
      (_$newsItemsComputed ??= Computed<dynamic>(() => super.newsItems)).value;
  Computed<dynamic> _$hasNewsComputed;

  @override
  dynamic get hasNews =>
      (_$hasNewsComputed ??= Computed<dynamic>(() => super.hasNews)).value;

  final _$isLoadingAtom = Atom(name: '_ClimateNewsStore.isLoading');

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

  final _$errorMessageAtom = Atom(name: '_ClimateNewsStore.errorMessage');

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

  final _$_rssFeedAtom = Atom(name: '_ClimateNewsStore._rssFeed');

  @override
  RssFeed get _rssFeed {
    _$_rssFeedAtom.context.enforceReadPolicy(_$_rssFeedAtom);
    _$_rssFeedAtom.reportObserved();
    return super._rssFeed;
  }

  @override
  set _rssFeed(RssFeed value) {
    _$_rssFeedAtom.context.conditionallyRunInAction(() {
      super._rssFeed = value;
      _$_rssFeedAtom.reportChanged();
    }, _$_rssFeedAtom, name: '${_$_rssFeedAtom.name}_set');
  }

  final _$fetchNewsRssAsyncAction = AsyncAction('fetchNewsRss');

  @override
  Future fetchNewsRss() {
    return _$fetchNewsRssAsyncAction.run(() => super.fetchNewsRss());
  }
}
