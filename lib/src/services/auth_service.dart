import 'package:resident_app/src/constant/session.dart';
import 'package:resident_app/src/core/core_res.dart';
import 'package:resident_app/src/core/core_service.dart';
import 'package:resident_app/src/models/auth.dart';
import 'package:resident_app/src/network/api_result.dart';
import 'package:resident_app/src/network/network_exceptions.dart';
import 'package:resident_app/src/network/requests/login_req.dart';
import 'package:resident_app/src/network/requests/regis_req.dart';
import 'package:stacked/stacked_annotations.dart';

@LazySingleton()
class AuthService extends CoreService {
  Future<ApiResult<Auth>> login(
    String email,
    String password,
  ) async {
    try {
      final Map<String, dynamic> body = LoginReq(
        email: email,
        password: password,
        mobile: true,
      ).toJson();
      var result = await apiService.auth(body);
      saveToken(result.accessToken ?? '');
      saveUserId(result.data?.userId ?? 0);
      return ApiResult.success(data: result);
    } catch (e) {
      return ApiResult.failure(
        error: NetworkExceptions.getDioException(e),
        message: NetworkExceptions.getMessage(e),
      );
    }
  }

  void saveToken(String token) {
    sharedPreferencesHelper.putString(
      Session.token,
      token,
    );
  }

  void saveUserId(int id) {
    sharedPreferencesHelper.putInt(
      Session.userId,
      id,
    );
  }

  Future<ApiResult<CoreRes>> regis({
    required String clientId,
    required String clusterId,
    required String name,
    required String email,
    required String phone,
    required String address,
    required String password,
  }) async {
    try {
      final Map<String, dynamic> body = RegisReq(
        clientId: clientId,
        clusterId: clusterId,
        name: name,
        email: email,
        phone: phone,
        address: address,
        password: password,
      ).toJson();
      var result = await apiService.regis(body);
      return ApiResult.success(data: result);
    } catch (e) {
      return ApiResult.failure(
        error: NetworkExceptions.getDioException(e),
        message: NetworkExceptions.getMessage(e),
      );
    }
  }

  Future<ApiResult<CoreRes>> changePassword(
      String email,
      String oldPassword,
      String newPassword,
      ) async {
    try {
      final Map<String, dynamic> body = {
        'email': email,
        'oldPassword': oldPassword,
        'newPassword': newPassword
      };
      var result = await apiService.changePassword(body);
      return ApiResult.success(data: result);
    } catch (e) {
      return ApiResult.failure(
        error: NetworkExceptions.getDioException(e),
        message: NetworkExceptions.getMessage(e),
      );
    }
  }
}
