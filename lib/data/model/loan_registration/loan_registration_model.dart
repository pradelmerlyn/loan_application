import 'package:json_annotation/json_annotation.dart';
import 'package:loan/data/model/borrower/borrower_info/borrower_model.dart';
import 'package:loan/data/model/financial_assets/asset_model.dart';
import 'package:loan/data/model/property/property_model.dart';
import 'package:loan/domain/entities/loan_registration/loan_registration_entity.dart';

part 'loan_registration_model.g.dart';

@JsonSerializable()
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

  /// Domain → Model mapper (handles all nested conversions)
  factory LoanRegistrationModel.fromEntity(LoanRegistrationEntity e) {
    return LoanRegistrationModel(
      // default loanOfficerId = "maine" if null
      loanOfficerId: e.loanOfficerId ?? 'maine',
      branchId: e.branchId,
      id: e.id,
      borrower:
          e.borrower != null ? BorrowerModel.fromEntity(e.borrower!) : null,
      coBorrower:
          e.coBorrower != null ? BorrowerModel.fromEntity(e.coBorrower!) : null,
      assets: e.assets?.map((a) => AssetModel.fromEntity(a)).toList(),
      loanPurpose: e.loanPurpose,
      subjectPropertyFoundIndicator: e.subjectPropertyFoundIndicator,
      subjectProperty: e.subjectProperty != null
          ? PropertyModel.fromEntity(e.subjectProperty!)
          : null,
      loanAmount: e.loanAmount,
      refinanceCashOutDeterminationType: e.refinanceCashOutDeterminationType,
      desiredCashOut: e.desiredCashOut,
      refinanceYourPrimaryHome: e.refinanceYourPrimaryHome,
    );
  }

  factory LoanRegistrationModel.fromJson(Map<String, dynamic> json) =>
      _$LoanRegistrationModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$LoanRegistrationModelToJson(this);

  @override
  List<Object?> get props => [
        loanOfficerId,
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
}
