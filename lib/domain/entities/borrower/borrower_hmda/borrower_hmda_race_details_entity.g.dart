// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'borrower_hmda_race_details_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BorrowerHmdaRaceDetailsEntity _$BorrowerHmdaRaceDetailsEntityFromJson(
        Map<String, dynamic> json) =>
    BorrowerHmdaRaceDetailsEntity(
      hmdaRaceTypes: (json['hmdaRaceTypes'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      hmdaRaceEnrolledOrPrincipalTribe:
          json['hmdaRaceEnrolledOrPrincipalTribe'] as String?,
      hmdaRaceDesignationTypes:
          (json['hmdaRaceDesignationTypes'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList(),
      hmdaRaceDesignationOtherAsianDescription:
          json['hmdaRaceDesignationOtherAsianDescription'] as String?,
      hmdaRaceDesignationTypesPacificIslander:
          (json['hmdaRaceDesignationTypesPacificIslander'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList(),
      hmdaRaceDesignationOtherPacificIslanderDescription:
          json['hmdaRaceDesignationOtherPacificIslanderDescription'] as String?,
    );

Map<String, dynamic> _$BorrowerHmdaRaceDetailsEntityToJson(
        BorrowerHmdaRaceDetailsEntity instance) =>
    <String, dynamic>{
      'hmdaRaceTypes': instance.hmdaRaceTypes,
      'hmdaRaceEnrolledOrPrincipalTribe':
          instance.hmdaRaceEnrolledOrPrincipalTribe,
      'hmdaRaceDesignationTypes': instance.hmdaRaceDesignationTypes,
      'hmdaRaceDesignationOtherAsianDescription':
          instance.hmdaRaceDesignationOtherAsianDescription,
      'hmdaRaceDesignationTypesPacificIslander':
          instance.hmdaRaceDesignationTypesPacificIslander,
      'hmdaRaceDesignationOtherPacificIslanderDescription':
          instance.hmdaRaceDesignationOtherPacificIslanderDescription,
    };
