import 'package:sport_portal/src/core/network/dio_helper.dart';

import '../dto/filter_dto.dart';
import '../dto/gyms_dto.dart';

class GymsRepository {
  final _dio = DioHelper.instance;

  final _path = '/gyms-and-clubs-page';

  Future<List<GymDto>> getGyms(String? locale) async {
    try {
      final params = {'lang': locale};
      final response = await _dio.get(_path, queryParameters: params);

      final data = response.data['data']['gymsclubs'] as Iterable;
      return data.map((value) => GymDto.fromJson(value)).toList();
    } on Exception catch (e) {
      print(e);
      throw Exception(e);
    }
  }

  Future<List<FilterDto>> getFilters(String? locale) async {
    final response =
        await _dio.get('$_path/filters', queryParameters: {'lang': locale});

    final data = response.data['data'] as Iterable;
    return data.map((value) => FilterDto.fromJson(value)).toList();
  }

  Future<List<GymDto>> getGymsWithFilters(
      String? locale, Map<String, String> filter) async {
    final response = await _dio
        .post('$_path/filter', queryParameters: {'lang': locale, ...filter});
    final data = response.data['data'] as Iterable;
    return data.map((value) => GymDto.fromJson(value)).toList();
  }
}
