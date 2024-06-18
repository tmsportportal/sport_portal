import 'package:sport_portal/src/core/network/dio_helper.dart';

import '../dto/health_care_dto.dart';

class HealthCareRepository {
  final _dio = DioHelper.instance;
  final _path = '/hcdepartment-page/health_care';

  Future<List<HealthCareDto>> getHealthCare(String? locale) async {
    final response = await _dio.get(_path, queryParameters: {'lang': locale});
    final data = response.data['data'] as Iterable;

    return data.map((value) => HealthCareDto.fromJson(value)).toList();
  }
}
