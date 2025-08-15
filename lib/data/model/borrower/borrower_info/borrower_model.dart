import 'package:json_annotation/json_annotation.dart';
// nested models
import 'package:loan/data/model/borrower/borrower_bankruptcy/borrower_bankruptcy_model.dart';
import 'package:loan/data/model/borrower/borrower_hmda/borrower_hmda_ethnicity_details_model.dart';
import 'package:loan/data/model/borrower/borrower_hmda/borrower_hmda_gender_details_model.dart';
import 'package:loan/data/model/borrower/borrower_hmda/borrower_hmda_race_details_model.dart';
import 'package:loan/data/model/borrower/borrower_income/borrower_income_model.dart';
import 'package:loan/data/model/borrower/borrower_info/borrower_current_address_model.dart';
import 'package:loan/data/model/borrower/borrower_info/borrower_home_phone_number_model.dart';
import 'package:loan/data/model/borrower/borrower_info/borrower_mailing_address_model.dart';
import 'package:loan/data/model/borrower/borrower_info/borrower_previous_addresses_model.dart';
import 'package:loan/domain/entities/borrower/borrower_bankruptcy/borrower_bankruptcy_entity.dart';
import 'package:loan/domain/entities/borrower/borrower_hmda/borrower_hmda_ethnicity_details_entity.dart';
import 'package:loan/domain/entities/borrower/borrower_hmda/borrower_hmda_gender_details_entity.dart';
import 'package:loan/domain/entities/borrower/borrower_hmda/borrower_hmda_race_details_entity.dart';
import 'package:loan/domain/entities/borrower/borrower_income/borrower_income_entity.dart';
import 'package:loan/domain/entities/borrower/borrower_info/borrower_current_address_entity.dart';
import 'package:loan/domain/entities/borrower/borrower_info/borrower_entity.dart';
import 'package:loan/domain/entities/borrower/borrower_info/borrower_home_phone_number_entity.dart';
import 'package:loan/domain/entities/borrower/borrower_info/borrower_mailing_address_entity.dart';
import 'package:loan/domain/entities/borrower/borrower_info/borrower_previous_addresses_entity.dart';

part 'borrower_model.g.dart';

@JsonSerializable(explicitToJson: true)
class BorrowerModel extends BorrowerEntity {
  const BorrowerModel({
    // scalars
    super.id,
    super.firstName,
    super.middleName,
    super.lastName,
    super.suffixName,
    super.dateOfBirth,
    super.taxIdentifier,
    super.emailAddress,
    super.maritalStatus,
    super.dependentAges,
    super.spouseIsCoBorrowerIndicator,
    super.spouseEligibleForVABenefits,
    super.militaryServiceExpectedCompletionDate,
    super.militaryStatusType,
    super.isMailingAddressSameAsCurrent,
    super.intentToOccupy,
    super.homeownerPastThreeYears,
    super.priorPropertyUsageType,
    super.priorPropertyTitleType,
    super.specialBorrowerSellerRelationshipIndicator,
    super.undisclosedBorrowedFundsIndicator,
    super.undisclosedBorrowedFundsAmount,
    super.undisclosedMortgageApplicationIndicator,
    super.undisclosedCreditApplicationIndicator,
    super.propertySubjectToPriorityLienIndicator,
    super.undisclosedComakerOfNoteIndicator,
    super.outstandingJudgmentsIndicator,
    super.partyToLawsuitIndicator,
    super.presentlyDelinquentIndicator,
    super.priorPropertyDeedInLieuConveyedIndicator,
    super.deedInLieuLatestCompletionDate,
    super.priorPropertyShortSaleCompletedIndicator,
    super.shortSaleLatestCompletionDate,
    super.priorPropertyForeclosureCompletedIndicator,
    super.foreclosureLatestCompletionDate,
    super.bankruptcyIndicator,
    super.action,
    super.currentTotalMonthlyHousingExpense,
    super.livedMoreThanTwoYears,
    super.phoneNumbers,

    // nested models (FIX: phoneNumbers must be a LIST)
    // List<BorrowerHomePhoneNumberModel>? super.phoneNumbers,
    super.currentAddress,
    super.addresses,
    super.mailingAddress,
    super.incomes,
    super.bankruptcies,
    super.hmdaGenderDetails,
    super.hmdaEthnicityDetails,
    super.hmdaRaceDetails,
  });

  /// Domain Entity -> Data Model
  factory BorrowerModel.fromEntity(BorrowerEntity e) => BorrowerModel(
        id: e.id,
        firstName: e.firstName,
        middleName: e.middleName,
        lastName: e.lastName,
        suffixName: e.suffixName,
        dateOfBirth: e.dateOfBirth,
        taxIdentifier: e.taxIdentifier,
        emailAddress: e.emailAddress,
        maritalStatus: e.maritalStatus,
        dependentAges: e.dependentAges,
        spouseIsCoBorrowerIndicator: e.spouseIsCoBorrowerIndicator,
        spouseEligibleForVABenefits: e.spouseEligibleForVABenefits,
        militaryServiceExpectedCompletionDate:
            e.militaryServiceExpectedCompletionDate,
        militaryStatusType: e.militaryStatusType,
        isMailingAddressSameAsCurrent: e.isMailingAddressSameAsCurrent,
        intentToOccupy: e.intentToOccupy,
        homeownerPastThreeYears: e.homeownerPastThreeYears,
        priorPropertyUsageType: e.priorPropertyUsageType,
        priorPropertyTitleType: e.priorPropertyTitleType,
        specialBorrowerSellerRelationshipIndicator:
            e.specialBorrowerSellerRelationshipIndicator,
        undisclosedBorrowedFundsIndicator: e.undisclosedBorrowedFundsIndicator,
        undisclosedBorrowedFundsAmount: e.undisclosedBorrowedFundsAmount,
        undisclosedMortgageApplicationIndicator:
            e.undisclosedMortgageApplicationIndicator,
        undisclosedCreditApplicationIndicator:
            e.undisclosedCreditApplicationIndicator,
        propertySubjectToPriorityLienIndicator:
            e.propertySubjectToPriorityLienIndicator,
        undisclosedComakerOfNoteIndicator: e.undisclosedComakerOfNoteIndicator,
        outstandingJudgmentsIndicator: e.outstandingJudgmentsIndicator,
        partyToLawsuitIndicator: e.partyToLawsuitIndicator,
        presentlyDelinquentIndicator: e.presentlyDelinquentIndicator,
        priorPropertyDeedInLieuConveyedIndicator:
            e.priorPropertyDeedInLieuConveyedIndicator,
        deedInLieuLatestCompletionDate: e.deedInLieuLatestCompletionDate,
        priorPropertyShortSaleCompletedIndicator:
            e.priorPropertyShortSaleCompletedIndicator,
        shortSaleLatestCompletionDate: e.shortSaleLatestCompletionDate,
        priorPropertyForeclosureCompletedIndicator:
            e.priorPropertyForeclosureCompletedIndicator,
        foreclosureLatestCompletionDate: e.foreclosureLatestCompletionDate,
        bankruptcyIndicator: e.bankruptcyIndicator,
        action: e.action,
        currentTotalMonthlyHousingExpense: 0,
        livedMoreThanTwoYears: e.livedMoreThanTwoYears,

        // nested -> lists mapped element-by-element
        phoneNumbers: e.phoneNumbers
            ?.map((p) => BorrowerHomePhoneNumberModel.fromEntity(p))
            .toList(),
        currentAddress: e.currentAddress != null
            ? BorrowerCurrentAddressModel.fromEntity(e.currentAddress!)
            : null,
        addresses: e.addresses
            ?.map((x) => BorrowerPreviousAddressesModel.fromEntity(x))
            .toList(),
        mailingAddress: e.mailingAddress != null
            ? BorrowerMailingAddressModel.fromEntity(e.mailingAddress!)
            : null,
        incomes: e.incomes != null
            ? e.incomes!.map((x) => BorrowerIncomeModel.fromEntity(x)).toList()
            : [],
        bankruptcies: e.bankruptcies
            ?.map((x) => BorrowerBankruptcyModel.fromEntity(x))
            .toList(),
        hmdaGenderDetails: e.hmdaGenderDetails != null
            ? BorrowerHmdaGenderDetailsModel.fromEntity(e.hmdaGenderDetails!)
            : null,
        hmdaEthnicityDetails: e.hmdaEthnicityDetails != null
            ? BorrowerHmdaEthnicityDetailsModel.fromEntity(
                e.hmdaEthnicityDetails!,
              )
            : null,
        hmdaRaceDetails: e.hmdaRaceDetails != null
            ? BorrowerHmdaRaceDetailsModel.fromEntity(e.hmdaRaceDetails!)
            : null,
      );

  factory BorrowerModel.fromJson(Map<String, dynamic> json) =>
      _$BorrowerModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$BorrowerModelToJson(this);
}
