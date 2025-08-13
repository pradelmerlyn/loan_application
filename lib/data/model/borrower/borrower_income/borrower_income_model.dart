import 'package:json_annotation/json_annotation.dart';
import 'package:loan/data/model/borrower/borrower_income/borrower_income_employer_base_income_model.dart';
import 'package:loan/data/model/borrower/borrower_income/borrower_income_employer_model.dart';
import 'package:loan/domain/entities/borrower/borrower_income/borrower_income_entity.dart';

part 'borrower_income_model.g.dart';

@JsonSerializable(explicitToJson: true)
class BorrowerIncomeModel extends BorrowerIncomeEntity {
  const BorrowerIncomeModel({
    super.id,
    super.incomeType,
    super.qualifiedMonthlyIncome,
    BorrowerIncomeEmployerModel? employer,
    BorrowerIncomeEmployerBaseIncomeModel? statedEmploymentBaseIncome,
    super.action,
  }) : super(statedEmploymentBaseIncome: statedEmploymentBaseIncome);

  
  factory BorrowerIncomeModel.fromEntity(BorrowerIncomeEntity entity) {
    return BorrowerIncomeModel(
      id: entity.id,
      incomeType: entity.incomeType,
      qualifiedMonthlyIncome: entity.qualifiedMonthlyIncome,
      employer: entity.employer != null
          ? BorrowerIncomeEmployerModel.fromEntity(entity.employer!)
          : null,
      statedEmploymentBaseIncome: entity.statedEmploymentBaseIncome != null
          ? BorrowerIncomeEmployerBaseIncomeModel.fromEntity(
              entity.statedEmploymentBaseIncome!,
            )
          : null,
      action: entity.action,
    );
  }

  factory BorrowerIncomeModel.fromJson(Map<String, dynamic> json) =>
      _$BorrowerIncomeModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$BorrowerIncomeModelToJson(this);
}
