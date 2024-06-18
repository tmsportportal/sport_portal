import '../../../../../core/network/dio_helper.dart';
import '../dto/federation_athletes_dto.dart';

class AthletesRepository {
  final _api = DioHelper.instance;

  Future<List<FederationAthletesDto>> getAthletes(String? locale) async {
    final response = await _api
        .get('/federation-page/athletes', queryParameters: {'lang': locale});
    final data = response.data['data'] as Iterable;

    return data.map((value) => FederationAthletesDto.fromJson(value)).toList();
  }
}
