// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'borrower_bankruptcy_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BorrowerBankruptcyEntity _$BorrowerBankruptcyEntityFromJson(
        Map<String, dynamic> json) =>
    BorrowerBankruptcyEntity(
      id: json['id'] as String?,
      bankruptcyCaseNumber: json['bankruptcyCaseNumber'] as String?,
      bankruptcyChapterType: json['bankruptcyChapterType'] as String?,
      bankruptcyClosedType: json['bankruptcyClosedType'] as String?,
      bankruptcyCloseDate: json['bankruptcyCloseDate'] == null
          ? null
          : DateTime.parse(json['bankruptcyCloseDate'] as String),
    );

Map<String, dynamic> _$BorrowerBankruptcyEntityToJson(
        BorrowerBankruptcyEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'bankruptcyCaseNumber': instance.bankruptcyCaseNumber,
      'bankruptcyChapterType': instance.bankruptcyChapterType,
      'bankruptcyClosedType': instance.bankruptcyClosedType,
      'bankruptcyCloseDate': instance.bankruptcyCloseDate?.toIso8601String(),
    };
