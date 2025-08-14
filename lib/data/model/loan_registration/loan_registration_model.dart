// loan_registration_model.dart
import 'package:json_annotation/json_annotation.dart';
import 'package:loan/data/model/borrower/borrower_info/borrower_model.dart';
import 'package:loan/data/model/financial_assets/asset_model.dart';
import 'package:loan/data/model/property/property_model.dart';
import 'package:loan/domain/entities/loan_registration/loan_registration_entity.dart';

part 'loan_registration_model.g.dart';

@JsonSerializable(explicitToJson: true)
class LoanRegistrationModel extends LoanRegistrationEntity {
  const LoanRegistrationModel({
    super.loanOfficerId,
    super.branchId,
    super.id,
    BorrowerModel? super.borrower,
    BorrowerModel? super.coBorrower,
    List<AssetModel>? super.assets,
    super.loanPurpose,
    super.subjectPropertyFoundIndicator,
    PropertyModel? super.subjectProperty,
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
