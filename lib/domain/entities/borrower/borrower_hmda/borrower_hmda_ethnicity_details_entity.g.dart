// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'borrower_hmda_ethnicity_details_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BorrowerHmdaEthnicityDetailsEntity _$BorrowerHmdaEthnicityDetailsEntityFromJson(
        Map<String, dynamic> json) =>
    BorrowerHmdaEthnicityDetailsEntity(
      hmdaEthnicityTypes: (json['hmdaEthnicityTypes'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      hmdaEthnicityOriginTypes:
          (json['hmdaEthnicityOriginTypes'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList(),
      otherHMDAEthnicityOriginType:
          json['otherHMDAEthnicityOriginType'] as String?,
    );

Map<String, dynamic> _$BorrowerHmdaEthnicityDetailsEntityToJson(
        BorrowerHmdaEthnicityDetailsEntity instance) =>
    <String, dynamic>{
      'hmdaEthnicityTypes': instance.hmdaEthnicityTypes,
      'hmdaEthnicityOriginTypes': instance.hmdaEthnicityOriginTypes,
      'otherHMDAEthnicityOriginType': instance.otherHMDAEthnicityOriginType,
    };
