import 'package:dio/dio.dart';
import 'package:resident_app/src/constant/config.dart';
import 'package:resident_app/src/core/core_res.dart';
import 'package:resident_app/src/core/core_res_single.dart';
import 'package:resident_app/src/helpers/http_helper.dart';
import 'package:resident_app/src/models/absent.dart';
import 'package:resident_app/src/models/auth.dart';
import 'package:resident_app/src/models/client.dart';
import 'package:resident_app/src/models/house.dart';
import 'package:resident_app/src/models/user.dart';
import 'package:retrofit/http.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: Config.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String? baseUrl}) {
    dio.interceptors.add(HttpHelper().getDioInterceptor());
    return _ApiService(dio, baseUrl: baseUrl);
  }

  @POST("auth/login/penghuni")
  Future<Auth> auth(@Body() Map<String, dynamic> body);

  @POST("user/register")
  Future<CoreRes > regis(@Body() Map<String, dynamic> body);

  @GET("user")
  Future<CoreRes<User>> getUser({
    @Query('user_id') int? userId,
    @Query('role_name') String? roleName,
    @Query('cluster_id') int? clusterId,
    @Query('client_id') int? clientId,
  });

  @PUT("user/profile")
  Future<CoreRes> editUser(@Body() Map<String, dynamic> body);

  @PUT("user/picture")
  Future<CoreRes> editPhoto(@Body() FormData body);

  @PUT("user/password")
  Future<CoreRes> changePassword(@Body() Map<String, dynamic> body);

  @GET("penghuni/kosong")
  Future<CoreResSingle<House>> getEmptyHouse({
    @Query('cluster_id') String? clusterId,
    @Query('tanggal') String? date,
    @Query('user_id') String? userId,
    @Query('single') bool? single,
  });

  @POST("penghuni/kosong")
  Future<CoreResSingle> createEmptyHouse(@Body() Map<String, dynamic> body);

  @GET("absensi/active")
  Future<CoreRes<Absent>> getSecurityActive({
    @Query('cluster_id') String? clusterId,
    @Query('tanggal') String? date,
  });

  @GET("client")
  Future<CoreRes<Client>> getClient();
}
