import 'dart:developer';

import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:sport_portal/src/features/tv_translations/data/dto/channel_dto.dart';
import 'package:sport_portal/src/features/tv_translations/data/repository/tv_translations_repository.dart';

import '../../tv_channel/data/dummy_data/streams.dart';

part 'tv_translations_controller.g.dart';

class TvTranslationsController = _TvTranslationsControllerBase
    with _$TvTranslationsController;

abstract class _TvTranslationsControllerBase with Store {
  final _repository = GetIt.instance<TvTranslationsRepository>();

  @observable
  var channelsFuture = ObservableFuture<List<ChannelDto>?>.value(null);

  @computed
  bool get isLoading => channelsFuture.status == FutureStatus.pending;

  @computed
  bool get isError => channelsFuture.status == FutureStatus.rejected;

  @observable
  var channelsWithUrls = ObservableList<ChannelDtoWithUrls>();

  static const _streams = Streams.streams;

  @action
  void fetchChannels() {
    try {
      final future = _repository.fetchChannels();
      channelsFuture = ObservableFuture(future).then((value) {
        findUrlsById(value);
        return value;
      }).catchError((e) {
        channelsFuture = ObservableFuture.error(e);
        log(e.toString());
        return;
      });
    } on Exception catch (e) {
      channelsFuture = ObservableFuture.error(e);
      log(e.toString());
    }
  }

  @action
  void findUrlsById(List<ChannelDto?>? channels) {
    channelsWithUrls.clear();

    for (final el in channels ?? <ChannelDto?>[]) {
      final urls = <String?>[];

      final streamsWithUrls =
          _streams.where((element) => element['channel'] == el?.id);
      for (final element in streamsWithUrls) {
        urls.add(element['url']);
      }
      if (urls.isNotEmpty) {
        final channel = ChannelDtoWithUrls(
          id: el?.id,
          name: el?.name,
          logo: el?.logo,
          country: el?.country,
          city: el?.city,
          urls: urls,
        );
        channelsWithUrls.add(channel);
      }
    }
  }
}
