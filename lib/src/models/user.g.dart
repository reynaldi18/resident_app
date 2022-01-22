// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      userId: json['user_id'] as int?,
      email: json['email'] as String?,
      name: json['name'] as String?,
      gender: json['gender'] as String?,
      birthPlc: json['birth_plc'] as String?,
      birthDt: json['birth_dt'] as String?,
      nik: json['nik'] as String?,
      religion: json['agama'] as String?,
      phone: json['phone'] as String?,
      address: json['alamat'] as String?,
      noAccount: json['no_rekening'] as String?,
      imageLink: json['image_link'] as String?,
      city: json['kota'] as String?,
      province: json['provinsi'] as String?,
      postalCode: json['kode_pos'] as String?,
      joinDt: json['join_dt'] as String?,
      resignDt: json['resign_dt'] as String?,
      role: json['role'] == null
          ? null
          : Role.fromJson(json['role'] as Map<String, dynamic>),
      absent: (json['absensis'] as List<dynamic>?)
          ?.map((e) => Absent.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..client = json['client'] == null
          ? null
          : Client.fromJson(json['client'] as Map<String, dynamic>)
      ..cluster = json['cluster'] == null
          ? null
          : Cluster.fromJson(json['cluster'] as Map<String, dynamic>);

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'user_id': instance.userId,
      'email': instance.email,
      'name': instance.name,
      'gender': instance.gender,
      'birth_plc': instance.birthPlc,
      'birth_dt': instance.birthDt,
      'nik': instance.nik,
      'agama': instance.religion,
      'phone': instance.phone,
      'alamat': instance.address,
      'no_rekening': instance.noAccount,
      'image_link': instance.imageLink,
      'kota': instance.city,
      'provinsi': instance.province,
      'kode_pos': instance.postalCode,
      'join_dt': instance.joinDt,
      'resign_dt': instance.resignDt,
      'role': instance.role,
      'client': instance.client,
      'cluster': instance.cluster,
      'absensis': instance.absent,
    };
