// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'property_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PropertyModel _$PropertyModelFromJson(Map<String, dynamic> json) =>
    PropertyModel(
      id: json['id'] as String?,
      intendedUsageType: json['intendedUsageType'] as String?,
      propertyType: json['propertyType'] as String?,
      address: json['address'] == null
          ? null
          : PropertyAddressModel.fromJson(
              json['address'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PropertyModelToJson(PropertyModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'intendedUsageType': instance.intendedUsageType,
      'propertyType': instance.propertyType,
      'address': instance.address,
    };
