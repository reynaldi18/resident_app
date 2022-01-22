import 'package:json_annotation/json_annotation.dart';
import 'package:resident_app/src/models/user.dart';

part 'auth.g.dart';

@JsonSerializable()
class Auth {
  @JsonKey(name: 'statusCode')
  int? statusCode;
  @JsonKey(name: 'data')
  User? data;
  @JsonKey(name: 'access_token')
  String? accessToken;
  @JsonKey(name: 'message')
  String? message;

  Auth({
    this.statusCode,
    this.data,
    this.accessToken,
    this.message,
  });

  factory Auth.fromJson(Map<String, dynamic> json) => _$AuthFromJson(json);

  Map<String, dynamic> toJson() => _$AuthToJson(this);
}
