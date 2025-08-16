import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:loan/domain/entities/borrower/borrower_info/borrower_entity.dart';
import 'package:loan/domain/entities/financial_assets/asset_entity.dart';
import 'package:loan/domain/entities/property/property_entity.dart';

part 'loan_registration_response_entity.g.dart';

@JsonSerializable()
class LoanRegistrationResponseEntity extends Equatable {
  @JsonKey(name: 'borrowerBpUserId')
  final dynamic borrowerBpUserId;

  @JsonKey(name: 'loanNumber')
  final dynamic loanNumber;

  @JsonKey(name: 'id')
  final String? id;

   @JsonKey(name: 'applicationId')
  final String? applicationId;

  @JsonKey(name: 'borrower')
  final BorrowerEntity? borrower;

  @JsonKey(name: 'assets', defaultValue: [])
  final List<AssetEntity>? assets;

  @JsonKey(name: 'loanPurpose')
  final dynamic loanPurpose;

  @JsonKey(name: 'subjectPropertyFoundIndicator')
  final bool? subjectPropertyFoundIndicator;

  @JsonKey(name: 'subjectProperty', includeIfNull: false)
  final PropertyEntity? subjectProperty;

  @JsonKey(name: 'loanAmount')
  final dynamic loanAmount;

  @JsonKey(name: 'refinanceCashOutDeterminationType')
  final String? refinanceCashOutDeterminationType;

  @JsonKey(name: 'desiredCashOut')
  final double? desiredCashOut;

  @JsonKey(name: 'refinanceYourPrimaryHome')
  final bool? refinanceYourPrimaryHome;

  @JsonKey(name: 'otc')
  final String? otc;

  const LoanRegistrationResponseEntity({
    this.borrowerBpUserId,
    this.loanNumber,
    this.id,
    this.applicationId,
    this.borrower,
    this.assets,
    this.loanPurpose,
    this.subjectPropertyFoundIndicator,
    this.subjectProperty,
    this.loanAmount,
    this.refinanceCashOutDeterminationType,
    this.desiredCashOut,
    this.refinanceYourPrimaryHome,
    this.otc,
  });

  factory LoanRegistrationResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$LoanRegistrationResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$LoanRegistrationResponseEntityToJson(this);

  @override
  List<Object?> get props => [
        borrowerBpUserId,
        loanNumber,
        applicationId,
        id,
        borrower,
        assets,
        loanPurpose,
        subjectPropertyFoundIndicator,
        subjectProperty,
        loanAmount,
        refinanceCashOutDeterminationType,
        desiredCashOut,
        refinanceYourPrimaryHome,
        otc,
      ];
}
