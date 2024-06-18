import 'package:sport_portal/src/core/network/dio_helper.dart';

import '../dto/kinds_of_sport_dto.dart';

class KindsOfSportRepository {
  final _dio = DioHelper.instance;

  Future<List<KindsOfSportDto>> fetchData(String? locale) async {
    final response = await _dio
        .get('/federation-page/sports', queryParameters: {'lang': locale});
    final data = response.data['data'] as Iterable;
    return data.map((value) => KindsOfSportDto.fromJson(value)).toList();
  }
}
