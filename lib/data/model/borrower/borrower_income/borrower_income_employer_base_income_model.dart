import 'package:json_annotation/json_annotation.dart';
import 'package:loan/domain/entities/borrower/borrower_income/borrower_income_employer_base_income_entity.dart';

part 'borrower_income_employer_base_income_model.g.dart';

@JsonSerializable()
class BorrowerIncomeEmployerBaseIncomeModel
    extends BorrowerIncomeEmployerBaseIncomeEntity {
  const BorrowerIncomeEmployerBaseIncomeModel({
    super.id,
    super.amount,
  });

  factory BorrowerIncomeEmployerBaseIncomeModel.fromEntity(
    BorrowerIncomeEmployerBaseIncomeEntity entity,
  ) {
    return BorrowerIncomeEmployerBaseIncomeModel(
      id: entity.id,
      amount: entity.amount,
    );
  }

  factory BorrowerIncomeEmployerBaseIncomeModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$BorrowerIncomeEmployerBaseIncomeModelFromJson(json);

  @override
  Map<String, dynamic> toJson() =>
      _$BorrowerIncomeEmployerBaseIncomeModelToJson(this);

  @override
  List<Object?> get props => [id, amount];
}
