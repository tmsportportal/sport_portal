// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tv_channel_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TvChannelController on _TvChannelControllerBase, Store {
  Computed<bool>? _$isLoadingComputed;

  @override
  bool get isLoading =>
      (_$isLoadingComputed ??= Computed<bool>(() => super.isLoading,
              name: '_TvChannelControllerBase.isLoading'))
          .value;
  Computed<bool>? _$isErrorComputed;

  @override
  bool get isError => (_$isErrorComputed ??= Computed<bool>(() => super.isError,
          name: '_TvChannelControllerBase.isError'))
      .value;

  late final _$channelResponseAtom =
      Atom(name: '_TvChannelControllerBase.channelResponse', context: context);

  @override
  ObservableFuture<List<StreamDto>?> get channelResponse {
    _$channelResponseAtom.reportRead();
    return super.channelResponse;
  }

  @override
  set channelResponse(ObservableFuture<List<StreamDto>?> value) {
    _$channelResponseAtom.reportWrite(value, super.channelResponse, () {
      super.channelResponse = value;
    });
  }

  late final _$_TvChannelControllerBaseActionController =
      ActionController(name: '_TvChannelControllerBase', context: context);

  @override
  void getStreams() {
    final _$actionInfo = _$_TvChannelControllerBaseActionController.startAction(
        name: '_TvChannelControllerBase.getStreams');
    try {
      return super.getStreams();
    } finally {
      _$_TvChannelControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _addToList(String? name, StreamDto stream) {
    final _$actionInfo = _$_TvChannelControllerBaseActionController.startAction(
        name: '_TvChannelControllerBase._addToList');
    try {
      return super._addToList(name, stream);
    } finally {
      _$_TvChannelControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
channelResponse: ${channelResponse},
isLoading: ${isLoading},
isError: ${isError}
    ''';
  }
}
