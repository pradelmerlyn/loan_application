// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'borrower_previous_addresses_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BorrowerPreviousAddressesEntity _$BorrowerPreviousAddressesEntityFromJson(
        Map<String, dynamic> json) =>
    BorrowerPreviousAddressesEntity(
      id: json['id'] as String?,
      line: json['line'] as String?,
      line2: json['line2'] as String?,
      city: json['city'] as String?,
      state: json['state'] as String?,
      zipCode: json['zipCode'] as String?,
      occupancyType: json['occupancyType'] as String?,
      monthlyRentAmount: (json['monthlyRentAmount'] as num?)?.toDouble(),
      addressValidStart: json['addressValidStart'] == null
          ? null
          : DateTime.parse(json['addressValidStart'] as String),
      addressValidEnd: json['addressValidEnd'] == null
          ? null
          : DateTime.parse(json['addressValidEnd'] as String),
      action: json['action'] as String?,
    );

Map<String, dynamic> _$BorrowerPreviousAddressesEntityToJson(
        BorrowerPreviousAddressesEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'line': instance.line,
      'line2': instance.line2,
      'city': instance.city,
      'state': instance.state,
      'zipCode': instance.zipCode,
      'occupancyType': instance.occupancyType,
      'monthlyRentAmount': instance.monthlyRentAmount,
      'addressValidStart': instance.addressValidStart?.toIso8601String(),
      'addressValidEnd': instance.addressValidEnd?.toIso8601String(),
      'action': instance.action,
    };
