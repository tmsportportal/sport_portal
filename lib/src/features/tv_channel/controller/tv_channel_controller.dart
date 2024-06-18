import 'package:mobx/mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:sport_portal/src/features/tv_channel/data/dto/stream_dto.dart';
import 'package:sport_portal/src/features/tv_channel/data/dummy_data/streams.dart';
import 'package:sport_portal/src/features/tv_translations/data/dto/channel_dto.dart';

import '../../tv_translations/controller/tv_translations_controller.dart';

part 'tv_channel_controller.g.dart';

class TvChannelController = _TvChannelControllerBase with _$TvChannelController;

abstract class _TvChannelControllerBase with Store {
  // final _repository = GetIt.instance<>();

  final _tvController = GetIt.instance<TvTranslationsController>();

  @observable
  var channelResponse = ObservableFuture<List<StreamDto>?>.value(null);

  final formattedStreams = <String?, StreamDto>{};

  @computed
  bool get isLoading => channelResponse.status == FutureStatus.pending;

  @computed
  bool get isError => channelResponse.status == FutureStatus.rejected;

  @action
  void getStreams() {
    try {
      // final future = Future.delayed(
      //     const Duration(microseconds: 1), () => doCalculation());
    } catch (e) {}
  }

  void doCalculation() {
    final channels = _tvController.channelsFuture.value;
    const streams = Streams.streams;

    for (final channel in channels ?? <ChannelDto>[]) {
      if (formattedStreams.containsKey(channel.id)) {
        continue;
      }
      final urls = <String?>[];
      // print(streams.contains(channel.id));
      final streamsWithUrls =
          streams.where((element) => element['channel'] == channel.id);
      for (final element in streamsWithUrls) {
        urls.add(element['url']);
      }
      if (urls.isNotEmpty) {
        final stream = StreamDto(
            id: channel.id, name: channel.name, logo: channel.logo, urls: urls);
        _addToList(channel.id, stream);
      }
    }
  }

  @action
  void _addToList(String? name, StreamDto stream) {
    formattedStreams.addAll({name: stream});
  }
}
