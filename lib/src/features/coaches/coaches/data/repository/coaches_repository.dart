import '../../../../../core/network/dio_helper.dart';
import '../dto/federation_coaches.dart';

class CoachesRepository {
  final _api = DioHelper.instance;

  Future<List<FederationCoachesDto>> getCoaches(String? locale) async {
    final response = await _api
        .get('/federation-page/trainers', queryParameters: {'lang': locale});
    final data = response.data['data'] as Iterable;

    return data.map((value) => FederationCoachesDto.fromJson(value)).toList();
  }
}
