import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'asset_entity.g.dart';

@JsonSerializable()
class AssetEntity extends Equatable {
  @JsonKey(name: 'id')
  final String? id;

  @JsonKey(name: 'borrowersIds')
  final List<String>? borrowersIds;

  @JsonKey(name: 'assetType')
  final String? assetType;

  @JsonKey(name: 'institutionName')
  final String? institutionName;

  @JsonKey(name: 'accountIdentifier')
  final String? accountIdentifier;

  @JsonKey(name: 'assetValue')
  final num? assetValue;

  @JsonKey(name: 'action')
  final String? action;

  @JsonKey(name: 'userType')
  final String? userType;

  const AssetEntity({
    this.id,
    this.borrowersIds,
    this.assetType,
    this.institutionName,
    this.accountIdentifier,
    this.assetValue,
    this.action,
    this.userType,
  });

  @override
  List<Object?> get props => [
        id,
        borrowersIds,
        assetType,
        institutionName,
        accountIdentifier,
        assetValue,
        action,
        userType,
      ];

  factory AssetEntity.fromJson(Map<String, dynamic> json) =>
      _$AssetEntityFromJson(json);

  Map<String, dynamic> toJson() => _$AssetEntityToJson(this);
}
