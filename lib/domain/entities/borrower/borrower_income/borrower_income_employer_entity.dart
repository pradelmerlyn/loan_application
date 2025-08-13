import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'borrower_income_employer_address_entity.dart';

part 'borrower_income_employer_entity.g.dart';

@JsonSerializable()
class BorrowerIncomeEmployerEntity extends Equatable {
  @JsonKey(name: 'id')
  final String? id;

  @JsonKey(name: 'status')
  final String? status;

  @JsonKey(name: 'specialBorrowerEmployerRelationshipIndicator')
  final bool? specialBorrowerEmployerRelationshipIndicator;

  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'phoneNumber')
  final String? phoneNumber;

  @JsonKey(name: 'startDate')
  final DateTime? startDate;

  @JsonKey(name: 'endDate')
  final DateTime? endDate;

  @JsonKey(name: 'jobTitle')
  final String? jobTitle;

  @JsonKey(name: 'address')
  final BorrowerIncomeEmployerAddressEntity? address;

  const BorrowerIncomeEmployerEntity({
    this.id,
    this.status,
    this.specialBorrowerEmployerRelationshipIndicator,
    this.name,
    this.phoneNumber,
    this.startDate,
    this.endDate,
    this.jobTitle,
    this.address,
  });

  @override
  List<Object?> get props => [
        id,
        status,
        specialBorrowerEmployerRelationshipIndicator,
        name,
        phoneNumber,
        startDate,
        endDate,
        jobTitle,
        address,
      ];

  factory BorrowerIncomeEmployerEntity.fromJson(Map<String, dynamic> json) =>
      _$BorrowerIncomeEmployerEntityFromJson(json);

  Map<String, dynamic> toJson() => _$BorrowerIncomeEmployerEntityToJson(this);
}
