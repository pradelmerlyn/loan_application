// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'borrower_hmda_gender_details_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BorrowerHmdaGenderDetailsEntity _$BorrowerHmdaGenderDetailsEntityFromJson(
        Map<String, dynamic> json) =>
    BorrowerHmdaGenderDetailsEntity(
      hmdaGenderTypes: (json['hmdaGenderTypes'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$BorrowerHmdaGenderDetailsEntityToJson(
        BorrowerHmdaGenderDetailsEntity instance) =>
    <String, dynamic>{
      'hmdaGenderTypes': instance.hmdaGenderTypes,
    };
