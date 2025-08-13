// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'borrower_income_employer_base_income_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BorrowerIncomeEmployerBaseIncomeEntity
    _$BorrowerIncomeEmployerBaseIncomeEntityFromJson(
            Map<String, dynamic> json) =>
        BorrowerIncomeEmployerBaseIncomeEntity(
          id: json['id'] as String?,
          amount: (json['amount'] as num?)?.toDouble(),
        );

Map<String, dynamic> _$BorrowerIncomeEmployerBaseIncomeEntityToJson(
        BorrowerIncomeEmployerBaseIncomeEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'amount': instance.amount,
    };
