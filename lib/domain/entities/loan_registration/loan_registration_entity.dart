import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:loan/domain/entities/borrower/borrower_info/borrower_entity.dart';
import 'package:loan/domain/entities/financial_assets/asset_entity.dart';
import 'package:loan/domain/entities/property/property_entity.dart';

part 'loan_registration_entity.g.dart';

@JsonSerializable()
class LoanRegistrationEntity extends Equatable {
  @JsonKey(name: 'loanOfficerId')
  final String? loanOfficerId;

  @JsonKey(name: 'loanNumber')
  final dynamic loanNumber;

  @JsonKey(name: 'branchId')
  final String? branchId;

  @JsonKey(name: 'id')
  final dynamic id;

    @JsonKey(name: 'applicationId')
  final dynamic applicationId;

  @JsonKey(name: 'borrower')
  final BorrowerEntity? borrower;

  @JsonKey(name: 'coBorrower')
  final BorrowerEntity? coBorrower;

  @JsonKey(name: 'assets', defaultValue: [])
  final List<AssetEntity>? assets;

  @JsonKey(name: 'loanPurpose')
  final String? loanPurpose;

  @JsonKey(name: 'subjectPropertyFoundIndicator')
  final bool? subjectPropertyFoundIndicator;

  @JsonKey(name: 'subjectProperty', includeIfNull: false)
  final PropertyEntity? subjectProperty;

  @JsonKey(name: 'loanAmount')
  final num? loanAmount;

  @JsonKey(name: 'refinanceCashOutDeterminationType')
  final String? refinanceCashOutDeterminationType;

  @JsonKey(name: 'desiredCashOut')
  final double? desiredCashOut;

  @JsonKey(name: 'refinanceYourPrimaryHome')
  final bool? refinanceYourPrimaryHome;

  const LoanRegistrationEntity({
    this.loanOfficerId,
    this.loanNumber,
    this.applicationId,
    this.branchId,
    this.id,
    this.borrower,
    this.coBorrower,
    this.assets,
    this.loanPurpose,
    this.subjectPropertyFoundIndicator,
    this.subjectProperty,
    this.loanAmount,
    this.refinanceCashOutDeterminationType,
    this.desiredCashOut,
    this.refinanceYourPrimaryHome,
  });

  @override
  List<Object?> get props => [
        loanOfficerId,
        applicationId,
        branchId,
        id,
        borrower,
        coBorrower,
        assets,
        loanPurpose,
        subjectPropertyFoundIndicator,
        subjectProperty,
        loanAmount,
        refinanceCashOutDeterminationType,
        desiredCashOut,
        refinanceYourPrimaryHome,
      ];

  factory LoanRegistrationEntity.fromJson(Map<String, dynamic> json) =>
      _$LoanRegistrationEntityFromJson(json);

  Map<String, dynamic> toJson() => _$LoanRegistrationEntityToJson(this);
}
