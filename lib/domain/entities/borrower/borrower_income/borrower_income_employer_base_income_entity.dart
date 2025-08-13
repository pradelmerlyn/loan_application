import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'borrower_income_employer_base_income_entity.g.dart';

@JsonSerializable()
class BorrowerIncomeEmployerBaseIncomeEntity extends Equatable {
  @JsonKey(name: 'id')
  final String? id;

  @JsonKey(name: 'amount')
  final double? amount;

  const BorrowerIncomeEmployerBaseIncomeEntity({
    this.id,
    this.amount,
  });

  @override
  List<Object?> get props => [
        id,
        amount,
      ];

  factory BorrowerIncomeEmployerBaseIncomeEntity.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$BorrowerIncomeEmployerBaseIncomeEntityFromJson(json);

  Map<String, dynamic> toJson() =>
      _$BorrowerIncomeEmployerBaseIncomeEntityToJson(this);
}
