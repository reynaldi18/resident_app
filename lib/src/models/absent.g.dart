// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'absent.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Absent _$AbsentFromJson(Map<String, dynamic> json) => Absent(
      absentId: json['absensi_id'] as int?,
      activeFlag: json['aktif_flag'] as bool?,
      checkIn: json['check_in'] as String?,
      checkOut: json['check_out'] as String?,
      absentType: json['tipe_absensi'] as String?,
      descAbsent: json['desc_absensi'] as String?,
      date: json['tanggal'] as String?,
      createdDate: json['created_date'] as String?,
      completeness: json['kelengkapan'] == null
          ? null
          : Completeness.fromJson(json['kelengkapan'] as Map<String, dynamic>),
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AbsentToJson(Absent instance) => <String, dynamic>{
      'absensi_id': instance.absentId,
      'aktif_flag': instance.activeFlag,
      'check_in': instance.checkIn,
      'check_out': instance.checkOut,
      'tipe_absensi': instance.absentType,
      'desc_absensi': instance.descAbsent,
      'tanggal': instance.date,
      'created_date': instance.createdDate,
      'kelengkapan': instance.completeness,
      'user': instance.user,
    };
