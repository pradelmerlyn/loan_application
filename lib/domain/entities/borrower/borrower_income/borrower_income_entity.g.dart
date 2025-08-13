// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'borrower_income_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BorrowerIncomeEntity _$BorrowerIncomeEntityFromJson(
        Map<String, dynamic> json) =>
    BorrowerIncomeEntity(
      id: json['id'] as String?,
      incomeType: json['incomeType'] as String?,
      qualifiedMonthlyIncome:
          (json['qualifiedMonthlyIncome'] as num?)?.toDouble(),
      employer: json['employer'] == null
          ? null
          : BorrowerIncomeEmployerEntity.fromJson(
              json['employer'] as Map<String, dynamic>),
      statedEmploymentBaseIncome: json['statedEmploymentBaseIncome'] == null
          ? null
          : BorrowerIncomeEmployerBaseIncomeEntity.fromJson(
              json['statedEmploymentBaseIncome'] as Map<String, dynamic>),
      action: json['action'] as String?,
    );

Map<String, dynamic> _$BorrowerIncomeEntityToJson(
        BorrowerIncomeEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'incomeType': instance.incomeType,
      'qualifiedMonthlyIncome': instance.qualifiedMonthlyIncome,
      'employer': instance.employer,
      'statedEmploymentBaseIncome': instance.statedEmploymentBaseIncome,
      'action': instance.action,
    };
