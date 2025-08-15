import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:loan/domain/entities/borrower/borrower_hmda/borrower_hmda_ethnicity_details_entity.dart';
import 'package:loan/domain/entities/borrower/borrower_hmda/borrower_hmda_gender_details_entity.dart';
import 'package:loan/domain/entities/borrower/borrower_hmda/borrower_hmda_race_details_entity.dart';
import 'package:loan/domain/entities/borrower/borrower_info/borrower_current_address_entity.dart';
import 'package:loan/domain/entities/borrower/borrower_info/borrower_home_phone_number_entity.dart';
import 'package:loan/domain/entities/borrower/borrower_info/borrower_mailing_address_entity.dart';
import 'package:loan/domain/entities/borrower/borrower_info/borrower_previous_addresses_entity.dart';
import 'package:loan/domain/entities/borrower/borrower_bankruptcy/borrower_bankruptcy_entity.dart';
import 'package:loan/domain/entities/borrower/borrower_income/borrower_income_entity.dart';

part 'borrower_entity.g.dart';

@JsonSerializable()
class BorrowerEntity extends Equatable {
  @JsonKey(name: 'id')
  final String? id;

  @JsonKey(name: 'firstName')
  final String? firstName;

  @JsonKey(name: 'middleName')
  final String? middleName;

  @JsonKey(name: 'lastName')
  final String? lastName;

  @JsonKey(name: 'suffixName')
  final String? suffixName;

  @JsonKey(name: 'dateOfBirth')
  final DateTime? dateOfBirth;

  @JsonKey(name: 'taxIdentifier')
  final String? taxIdentifier;

  @JsonKey(name: 'emailAddress')
  final String? emailAddress;

  @JsonKey(name: 'phoneNumbers')
  final List<BorrowerHomePhoneNumberEntity>? phoneNumbers;

  @JsonKey(name: 'maritalStatus', defaultValue: 'Married')
  final dynamic maritalStatus;

  @JsonKey(name: 'dependentAges')
  final List<dynamic>? dependentAges;

  @JsonKey(name: 'spouseIsCoBorrowerIndicator')
  final dynamic spouseIsCoBorrowerIndicator;

  @JsonKey(name: 'spouseEligibleForVABenefits')
  final dynamic spouseEligibleForVABenefits;

  @JsonKey(name: 'militaryServiceExpectedCompletionDate')
  final dynamic militaryServiceExpectedCompletionDate;

  @JsonKey(name: 'militaryStatusType')
  final dynamic militaryStatusType;

  @JsonKey(name: 'currentAddress')
  final BorrowerCurrentAddressEntity? currentAddress;

  @JsonKey(name: 'addresses')
  final List<BorrowerPreviousAddressesEntity>? addresses;

  @JsonKey(name: 'isMailingAddressSameAsCurrent', defaultValue: false)
  final dynamic isMailingAddressSameAsCurrent;

  @JsonKey(name: 'mailingAddress')
  final BorrowerMailingAddressEntity? mailingAddress;

  @JsonKey(name: 'incomes', defaultValue: [])
  final List<BorrowerIncomeEntity>? incomes;

  @JsonKey(name: 'intentToOccupy')
  final dynamic intentToOccupy;

  @JsonKey(name: 'homeownerPastThreeYears')
  final dynamic homeownerPastThreeYears;

  @JsonKey(name: 'priorPropertyUsageType')
  final dynamic priorPropertyUsageType;

  @JsonKey(name: 'priorPropertyTitleType')
  final dynamic priorPropertyTitleType;

  @JsonKey(name: 'specialBorrowerSellerRelationshipIndicator')
  final dynamic specialBorrowerSellerRelationshipIndicator;

  @JsonKey(name: 'undisclosedBorrowedFundsIndicator')
  final dynamic undisclosedBorrowedFundsIndicator;

  @JsonKey(name: 'undisclosedBorrowedFundsAmount')
  final num? undisclosedBorrowedFundsAmount;

  @JsonKey(name: 'undisclosedMortgageApplicationIndicator')
  final dynamic undisclosedMortgageApplicationIndicator;

  @JsonKey(name: 'undisclosedCreditApplicationIndicator')
  final dynamic undisclosedCreditApplicationIndicator;

  @JsonKey(name: 'propertySubjectToPriorityLienIndicator')
  final dynamic propertySubjectToPriorityLienIndicator;

  @JsonKey(name: 'undisclosedComakerOfNoteIndicator')
  final dynamic undisclosedComakerOfNoteIndicator;

  @JsonKey(name: 'outstandingJudgmentsIndicator')
  final dynamic outstandingJudgmentsIndicator;

  @JsonKey(name: 'partyToLawsuitIndicator')
  final dynamic partyToLawsuitIndicator;

  @JsonKey(name: 'presentlyDelinquentIndicator')
  final dynamic presentlyDelinquentIndicator;

  @JsonKey(name: 'priorPropertyDeedInLieuConveyedIndicator')
  final bool? priorPropertyDeedInLieuConveyedIndicator;

  @JsonKey(name: 'deedInLieuLatestCompletionDate')
  final DateTime? deedInLieuLatestCompletionDate;

  @JsonKey(name: 'priorPropertyShortSaleCompletedIndicator')
  final bool? priorPropertyShortSaleCompletedIndicator;

  @JsonKey(name: 'shortSaleLatestCompletionDate')
  final DateTime? shortSaleLatestCompletionDate;

  @JsonKey(name: 'priorPropertyForeclosureCompletedIndicator')
  final bool? priorPropertyForeclosureCompletedIndicator;

  @JsonKey(name: 'foreclosureLatestCompletionDate')
  final DateTime? foreclosureLatestCompletionDate;

  @JsonKey(name: 'bankruptcyIndicator')
  final bool? bankruptcyIndicator;

  @JsonKey(name: 'bankruptcies')
  final List<BorrowerBankruptcyEntity>? bankruptcies;

  @JsonKey(name: 'hmdaGenderDetails')
  final BorrowerHmdaGenderDetailsEntity? hmdaGenderDetails;

  @JsonKey(name: 'hmdaEthnicityDetails')
  final BorrowerHmdaEthnicityDetailsEntity? hmdaEthnicityDetails;

  @JsonKey(name: 'hmdaRaceDetails')
  final BorrowerHmdaRaceDetailsEntity? hmdaRaceDetails;

  @JsonKey(name: 'action')
  final String? action;

  @JsonKey(name: 'currentTotalMonthlyHousingExpense')
  final num? currentTotalMonthlyHousingExpense;

  @JsonKey(name: 'livedMoreThanTwoYears')
  final bool? livedMoreThanTwoYears;

  const BorrowerEntity({
    this.id,
    this.firstName,
    this.middleName,
    this.lastName,
    this.suffixName,
    this.dateOfBirth,
    this.taxIdentifier,
    this.emailAddress,
    this.phoneNumbers,
    this.maritalStatus,
    this.dependentAges,
    this.spouseIsCoBorrowerIndicator,
    this.spouseEligibleForVABenefits,
    this.militaryServiceExpectedCompletionDate,
    this.militaryStatusType,
    this.currentAddress,
    this.addresses,
    this.isMailingAddressSameAsCurrent,
    this.mailingAddress,
    this.incomes,
    this.intentToOccupy,
    this.homeownerPastThreeYears,
    this.priorPropertyUsageType,
    this.priorPropertyTitleType,
    this.specialBorrowerSellerRelationshipIndicator,
    this.undisclosedBorrowedFundsIndicator,
    this.undisclosedBorrowedFundsAmount,
    this.undisclosedMortgageApplicationIndicator,
    this.undisclosedCreditApplicationIndicator,
    this.propertySubjectToPriorityLienIndicator,
    this.undisclosedComakerOfNoteIndicator,
    this.outstandingJudgmentsIndicator,
    this.partyToLawsuitIndicator,
    this.presentlyDelinquentIndicator,
    this.priorPropertyDeedInLieuConveyedIndicator,
    this.deedInLieuLatestCompletionDate,
    this.priorPropertyShortSaleCompletedIndicator,
    this.shortSaleLatestCompletionDate,
    this.priorPropertyForeclosureCompletedIndicator,
    this.foreclosureLatestCompletionDate,
    this.bankruptcyIndicator,
    this.bankruptcies,
    this.hmdaGenderDetails,
    this.hmdaEthnicityDetails,
    this.hmdaRaceDetails,
    this.action,
    this.currentTotalMonthlyHousingExpense,
    this.livedMoreThanTwoYears,
  });

  @override
  List<Object?> get props => [
        id,
        firstName,
        middleName,
        lastName,
        suffixName,
        dateOfBirth,
        taxIdentifier,
        emailAddress,
        phoneNumbers,
        maritalStatus,
        dependentAges,
        spouseIsCoBorrowerIndicator,
        spouseEligibleForVABenefits,
        militaryServiceExpectedCompletionDate,
        militaryStatusType,
        currentAddress,
        addresses,
        isMailingAddressSameAsCurrent,
        mailingAddress,
        incomes,
        intentToOccupy,
        homeownerPastThreeYears,
        priorPropertyUsageType,
        priorPropertyTitleType,
        specialBorrowerSellerRelationshipIndicator,
        undisclosedBorrowedFundsIndicator,
        undisclosedBorrowedFundsAmount,
        undisclosedMortgageApplicationIndicator,
        undisclosedCreditApplicationIndicator,
        propertySubjectToPriorityLienIndicator,
        undisclosedComakerOfNoteIndicator,
        outstandingJudgmentsIndicator,
        partyToLawsuitIndicator,
        presentlyDelinquentIndicator,
        priorPropertyDeedInLieuConveyedIndicator,
        deedInLieuLatestCompletionDate,
        priorPropertyShortSaleCompletedIndicator,
        shortSaleLatestCompletionDate,
        priorPropertyForeclosureCompletedIndicator,
        foreclosureLatestCompletionDate,
        bankruptcyIndicator,
        bankruptcies,
        hmdaEthnicityDetails,
        hmdaRaceDetails,
        action,
        currentTotalMonthlyHousingExpense,
        livedMoreThanTwoYears,
      ];

  factory BorrowerEntity.fromJson(Map<String, dynamic> json) =>
      _$BorrowerEntityFromJson(json);

  Map<String, dynamic> toJson() => _$BorrowerEntityToJson(this);
}
