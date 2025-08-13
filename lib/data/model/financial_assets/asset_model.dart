import 'package:json_annotation/json_annotation.dart';
import 'package:loan/domain/entities/financial_assets/asset_entity.dart';

part 'asset_model.g.dart';

@JsonSerializable()
class AssetModel extends AssetEntity {
  const AssetModel({
    super.id,
    super.borrowersIds,
    super.assetType,
    super.institutionName,
    super.accountIdentifier,
    super.assetValue,
    super.action,
    super.userType,
  }) : super();


  factory AssetModel.fromEntity(AssetEntity e) => AssetModel(
        id: e.id,
        borrowersIds: e.borrowersIds,
        assetType: e.assetType,
        institutionName: e.institutionName,
        accountIdentifier: e.accountIdentifier,
        assetValue: e.assetValue,
        action: e.action,
        userType: e.userType,
      );

  factory AssetModel.fromJson(Map<String, dynamic> json) =>
      _$AssetModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$AssetModelToJson(this);

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
}
