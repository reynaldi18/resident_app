// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'house.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

House _$HouseFromJson(Map<String, dynamic> json) => House(
      houseId: json['rumah_id'] as int?,
      from: json['dari'] as String?,
      until: json['sampai'] as String?,
      desc: json['keterangan'] as String?,
      address: json['alamat'] as String?,
    );

Map<String, dynamic> _$HouseToJson(House instance) => <String, dynamic>{
      'rumah_id': instance.houseId,
      'dari': instance.from,
      'sampai': instance.until,
      'keterangan': instance.desc,
      'alamat': instance.address,
    };
