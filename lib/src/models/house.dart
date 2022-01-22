import 'package:json_annotation/json_annotation.dart';

part 'house.g.dart';

@JsonSerializable()
class House {
  @JsonKey(name: 'rumah_id')
  int? houseId;
  @JsonKey(name: 'dari')
  String? from;
  @JsonKey(name: 'sampai')
  String? until;
  @JsonKey(name: 'keterangan')
  String? desc;
  @JsonKey(name: 'alamat')
  String? address;

  House({
    this.houseId,
    this.from,
    this.until,
    this.desc,
    this.address,
  });

  factory House.fromJson(Map<String, dynamic> json) => _$HouseFromJson(json);

  Map<String, dynamic> toJson() => _$HouseToJson(this);
}
