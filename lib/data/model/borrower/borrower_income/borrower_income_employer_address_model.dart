import 'package:json_annotation/json_annotation.dart';
import 'package:loan/domain/entities/borrower/borrower_income/borrower_income_employer_address_entity.dart';

part 'borrower_income_employer_address_model.g.dart';

@JsonSerializable()
class BorrowerIncomeEmployerAddressModel
    extends BorrowerIncomeEmployerAddressEntity {
  const BorrowerIncomeEmployerAddressModel({
    super.id,
    super.line,
    super.line2,
    super.city,
    super.state,
    super.zipCode,
    super.occupancyType,
    super.monthlyRentAmount,
    super.addressValidStart,
    super.addressValidEnd,
    super.action,
  });

  /// Domain → Model mapping
  factory BorrowerIncomeEmployerAddressModel.fromEntity(
    BorrowerIncomeEmployerAddressEntity entity,
  ) {
    return BorrowerIncomeEmployerAddressModel(
      id: entity.id,
      line: entity.line,
      line2: entity.line2,
      city: entity.city,
      state: entity.state,
      zipCode: entity.zipCode,
      occupancyType: entity.occupancyType,
      monthlyRentAmount: entity.monthlyRentAmount,
      addressValidStart: entity.addressValidStart,
      addressValidEnd: entity.addressValidEnd,
      action: entity.action,
    );
  }

  factory BorrowerIncomeEmployerAddressModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$BorrowerIncomeEmployerAddressModelFromJson(json);

  @override
  Map<String, dynamic> toJson() =>
      _$BorrowerIncomeEmployerAddressModelToJson(this);

  @override
  List<Object?> get props => [
        id,
        line,
        line2,
        city,
        state,
        zipCode,
        occupancyType,
        monthlyRentAmount,
        addressValidStart,
        addressValidEnd,
        action,
      ];
}
