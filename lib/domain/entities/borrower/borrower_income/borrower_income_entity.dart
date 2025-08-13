import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:loan/domain/entities/borrower/borrower_income/borrower_income_employer_base_income_entity.dart';
import 'package:loan/domain/entities/borrower/borrower_income/borrower_income_employer_entity.dart';

part 'borrower_income_entity.g.dart';

@JsonSerializable()
class BorrowerIncomeEntity extends Equatable {
  @JsonKey(name: 'id')
  final String? id;

  @JsonKey(name: 'incomeType')
  final String? incomeType;

  @JsonKey(name: 'qualifiedMonthlyIncome')
  final double? qualifiedMonthlyIncome;

  @JsonKey(name: 'employer')
  final BorrowerIncomeEmployerEntity? employer;

  @JsonKey(name: 'statedEmploymentBaseIncome')
  final BorrowerIncomeEmployerBaseIncomeEntity? statedEmploymentBaseIncome;

  @JsonKey(name: 'action')
  final String? action;

  const BorrowerIncomeEntity({
    this.id,
    this.incomeType,
    this.qualifiedMonthlyIncome,
    this.employer,
    this.statedEmploymentBaseIncome,
    this.action,
  });


  @override
  List<Object?> get props => [
    id,
    incomeType,
    qualifiedMonthlyIncome,
    employer,
    statedEmploymentBaseIncome,
    action,
  ];

  factory BorrowerIncomeEntity.fromJson(Map<String, dynamic> json) =>
      _$BorrowerIncomeEntityFromJson(json);

  Map<String, dynamic> toJson() => _$BorrowerIncomeEntityToJson(this);
}
