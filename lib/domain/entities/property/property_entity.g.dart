// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'property_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PropertyEntity _$PropertyEntityFromJson(Map<String, dynamic> json) =>
    PropertyEntity(
      id: json['id'] as String?,
      intendedUsageType: json['intendedUsageType'],
      propertyType: json['propertyType'],
      address: json['address'] == null
          ? null
          : PropertyAddressEntity.fromJson(
              json['address'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PropertyEntityToJson(PropertyEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'intendedUsageType': instance.intendedUsageType,
      'propertyType': instance.propertyType,
      'address': instance.address,
    };
