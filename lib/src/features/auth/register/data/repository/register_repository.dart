import 'package:sport_portal/src/core/network/dio_helper.dart';
import 'package:sport_portal/src/features/auth/register/data/dto/register_dto.dart';

class RegisterRepository {
  final _dio = DioHelper.instance;

  Future<void> register(RegisterDto registerDto) async {
    await _dio.post('/auth/signup', data: registerDto.toJson());
  }
}
