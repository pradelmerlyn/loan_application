// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'borrower_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BorrowerEntity _$BorrowerEntityFromJson(Map<String, dynamic> json) =>
    BorrowerEntity(
      id: json['id'] as String?,
      firstName: json['firstName'] as String?,
      middleName: json['middleName'] as String?,
      lastName: json['lastName'] as String?,
      suffixName: json['suffixName'] as String?,
      dateOfBirth: json['dateOfBirth'] == null
          ? null
          : DateTime.parse(json['dateOfBirth'] as String),
      taxIdentifier: json['taxIdentifier'] as String?,
      emailAddress: json['emailAddress'] as String?,
      phoneNumbers: (json['phoneNumbers'] as List<dynamic>?)
          ?.map((e) =>
              BorrowerHomePhoneNumberEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      maritalStatus: json['maritalStatus'] ?? 'Married',
      dependentAges: json['dependentAges'] as List<dynamic>?,
      spouseIsCoBorrowerIndicator: json['spouseIsCoBorrowerIndicator'],
      spouseEligibleForVABenefits: json['spouseEligibleForVABenefits'],
      militaryServiceExpectedCompletionDate:
          json['militaryServiceExpectedCompletionDate'],
      militaryStatusType: json['militaryStatusType'],
      currentAddress: json['currentAddress'] == null
          ? null
          : BorrowerCurrentAddressEntity.fromJson(
              json['currentAddress'] as Map<String, dynamic>),
      addresses: (json['addresses'] as List<dynamic>?)
          ?.map((e) => BorrowerPreviousAddressesEntity.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      isMailingAddressSameAsCurrent:
          json['isMailingAddressSameAsCurrent'] ?? false,
      mailingAddress: json['mailingAddress'] == null
          ? null
          : BorrowerMailingAddressEntity.fromJson(
              json['mailingAddress'] as Map<String, dynamic>),
      incomes: (json['incomes'] as List<dynamic>?)
              ?.map((e) =>
                  BorrowerIncomeEntity.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      intentToOccupy: json['intentToOccupy'],
      homeownerPastThreeYears: json['homeownerPastThreeYears'],
      priorPropertyUsageType: json['priorPropertyUsageType'],
      priorPropertyTitleType: json['priorPropertyTitleType'],
      specialBorrowerSellerRelationshipIndicator:
          json['specialBorrowerSellerRelationshipIndicator'],
      undisclosedBorrowedFundsIndicator:
          json['undisclosedBorrowedFundsIndicator'],
      undisclosedBorrowedFundsAmount:
          json['undisclosedBorrowedFundsAmount'] as num?,
      undisclosedMortgageApplicationIndicator:
          json['undisclosedMortgageApplicationIndicator'],
      undisclosedCreditApplicationIndicator:
          json['undisclosedCreditApplicationIndicator'],
      propertySubjectToPriorityLienIndicator:
          json['propertySubjectToPriorityLienIndicator'],
      undisclosedComakerOfNoteIndicator:
          json['undisclosedComakerOfNoteIndicator'],
      outstandingJudgmentsIndicator: json['outstandingJudgmentsIndicator'],
      partyToLawsuitIndicator: json['partyToLawsuitIndicator'],
      presentlyDelinquentIndicator: json['presentlyDelinquentIndicator'],
      priorPropertyDeedInLieuConveyedIndicator:
          json['priorPropertyDeedInLieuConveyedIndicator'] as bool?,
      deedInLieuLatestCompletionDate: json['deedInLieuLatestCompletionDate'] ==
              null
          ? null
          : DateTime.parse(json['deedInLieuLatestCompletionDate'] as String),
      priorPropertyShortSaleCompletedIndicator:
          json['priorPropertyShortSaleCompletedIndicator'] as bool?,
      shortSaleLatestCompletionDate:
          json['shortSaleLatestCompletionDate'] == null
              ? null
              : DateTime.parse(json['shortSaleLatestCompletionDate'] as String),
      priorPropertyForeclosureCompletedIndicator:
          json['priorPropertyForeclosureCompletedIndicator'] as bool?,
      foreclosureLatestCompletionDate:
          json['foreclosureLatestCompletionDate'] == null
              ? null
              : DateTime.parse(
                  json['foreclosureLatestCompletionDate'] as String),
      bankruptcyIndicator: json['bankruptcyIndicator'] as bool?,
      bankruptcies: (json['bankruptcies'] as List<dynamic>?)
          ?.map((e) =>
              BorrowerBankruptcyEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      hmdaGenderDetails: json['hmdaGenderDetails'] == null
          ? null
          : BorrowerHmdaGenderDetailsEntity.fromJson(
              json['hmdaGenderDetails'] as Map<String, dynamic>),
      hmdaEthnicityDetails: json['hmdaEthnicityDetails'] == null
          ? null
          : BorrowerHmdaEthnicityDetailsEntity.fromJson(
              json['hmdaEthnicityDetails'] as Map<String, dynamic>),
      hmdaRaceDetails: json['hmdaRaceDetails'] == null
          ? null
          : BorrowerHmdaRaceDetailsEntity.fromJson(
              json['hmdaRaceDetails'] as Map<String, dynamic>),
      action: json['action'] as String?,
      currentTotalMonthlyHousingExpense:
          json['currentTotalMonthlyHousingExpense'] as num?,
      livedMoreThanTwoYears: json['livedMoreThanTwoYears'] as bool?,
    );

Map<String, dynamic> _$BorrowerEntityToJson(BorrowerEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'middleName': instance.middleName,
      'lastName': instance.lastName,
      'suffixName': instance.suffixName,
      'dateOfBirth': instance.dateOfBirth?.toIso8601String(),
      'taxIdentifier': instance.taxIdentifier,
      'emailAddress': instance.emailAddress,
      'phoneNumbers': instance.phoneNumbers,
      'maritalStatus': instance.maritalStatus,
      'dependentAges': instance.dependentAges,
      'spouseIsCoBorrowerIndicator': instance.spouseIsCoBorrowerIndicator,
      'spouseEligibleForVABenefits': instance.spouseEligibleForVABenefits,
      'militaryServiceExpectedCompletionDate':
          instance.militaryServiceExpectedCompletionDate,
      'militaryStatusType': instance.militaryStatusType,
      'currentAddress': instance.currentAddress,
      'addresses': instance.addresses,
      'isMailingAddressSameAsCurrent': instance.isMailingAddressSameAsCurrent,
      'mailingAddress': instance.mailingAddress,
      'incomes': instance.incomes,
      'intentToOccupy': instance.intentToOccupy,
      'homeownerPastThreeYears': instance.homeownerPastThreeYears,
      'priorPropertyUsageType': instance.priorPropertyUsageType,
      'priorPropertyTitleType': instance.priorPropertyTitleType,
      'specialBorrowerSellerRelationshipIndicator':
          instance.specialBorrowerSellerRelationshipIndicator,
      'undisclosedBorrowedFundsIndicator':
          instance.undisclosedBorrowedFundsIndicator,
      'undisclosedBorrowedFundsAmount': instance.undisclosedBorrowedFundsAmount,
      'undisclosedMortgageApplicationIndicator':
          instance.undisclosedMortgageApplicationIndicator,
      'undisclosedCreditApplicationIndicator':
          instance.undisclosedCreditApplicationIndicator,
      'propertySubjectToPriorityLienIndicator':
          instance.propertySubjectToPriorityLienIndicator,
      'undisclosedComakerOfNoteIndicator':
          instance.undisclosedComakerOfNoteIndicator,
      'outstandingJudgmentsIndicator': instance.outstandingJudgmentsIndicator,
      'partyToLawsuitIndicator': instance.partyToLawsuitIndicator,
      'presentlyDelinquentIndicator': instance.presentlyDelinquentIndicator,
      'priorPropertyDeedInLieuConveyedIndicator':
          instance.priorPropertyDeedInLieuConveyedIndicator,
      'deedInLieuLatestCompletionDate':
          instance.deedInLieuLatestCompletionDate?.toIso8601String(),
      'priorPropertyShortSaleCompletedIndicator':
          instance.priorPropertyShortSaleCompletedIndicator,
      'shortSaleLatestCompletionDate':
          instance.shortSaleLatestCompletionDate?.toIso8601String(),
      'priorPropertyForeclosureCompletedIndicator':
          instance.priorPropertyForeclosureCompletedIndicator,
      'foreclosureLatestCompletionDate':
          instance.foreclosureLatestCompletionDate?.toIso8601String(),
      'bankruptcyIndicator': instance.bankruptcyIndicator,
      'bankruptcies': instance.bankruptcies,
      'hmdaGenderDetails': instance.hmdaGenderDetails,
      'hmdaEthnicityDetails': instance.hmdaEthnicityDetails,
      'hmdaRaceDetails': instance.hmdaRaceDetails,
      'action': instance.action,
      'currentTotalMonthlyHousingExpense':
          instance.currentTotalMonthlyHousingExpense,
      'livedMoreThanTwoYears': instance.livedMoreThanTwoYears,
    };
