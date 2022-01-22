import 'package:flutter/material.dart';
import 'package:resident_app/src/app/app.locator.dart';
import 'package:resident_app/src/app/app.router.dart';
import 'package:resident_app/src/core/core_res.dart';
import 'package:resident_app/src/core/core_view_model.dart';
import 'package:resident_app/src/models/client.dart';
import 'package:resident_app/src/models/cluster.dart';
import 'package:resident_app/src/network/network_exceptions.dart';
import 'package:resident_app/src/network/result_state.dart';
import 'package:resident_app/src/services/auth_service.dart';
import 'package:resident_app/src/services/user_service.dart';
import 'package:stacked/stacked.dart';

class RegisViewModel extends FutureViewModel with CoreViewModel {
  final _authService = locator<AuthService>();
  final _userService = locator<UserService>();

  Client? clientValue;
  int? clientIdValue;
  String? clientName;
  Cluster? clusterValue;
  int? clusterIdValue;
  String? clusterName;

  List<Client>? client;
  List<Cluster>? cluster;

  @override
  Future futureToRun() => getClient();

  Future<ResultState<List<Client>?>> getClient() async {
    var result = await _userService.fetchClient();
    return result.when(
      success: (CoreRes<Client> data) async {
        client = data.data;
        notifyListeners();
        return ResultState.data(data: data.data);
      },
      failure: (NetworkExceptions error, String? message) async {
        return ResultState.error(error: error);
      },
    );
  }

  void validate(BuildContext context) {
    if (clientIdValue == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Harap tentukan Perumahan'),
        ),
      );
    } else if (clusterIdValue == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Harap tentukan Cluster'),
        ),
      );
    } else {
      showRegisData();
    }
    notifyListeners();
  }

  void showRegisData() => navigationService.navigateTo(
        Routes.regisDataView,
        arguments: RegisDataViewArguments(
          clientId: clientIdValue.toString(),
          clusterId: clusterIdValue.toString(),
        ),
      );
}
