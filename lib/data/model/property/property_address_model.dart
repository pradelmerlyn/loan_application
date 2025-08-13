import 'package:json_annotation/json_annotation.dart';
import 'package:loan/domain/entities/property/property_address_entity.dart';

part 'property_address_model.g.dart';

@JsonSerializable()
class PropertyAddressModel extends PropertyAddressEntity {
  const PropertyAddressModel({
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

  factory PropertyAddressModel.fromEntity(PropertyAddressEntity e) =>
      PropertyAddressModel(
        id: e.id,
        line: e.line,
        line2: e.line2,
        city: e.city,
        state: e.state,
        zipCode: e.zipCode,
        occupancyType: e.occupancyType,
        monthlyRentAmount: e.monthlyRentAmount,
        addressValidStart: e.addressValidStart,
        addressValidEnd: e.addressValidEnd,
        action: e.action,
      );

  factory PropertyAddressModel.fromJson(Map<String, dynamic> json) =>
      _$PropertyAddressModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PropertyAddressModelToJson(this);

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
