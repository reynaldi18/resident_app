import 'package:resident_app/src/core/core_res.dart';
import 'package:resident_app/src/core/core_res_single.dart';
import 'package:resident_app/src/core/core_service.dart';
import 'package:resident_app/src/models/absent.dart';
import 'package:resident_app/src/models/house.dart';
import 'package:resident_app/src/models/user.dart';
import 'package:resident_app/src/network/api_result.dart';
import 'package:resident_app/src/network/network_exceptions.dart';
import 'package:resident_app/src/network/requests/empty_house_req.dart';
import 'package:stacked/stacked_annotations.dart';

@LazySingleton()
class HomeService extends CoreService {
  Future<ApiResult<CoreRes<Absent>>> fetchSecurity(String clusterId) async {
    try {
      var result = await apiService.getSecurityActive(
        clusterId: clusterId,
        date: formattedDateAPI,
      );
      return ApiResult.success(data: result);
    } catch (e) {
      return ApiResult.failure(
        error: NetworkExceptions.getDioException(e),
        message: NetworkExceptions.getMessage(e),
      );
    }
  }

  Future<ApiResult<CoreResSingle<House>>> fetchEmptyHouse(
    String clusterId,
    String userId,
  ) async {
    try {
      var result = await apiService.getEmptyHouse(
        clusterId: clusterId,
        userId: userId,
        single: true,
        date: formattedDateAPI,
      );
      return ApiResult.success(data: result);
    } catch (e) {
      return ApiResult.failure(
        error: NetworkExceptions.getDioException(e),
        message: NetworkExceptions.getMessage(e),
      );
    }
  }

  Future<ApiResult<CoreResSingle>> createEmptyHouse(
    String clusterId,
    String userId,
    String from,
    String until,
    String note,
  ) async {
    try {
      Map<String, dynamic> body = EmptyHouseReq(
        clusterId: clusterId,
        userId: userId,
        from: from,
        until: until,
        note: note,
      ).toJson();
      var result = await apiService.createEmptyHouse(body);
      return ApiResult.success(data: result);
    } catch (e) {
      return ApiResult.failure(
        error: NetworkExceptions.getDioException(e),
        message: NetworkExceptions.getMessage(e),
      );
    }
  }
}
