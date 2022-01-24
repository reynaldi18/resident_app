import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:resident_app/src/constant/config.dart';
import 'package:resident_app/src/constant/session.dart';
import 'package:resident_app/src/core/core_res.dart';
import 'package:resident_app/src/core/core_service.dart';
import 'package:resident_app/src/models/client.dart';
import 'package:resident_app/src/models/user.dart';
import 'package:resident_app/src/network/api_result.dart';
import 'package:resident_app/src/network/network_exceptions.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked_annotations.dart';

@LazySingleton()
class UserService extends CoreService {
  Future<ApiResult<CoreRes<User>>> fetchUser() async {
    try {
      final userId = sharedPreferencesHelper.getInt(Session.userId);
      var result = await apiService.getUser(userId: userId);
      saveUser(result.data?.first);
      return ApiResult.success(data: result);
    } catch (e) {
      return ApiResult.failure(
        error: NetworkExceptions.getDioException(e),
        message: NetworkExceptions.getMessage(e),
      );
    }
  }

  Future<void> saveUser(User? data) async {
    final User? user = data;

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(Session.user, jsonEncode(user));
  }

  Future<User> getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    Map<String, dynamic> userMap;
    final String userStr = prefs.getString(Session.user)!;
    userMap = jsonDecode(userStr) as Map<String, dynamic>;

    final User user = User.fromJson(userMap);
    return user;
  }

  Future<ApiResult<CoreRes>> editUser(
    String email,
    String phone,
  ) async {
    try {
      Map<String, dynamic> body = {
        "email": email,
        "phone": phone,
      };
      var result = await apiService.editUser(body);
      fetchUser();
      // saveUser(result.data);
      return ApiResult.success(data: result);
    } catch (e) {
      return ApiResult.failure(
        error: NetworkExceptions.getDioException(e),
        message: NetworkExceptions.getMessage(e),
      );
    }
  }

  Future<ApiResult<CoreRes>> editPhoto(
    String email,
    File imageLink,
  ) async {
    try {
      var formData = FormData.fromMap({
        'email': email,
      });
      var file = MultipartFile.fromFileSync(imageLink.path);
      formData.files.add(MapEntry('image_link', file));
      var result = await apiService.editPhoto(formData);
      return ApiResult.success(data: result);
    } catch (e) {
      return ApiResult.failure(
        error: NetworkExceptions.getDioException(e),
        message: NetworkExceptions.getMessage(e),
      );
    }
  }

  Future<ApiResult<CoreRes<Client>>> fetchClient() async {
    try {
      var result = await apiService.getClient();
      return ApiResult.success(data: result);
    } catch (e) {
      return ApiResult.failure(
        error: NetworkExceptions.getDioException(e),
        message: NetworkExceptions.getMessage(e),
      );
    }
  }

  Future<ApiResult<CoreRes<User>>> fetchContactEmergency(User user) async {
    try {
      var result = await apiService.getContactEmergency(
        roleName: Config.chief,
        clientId: user.client?.clientId,
      );
      saveUser(result.data?.first);
      return ApiResult.success(data: result);
    } catch (e) {
      return ApiResult.failure(
        error: NetworkExceptions.getDioException(e),
        message: NetworkExceptions.getMessage(e),
      );
    }
  }
}
