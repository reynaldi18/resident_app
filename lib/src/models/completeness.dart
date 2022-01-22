import 'package:json_annotation/json_annotation.dart';

part 'completeness.g.dart';

@JsonSerializable()
class Completeness {
  @JsonKey(name: 'kelengkapan_id')
  int? completenessId;
  @JsonKey(name: 'seragam_pdh_pdl')
  bool? seragamPdhPdl;
  @JsonKey(name: 'sepatu_pdh_pdl')
  bool? sepatuPdhPdl;
  @JsonKey(name: 'topi')
  bool? topi;
  @JsonKey(name: 'talikur')
  bool? talikur;
  @JsonKey(name: 'peluit')
  bool? peluit;
  @JsonKey(name: 'sabuk')
  bool? sabuk;
  @JsonKey(name: 'sabuk_ringkolep')
  bool? sabukRingkolep;
  @JsonKey(name: 'kaos_dalam')
  bool? kaosDalam;
  @JsonKey(name: 'borgol')
  bool? borgol;
  @JsonKey(name: 'knoper')
  bool? knoper;
  @JsonKey(name: 'id_card')
  bool? idCard;
  @JsonKey(name: 'name_tag')
  bool? nameTag;
  @JsonKey(name: 'rompi_lalin')
  bool? rompiLalin;
  @JsonKey(name: 'image_link')
  String? imageLink;

  Completeness({
    this.completenessId,
    this.seragamPdhPdl,
    this.sepatuPdhPdl,
    this.topi,
    this.talikur,
    this.peluit,
    this.sabuk,
    this.sabukRingkolep,
    this.kaosDalam,
    this.borgol,
    this.knoper,
    this.idCard,
    this.nameTag,
    this.rompiLalin,
    this.imageLink,
  });

  factory Completeness.fromJson(Map<String, dynamic> json) =>
      _$CompletenessFromJson(json);

  Map<String, dynamic> toJson() => _$CompletenessToJson(this);
}
