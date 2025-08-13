import 'package:json_annotation/json_annotation.dart';
import 'package:loan/data/model/borrower/borrower_income/borrower_income_employer_address_model.dart';
import 'package:loan/domain/entities/borrower/borrower_income/borrower_income_employer_entity.dart';

part 'borrower_income_employer_model.g.dart';

@JsonSerializable(explicitToJson: true)
class BorrowerIncomeEmployerModel extends BorrowerIncomeEmployerEntity {
  const BorrowerIncomeEmployerModel({
    super.id,
    super.status,
    super.specialBorrowerEmployerRelationshipIndicator,
    super.name,
    super.phoneNumber,
    super.startDate,
    super.endDate,
    super.jobTitle,
    BorrowerIncomeEmployerAddressModel? address,
  }) : super(address: address);

  /// domain → model
  factory BorrowerIncomeEmployerModel.fromEntity(
    BorrowerIncomeEmployerEntity entity,
  ) {
    return BorrowerIncomeEmployerModel(
      id: entity.id,
      status: entity.status,
      specialBorrowerEmployerRelationshipIndicator:
          entity.specialBorrowerEmployerRelationshipIndicator,
      name: entity.name,
      phoneNumber: entity.phoneNumber,
      startDate: entity.startDate,
      endDate: entity.endDate,
      jobTitle: entity.jobTitle,
      address: entity.address != null
          ? BorrowerIncomeEmployerAddressModel.fromEntity(entity.address!)
          : null,
    );
  }

  factory BorrowerIncomeEmployerModel.fromJson(Map<String, dynamic> json) =>
      _$BorrowerIncomeEmployerModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$BorrowerIncomeEmployerModelToJson(this);

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
}
