// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'borrower_bankruptcy_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BorrowerBankruptcyModel _$BorrowerBankruptcyModelFromJson(
        Map<String, dynamic> json) =>
    BorrowerBankruptcyModel(
      id: json['id'] as String?,
      bankruptcyCaseNumber: json['bankruptcyCaseNumber'] as String?,
      bankruptcyChapterType: json['bankruptcyChapterType'] as String?,
      bankruptcyClosedType: json['bankruptcyClosedType'] as String?,
      bankruptcyCloseDate: json['bankruptcyCloseDate'] == null
          ? null
          : DateTime.parse(json['bankruptcyCloseDate'] as String),
    );

Map<String, dynamic> _$BorrowerBankruptcyModelToJson(
        BorrowerBankruptcyModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'bankruptcyCaseNumber': instance.bankruptcyCaseNumber,
      'bankruptcyChapterType': instance.bankruptcyChapterType,
      'bankruptcyClosedType': instance.bankruptcyClosedType,
      'bankruptcyCloseDate': instance.bankruptcyCloseDate?.toIso8601String(),
    };
