import '../../../../../core/network/dio_helper.dart';
import '../../../../gyms/gyms/data/dto/filter_dto.dart';
import '../dto/competition_list_dto.dart';

class CompetitionsRepository {
  final _dio = DioHelper.instance;

  final _path = '/competition-page';

  Future<List<CompetitionListDto>> getCompetitions(String? locale) async {
    final response = await _dio.get(_path, queryParameters: {'lang': locale});
    final data = response.data['data'] as Iterable;
    return data.map((value) => CompetitionListDto.fromJson(value)).toList();
  }

  Future<List<FilterDto>> getFilters(String? locale) async {
    final response =
        await _dio.get('$_path/filters', queryParameters: {'lang': locale});

    final data = response.data['data'] as Iterable;
    return data.map((value) => FilterDto.fromJson(value)).toList();
  }

  Future<List<CompetitionListDto>> getCompetitionsWithFilters(
      String? locale, Map<String, String> filter) async {
    final response = await _dio.post(
      '$_path/filter',
      queryParameters: {'lang': locale, ...filter},
    );
    final data = response.data['data'] as Iterable;
    return data.map((value) => CompetitionListDto.fromJson(value)).toList();
  }

  Future<List<CompetitionListDto>> getCompetitionsSearch(
    String? locale,
    String? name,
  ) async {
    final params = {'lang': locale};
    if (name != null) {
      params['name'] = name;
    }
    final response = await _dio.post(
      '$_path/filter',
      queryParameters: params,
    );
    final data = response.data['data'] as Iterable;
    return data.map((value) => CompetitionListDto.fromJson(value)).toList();
  }
}
