// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'borrower_hmda_gender_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BorrowerHmdaGenderDetailsModel _$BorrowerHmdaGenderDetailsModelFromJson(
        Map<String, dynamic> json) =>
    BorrowerHmdaGenderDetailsModel(
      hmdaGenderTypes: (json['hmdaGenderTypes'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$BorrowerHmdaGenderDetailsModelToJson(
        BorrowerHmdaGenderDetailsModel instance) =>
    <String, dynamic>{
      'hmdaGenderTypes': instance.hmdaGenderTypes,
    };
