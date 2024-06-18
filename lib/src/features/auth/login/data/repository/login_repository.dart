import '../../../../../core/network/dio_helper.dart';
import '../../../account/models/account.dart';
import '../dto/login_dto.dart';

class LoginRepository {
  final _dio = DioHelper.instance;

  Future<Account> login(LoginDto registerDto,
      void Function(String newToken) updateTokenCallback) async {
    final response =
        await _dio.post('/auth/signin', data: registerDto.toJson());
    final data = response.data['data'] as Map<String, dynamic>;
    updateTokenCallback(data['token']);
    return Account.fromJson(data);
  }
}
