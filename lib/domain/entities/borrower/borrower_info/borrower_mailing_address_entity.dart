import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'borrower_mailing_address_entity.g.dart';

@JsonSerializable()
class BorrowerMailingAddressEntity extends Equatable {
  @JsonKey(name: 'id')
  final String? id;

  @JsonKey(name: 'line')
  final String? line;

  @JsonKey(name: 'line2')
  final String? line2;

  @JsonKey(name: 'city')
  final String? city;

  @JsonKey(name: 'state')
  final String? state;

  @JsonKey(name: 'zipCode')
  final String? zipCode;

  @JsonKey(name: 'occupancyType')
  final String? occupancyType;

  @JsonKey(name: 'monthlyRentAmount')
  final double? monthlyRentAmount;

  @JsonKey(name: 'addressValidStart')
  final DateTime? addressValidStart;

  @JsonKey(name: 'addressValidEnd')
  final DateTime? addressValidEnd;

  @JsonKey(name: 'action')
  final String? action;

  const BorrowerMailingAddressEntity({
    this.id,
    this.line,
    this.line2,
    this.city,
    this.state,
    this.zipCode,
    this.occupancyType,
    this.monthlyRentAmount,
    this.addressValidStart,
    this.addressValidEnd,
    this.action,
  });

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

  factory BorrowerMailingAddressEntity.fromJson(Map<String, dynamic> json) =>
      _$BorrowerMailingAddressEntityFromJson(json);

  Map<String, dynamic> toJson() => _$BorrowerMailingAddressEntityToJson(this);
}
