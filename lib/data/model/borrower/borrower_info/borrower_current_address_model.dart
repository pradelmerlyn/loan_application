import 'package:json_annotation/json_annotation.dart';
import 'package:loan/domain/entities/borrower/borrower_info/borrower_current_address_entity.dart';

part 'borrower_current_address_model.g.dart';

@JsonSerializable()
class BorrowerCurrentAddressModel extends BorrowerCurrentAddressEntity {
  const BorrowerCurrentAddressModel({
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

  factory BorrowerCurrentAddressModel.fromEntity(
    BorrowerCurrentAddressEntity entity,
  ) =>
      BorrowerCurrentAddressModel(
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

  factory BorrowerCurrentAddressModel.fromJson(Map<String, dynamic> json) =>
      _$BorrowerCurrentAddressModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$BorrowerCurrentAddressModelToJson(this);
}
