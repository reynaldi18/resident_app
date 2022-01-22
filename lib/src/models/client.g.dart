// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Client _$ClientFromJson(Map<String, dynamic> json) => Client(
      clientId: json['client_id'] as int?,
      clientName: json['client_name'] as String?,
      clientEmail: json['client_email'] as String?,
      clientPhone: json['client_phone'] as String?,
      noAccount: json['nomor_rekening'] as String?,
      address: json['alamat'] as String?,
      city: json['kota'] as String?,
      province: json['provinsi'] as String?,
      postalCode: json['kode_pos'] as String?,
      imageLink: json['image_link'] as String?,
      docSupport: json['doc_penunjang'] as String?,
      clusters: (json['clusters'] as List<dynamic>?)
          ?.map((e) => Cluster.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ClientToJson(Client instance) => <String, dynamic>{
      'client_id': instance.clientId,
      'client_name': instance.clientName,
      'client_email': instance.clientEmail,
      'client_phone': instance.clientPhone,
      'nomor_rekening': instance.noAccount,
      'alamat': instance.address,
      'kota': instance.city,
      'provinsi': instance.province,
      'kode_pos': instance.postalCode,
      'image_link': instance.imageLink,
      'doc_penunjang': instance.docSupport,
      'clusters': instance.clusters,
    };
