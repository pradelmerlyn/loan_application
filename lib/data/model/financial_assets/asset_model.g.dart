// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asset_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AssetModel _$AssetModelFromJson(Map<String, dynamic> json) => AssetModel(
      id: json['id'] as String?,
      borrowersIds: (json['borrowersIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      assetType: json['assetType'] as String?,
      institutionName: json['institutionName'] as String?,
      accountIdentifier: json['accountIdentifier'] as String?,
      assetValue: json['assetValue'] as num?,
      action: json['action'] as String?,
      userType: json['userType'] as String?,
    );

Map<String, dynamic> _$AssetModelToJson(AssetModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'borrowersIds': instance.borrowersIds,
      'assetType': instance.assetType,
      'institutionName': instance.institutionName,
      'accountIdentifier': instance.accountIdentifier,
      'assetValue': instance.assetValue,
      'action': instance.action,
      'userType': instance.userType,
    };
