import 'package:json_annotation/json_annotation.dart';

part 'role.g.dart';

@JsonSerializable()
class Role {
  @JsonKey(name: 'role_id')
  int? roleId;
  @JsonKey(name: 'role_name')
  String? roleName;
  @JsonKey(name: 'createDateTime')
  String? createDateTime;

  Role({
    this.roleId,
    this.roleName,
    this.createDateTime,
  });

  factory Role.fromJson(Map<String, dynamic> json) => _$RoleFromJson(json);

  Map<String, dynamic> toJson() => _$RoleToJson(this);
}
