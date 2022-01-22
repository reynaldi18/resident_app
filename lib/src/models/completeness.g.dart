// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'completeness.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Completeness _$CompletenessFromJson(Map<String, dynamic> json) => Completeness(
      completenessId: json['kelengkapan_id'] as int?,
      seragamPdhPdl: json['seragam_pdh_pdl'] as bool?,
      sepatuPdhPdl: json['sepatu_pdh_pdl'] as bool?,
      topi: json['topi'] as bool?,
      talikur: json['talikur'] as bool?,
      peluit: json['peluit'] as bool?,
      sabuk: json['sabuk'] as bool?,
      sabukRingkolep: json['sabuk_ringkolep'] as bool?,
      kaosDalam: json['kaos_dalam'] as bool?,
      borgol: json['borgol'] as bool?,
      knoper: json['knoper'] as bool?,
      idCard: json['id_card'] as bool?,
      nameTag: json['name_tag'] as bool?,
      rompiLalin: json['rompi_lalin'] as bool?,
      imageLink: json['image_link'] as String?,
    );

Map<String, dynamic> _$CompletenessToJson(Completeness instance) =>
    <String, dynamic>{
      'kelengkapan_id': instance.completenessId,
      'seragam_pdh_pdl': instance.seragamPdhPdl,
      'sepatu_pdh_pdl': instance.sepatuPdhPdl,
      'topi': instance.topi,
      'talikur': instance.talikur,
      'peluit': instance.peluit,
      'sabuk': instance.sabuk,
      'sabuk_ringkolep': instance.sabukRingkolep,
      'kaos_dalam': instance.kaosDalam,
      'borgol': instance.borgol,
      'knoper': instance.knoper,
      'id_card': instance.idCard,
      'name_tag': instance.nameTag,
      'rompi_lalin': instance.rompiLalin,
      'image_link': instance.imageLink,
    };
