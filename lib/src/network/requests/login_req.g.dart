// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_req.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginReq _$LoginReqFromJson(Map<String, dynamic> json) => LoginReq(
      email: json['email'] as String?,
      password: json['password'] as String?,
      mobile: json['mobile'] as bool?,
    );

Map<String, dynamic> _$LoginReqToJson(LoginReq instance) => <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'mobile': instance.mobile,
    };
