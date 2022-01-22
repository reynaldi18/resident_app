import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:resident_app/src/constant/session.dart';
import 'package:resident_app/src/helpers/shared_preferences_helper.dart';
import 'package:resident_app/src/injector/injector.dart';

class HttpHelper {
  final SharedPreferencesHelper _sharedPreferencesManager =
      locatorLocal<SharedPreferencesHelper>();

  var logger = Logger(
    printer: PrettyPrinter(
      colors: true,
      printEmojis: true,
      printTime: true,
    ),
  );

  getToken() => _sharedPreferencesManager.getString(Session.token);

  getDioInterceptor() => InterceptorsWrapper(
        onRequest: (options, handler) {
          try {
            options.headers = {
              'Content-Type': options.data is FormData
                  ? 'multipart/form-data'
                  : Headers.jsonContentType,
              if (getToken() != null) 'Authorization': 'Bearer ${getToken()}',
            };
            logger.i("${options.headers}\n${options.queryParameters}\n${options.data}");
            logger.i("$options");

            return handler.next(options);
          } catch (e) {
            logger.e("$options");
            return handler.next(options);
          }
        },
        onResponse: (response, handler) {
          try {
            logger.i(
                "${response.headers}\n${response.requestOptions}\n${response.requestOptions.baseUrl}");
            logger.i(
                "${response.requestOptions.baseUrl}\n${response.statusCode}\n${response.data}");
            return handler.next(response);
          } catch (e) {
            logger.e("$response");
            return handler.next(response);
          }
        },
        onError: (DioError e, handler) {
          logger.e("$e");
          return handler.next(e);
        },
      );
}
