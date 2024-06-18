// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tv_translations_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TvTranslationsController on _TvTranslationsControllerBase, Store {
  Computed<bool>? _$isLoadingComputed;

  @override
  bool get isLoading =>
      (_$isLoadingComputed ??= Computed<bool>(() => super.isLoading,
              name: '_TvTranslationsControllerBase.isLoading'))
          .value;
  Computed<bool>? _$isErrorComputed;

  @override
  bool get isError => (_$isErrorComputed ??= Computed<bool>(() => super.isError,
          name: '_TvTranslationsControllerBase.isError'))
      .value;

  late final _$channelsFutureAtom = Atom(
      name: '_TvTranslationsControllerBase.channelsFuture', context: context);

  @override
  ObservableFuture<List<ChannelDto>?> get channelsFuture {
    _$channelsFutureAtom.reportRead();
    return super.channelsFuture;
  }

  @override
  set channelsFuture(ObservableFuture<List<ChannelDto>?> value) {
    _$channelsFutureAtom.reportWrite(value, super.channelsFuture, () {
      super.channelsFuture = value;
    });
  }

  late final _$channelsWithUrlsAtom = Atom(
      name: '_TvTranslationsControllerBase.channelsWithUrls', context: context);

  @override
  ObservableList<ChannelDtoWithUrls> get channelsWithUrls {
    _$channelsWithUrlsAtom.reportRead();
    return super.channelsWithUrls;
  }

  @override
  set channelsWithUrls(ObservableList<ChannelDtoWithUrls> value) {
    _$channelsWithUrlsAtom.reportWrite(value, super.channelsWithUrls, () {
      super.channelsWithUrls = value;
    });
  }

  late final _$_TvTranslationsControllerBaseActionController =
      ActionController(name: '_TvTranslationsControllerBase', context: context);

  @override
  void fetchChannels() {
    final _$actionInfo = _$_TvTranslationsControllerBaseActionController
        .startAction(name: '_TvTranslationsControllerBase.fetchChannels');
    try {
      return super.fetchChannels();
    } finally {
      _$_TvTranslationsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void findUrlsById(List<ChannelDto?>? channels) {
    final _$actionInfo = _$_TvTranslationsControllerBaseActionController
        .startAction(name: '_TvTranslationsControllerBase.findUrlsById');
    try {
      return super.findUrlsById(channels);
    } finally {
      _$_TvTranslationsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
channelsFuture: ${channelsFuture},
channelsWithUrls: ${channelsWithUrls},
isLoading: ${isLoading},
isError: ${isError}
    ''';
  }
}
