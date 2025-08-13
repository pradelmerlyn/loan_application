// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'borrower_hmda_race_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BorrowerHmdaRaceDetailsModel _$BorrowerHmdaRaceDetailsModelFromJson(
        Map<String, dynamic> json) =>
    BorrowerHmdaRaceDetailsModel(
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

Map<String, dynamic> _$BorrowerHmdaRaceDetailsModelToJson(
        BorrowerHmdaRaceDetailsModel instance) =>
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
