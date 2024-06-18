import 'package:sport_portal/src/core/network/dio_helper.dart';

import '../dto/news_filter_dto.dart';
import '../dto/news_list_dto.dart';
import '../dto/video_news_list_dto.dart';

class NewsRepository {
  final _dio = DioHelper.instance;

  final _mainPagePath = '/main-page';
  final _newsPagePath = '/news-page';

  Future<List<NewsListDto>> getLocalNews(String? locale) async {
    final response = await _dio.get(_mainPagePath, queryParameters: {
      'lang': locale,
      'section': Section.Local.name,
    });
    final data = response.data['data'] as Iterable;
    return data.map((value) => NewsListDto.fromJson(value)).toList();
  }

  Future<List<NewsListDto>> getWorldNews(String? locale) async {
    final response = await _dio.get(_mainPagePath, queryParameters: {
      'lang': locale,
      'section': Section.World.name,
    });
    final data = response.data['data'] as Iterable;
    return data.map((value) => NewsListDto.fromJson(value)).toList();
  }

  Future<List<VideoNewsListDto>> getVideoNews(String? locale) async {
    final response = await _dio.get(_mainPagePath, queryParameters: {
      'lang': locale,
      'section': Section.Video.name,
    });
    final data = response.data['data'] as Iterable;
    return data.map((value) => VideoNewsListDto.fromJson(value)).toList();
  }

  Future<NewsFilterDto> getFilters(String? locale, Section section) async {
    final response = await _dio.get('$_newsPagePath/filters',
        queryParameters: {'lang': locale, 'section': section.name});

    final data = response.data['data'] as Map<String, dynamic>;
    return NewsFilterDto.fromJson(data);
  }

  Future<List<NewsListDto>> getFilteredWorldNews(
    String? locale,
    Map<String, String> filter,
  ) async {
    final response = await _dio.post('$_newsPagePath/filter', queryParameters: {
      'lang': locale,
      'section': Section.World.name,
      ...filter
    });
    final data = response.data['data'] as Iterable;
    return data.map((value) => NewsListDto.fromJson(value)).toList();
  }

  Future<List<NewsListDto>> getFilteredLocalNews(
    String? locale,
    Map<String, String> filter,
  ) async {
    final response = await _dio.post('$_newsPagePath/filter', queryParameters: {
      'lang': locale,
      'section': Section.Local.name,
      ...filter
    });
    final data = response.data['data'] as Iterable;
    return data.map((value) => NewsListDto.fromJson(value)).toList();
  }

  Future<List<VideoNewsListDto>> getFilteredVideoNews(
    String? locale,
    Map<String, String> filter,
  ) async {
    final response = await _dio.post('$_newsPagePath/filter', queryParameters: {
      'lang': locale,
      'section': Section.Video.name,
      ...filter
    });
    final data = response.data['data'] as Iterable;
    return data.map((value) => VideoNewsListDto.fromJson(value)).toList();
  }
}
