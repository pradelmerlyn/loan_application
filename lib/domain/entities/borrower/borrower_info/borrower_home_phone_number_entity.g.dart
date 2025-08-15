// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'borrower_home_phone_number_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BorrowerHomePhoneNumberEntity _$BorrowerHomePhoneNumberEntityFromJson(
        Map<String, dynamic> json) =>
    BorrowerHomePhoneNumberEntity(
      id: json['id'] as String?,
      number: json['number'] as String?,
      type: json['type'],
    );

Map<String, dynamic> _$BorrowerHomePhoneNumberEntityToJson(
        BorrowerHomePhoneNumberEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'number': instance.number,
      'type': instance.type,
    };
