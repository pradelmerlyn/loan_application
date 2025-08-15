// loan_registration_model.dart
import 'package:json_annotation/json_annotation.dart';
import 'package:loan/domain/entities/borrower/borrower_info/borrower_entity.dart';
import 'package:loan/domain/entities/financial_assets/asset_entity.dart';
import 'package:loan/domain/entities/loan_registration/loan_registration_entity.dart';
import 'package:loan/domain/entities/property/property_entity.dart';

part 'loan_registration_model.g.dart';

@JsonSerializable(explicitToJson: true)
class LoanRegistrationModel extends LoanRegistrationEntity {
  const LoanRegistrationModel({
    super.loanOfficerId,
    super.branchId,
    super.id,
    super.borrower,
    super.coBorrower,
    super.assets,
    super.loanPurpose,
    super.subjectPropertyFoundIndicator,
    super.subjectProperty,
    super.loanAmount,
    super.refinanceCashOutDeterminationType,
    super.desiredCashOut,
    super.refinanceYourPrimaryHome,
  });

  factory LoanRegistrationModel.fromJson(Map<String, dynamic> json) =>
      _$LoanRegistrationModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$LoanRegistrationModelToJson(this);
}
