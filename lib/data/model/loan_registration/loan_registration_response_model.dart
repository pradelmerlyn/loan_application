// data/model/loan_registration/loan_registration_response_model.dart
import 'package:json_annotation/json_annotation.dart';
import 'package:loan/data/model/borrower/borrower_info/borrower_model.dart';
import 'package:loan/data/model/financial_assets/asset_model.dart';
import 'package:loan/data/model/property/property_model.dart';
import 'package:loan/domain/entities/loan_registration/loan_registration_response_entity.dart';

part 'loan_registration_response_model.g.dart';

@JsonSerializable(explicitToJson: true)
class LoanRegistrationResponseModel extends LoanRegistrationResponseEntity {
  const LoanRegistrationResponseModel({
    super.borrowerBpUserId,
    super.loanNumber,
    super.id,
    BorrowerModel? super.borrower,
    List<AssetModel>? super.assets,
    super.loanPurpose,
    super.subjectPropertyFoundIndicator,
    PropertyModel? super.subjectProperty,
    super.loanAmount,
    super.refinanceCashOutDeterminationType,
    super.desiredCashOut,
    super.refinanceYourPrimaryHome,
    super.otc,
  });

  factory LoanRegistrationResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LoanRegistrationResponseModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$LoanRegistrationResponseModelToJson(this);
}
