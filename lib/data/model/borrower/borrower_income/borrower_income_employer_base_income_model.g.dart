// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'borrower_income_employer_base_income_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BorrowerIncomeEmployerBaseIncomeModel
    _$BorrowerIncomeEmployerBaseIncomeModelFromJson(
            Map<String, dynamic> json) =>
        BorrowerIncomeEmployerBaseIncomeModel(
          id: json['id'] as String?,
          amount: (json['amount'] as num?)?.toDouble(),
        );

Map<String, dynamic> _$BorrowerIncomeEmployerBaseIncomeModelToJson(
        BorrowerIncomeEmployerBaseIncomeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'amount': instance.amount,
    };
