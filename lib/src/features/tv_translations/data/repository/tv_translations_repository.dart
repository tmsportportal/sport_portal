import 'package:dio/dio.dart';

import '../dto/channel_dto.dart';

abstract class TvTranslationsRepository {
  Future<List<ChannelDto>?> fetchChannels();

  factory TvTranslationsRepository(Dio client) =>
      _TvTranslationsRepositoryImpl(client);
}

class _TvTranslationsRepositoryImpl implements TvTranslationsRepository {
  final Dio _client;
  const _TvTranslationsRepositoryImpl(this._client);

  @override
  Future<List<ChannelDto>?> fetchChannels() async {
    final channels = <ChannelDto>[];

    try {
      final response =
          await _client.get('https://iptv-org.github.io/api/channels.json');
      if (response.statusCode == 200) {
        for (var channel in response.data) {
          final channelDto = ChannelDto.fromJson(channel);

          if (channelDto.categories?.isNotEmpty ?? false) {
            if (channelDto.categories?.contains('sports') ?? false) {
              channels.add(channelDto);
            }
          }
        }
        return channels;
      } else {
        throw Exception(
            'DioError with status code: ${response.statusCode} and message: ${response.data}');
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
