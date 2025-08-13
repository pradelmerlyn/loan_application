// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'borrower_income_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BorrowerIncomeModel _$BorrowerIncomeModelFromJson(Map<String, dynamic> json) =>
    BorrowerIncomeModel(
      id: json['id'] as String?,
      incomeType: json['incomeType'] as String?,
      qualifiedMonthlyIncome:
          (json['qualifiedMonthlyIncome'] as num?)?.toDouble(),
      employer: json['employer'] == null
          ? null
          : BorrowerIncomeEmployerModel.fromJson(
              json['employer'] as Map<String, dynamic>),
      statedEmploymentBaseIncome: json['statedEmploymentBaseIncome'] == null
          ? null
          : BorrowerIncomeEmployerBaseIncomeModel.fromJson(
              json['statedEmploymentBaseIncome'] as Map<String, dynamic>),
      action: json['action'] as String?,
    );

Map<String, dynamic> _$BorrowerIncomeModelToJson(
        BorrowerIncomeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'incomeType': instance.incomeType,
      'qualifiedMonthlyIncome': instance.qualifiedMonthlyIncome,
      'employer': instance.employer?.toJson(),
      'statedEmploymentBaseIncome':
          instance.statedEmploymentBaseIncome?.toJson(),
      'action': instance.action,
    };
