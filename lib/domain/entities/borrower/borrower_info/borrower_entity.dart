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

  @JsonKey(name: 'homePhoneNumber')
  final BorrowerHomePhoneNumberEntity? homePhoneNumber;

  @JsonKey(name: 'maritalStatus')
  final String? maritalStatus;

  @JsonKey(name: 'dependentAges')
  final List<int>? dependentAges;

  @JsonKey(name: 'spouseIsCoBorrowerIndicator')
  final bool? spouseIsCoBorrowerIndicator;

  @JsonKey(name: 'spouseEligibleForVABenefits')
  final bool? spouseEligibleForVABenefits;

  @JsonKey(name: 'militaryServiceExpectedCompletionDate')
  final DateTime? militaryServiceExpectedCompletionDate;

  @JsonKey(name: 'militaryStatusType')
  final String? militaryStatusType;

  @JsonKey(name: 'currentAddress')
  final BorrowerCurrentAddressEntity? currentAddress;

  @JsonKey(name: 'addresses')
  final List<BorrowerPreviousAddressesEntity>? prevAddresses;

  @JsonKey(name: 'isMailingAddressSameAsCurrent')
  final bool? isMailingAddressSameAsCurrent;

  @JsonKey(name: 'mailingAddress')
  final BorrowerMailingAddressEntity? mailingAddress;

  @JsonKey(name: 'incomes')
  final List<BorrowerIncomeEntity>? incomes;

  @JsonKey(name: 'intentToOccupy')
  final bool? intentToOccupy;

  @JsonKey(name: 'homeownerPastThreeYears')
  final bool? homeownerPastThreeYears;

  @JsonKey(name: 'priorPropertyUsageType')
  final String? priorPropertyUsageType;

  @JsonKey(name: 'priorPropertyTitleType')
  final String? priorPropertyTitleType;

  @JsonKey(name: 'specialBorrowerSellerRelationshipIndicator')
  final bool? specialBorrowerSellerRelationshipIndicator;

  @JsonKey(name: 'undisclosedBorrowedFundsIndicator')
  final bool? undisclosedBorrowedFundsIndicator;

  @JsonKey(name: 'undisclosedBorrowedFundsAmount')
  final num? undisclosedBorrowedFundsAmount;

  @JsonKey(name: 'undisclosedMortgageApplicationIndicator')
  final bool? undisclosedMortgageApplicationIndicator;

  @JsonKey(name: 'undisclosedCreditApplicationIndicator')
  final bool? undisclosedCreditApplicationIndicator;

  @JsonKey(name: 'propertySubjectToPriorityLienIndicator')
  final bool? propertySubjectToPriorityLienIndicator;

  @JsonKey(name: 'undisclosedComakerOfNoteIndicator')
  final bool? undisclosedComakerOfNoteIndicator;

  @JsonKey(name: 'outstandingJudgmentsIndicator')
  final bool? outstandingJudgmentsIndicator;

  @JsonKey(name: 'partyToLawsuitIndicator')
  final bool? partyToLawsuitIndicator;

  @JsonKey(name: 'presentlyDelinquentIndicator')
  final bool? presentlyDelinquentIndicator;

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
    this.homePhoneNumber,
    this.maritalStatus,
    this.dependentAges,
    this.spouseIsCoBorrowerIndicator,
    this.spouseEligibleForVABenefits,
    this.militaryServiceExpectedCompletionDate,
    this.militaryStatusType,
    this.currentAddress,
    this.prevAddresses,
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
        homePhoneNumber,
        maritalStatus,
        dependentAges,
        spouseIsCoBorrowerIndicator,
        spouseEligibleForVABenefits,
        militaryServiceExpectedCompletionDate,
        militaryStatusType,
        currentAddress,
        prevAddresses,
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
