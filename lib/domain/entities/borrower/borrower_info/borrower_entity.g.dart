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
      homePhoneNumber: json['homePhoneNumber'] == null
          ? null
          : BorrowerHomePhoneNumberEntity.fromJson(
              json['homePhoneNumber'] as Map<String, dynamic>),
      maritalStatus: json['maritalStatus'] as String?,
      dependentAges: (json['dependentAges'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
      spouseIsCoBorrowerIndicator: json['spouseIsCoBorrowerIndicator'] as bool?,
      spouseEligibleForVABenefits: json['spouseEligibleForVABenefits'] as bool?,
      militaryServiceExpectedCompletionDate:
          json['militaryServiceExpectedCompletionDate'] == null
              ? null
              : DateTime.parse(
                  json['militaryServiceExpectedCompletionDate'] as String),
      militaryStatusType: json['militaryStatusType'] as String?,
      currentAddress: json['currentAddress'] == null
          ? null
          : BorrowerCurrentAddressEntity.fromJson(
              json['currentAddress'] as Map<String, dynamic>),
      prevAddresses: (json['addresses'] as List<dynamic>?)
          ?.map((e) => BorrowerPreviousAddressesEntity.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      isMailingAddressSameAsCurrent:
          json['isMailingAddressSameAsCurrent'] as bool?,
      mailingAddress: json['mailingAddress'] == null
          ? null
          : BorrowerMailingAddressEntity.fromJson(
              json['mailingAddress'] as Map<String, dynamic>),
      incomes: (json['incomes'] as List<dynamic>?)
          ?.map((e) => BorrowerIncomeEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      intentToOccupy: json['intentToOccupy'] as bool?,
      homeownerPastThreeYears: json['homeownerPastThreeYears'] as bool?,
      priorPropertyUsageType: json['priorPropertyUsageType'] as String?,
      priorPropertyTitleType: json['priorPropertyTitleType'] as String?,
      specialBorrowerSellerRelationshipIndicator:
          json['specialBorrowerSellerRelationshipIndicator'] as bool?,
      undisclosedBorrowedFundsIndicator:
          json['undisclosedBorrowedFundsIndicator'] as bool?,
      undisclosedBorrowedFundsAmount:
          json['undisclosedBorrowedFundsAmount'] as num?,
      undisclosedMortgageApplicationIndicator:
          json['undisclosedMortgageApplicationIndicator'] as bool?,
      undisclosedCreditApplicationIndicator:
          json['undisclosedCreditApplicationIndicator'] as bool?,
      propertySubjectToPriorityLienIndicator:
          json['propertySubjectToPriorityLienIndicator'] as bool?,
      undisclosedComakerOfNoteIndicator:
          json['undisclosedComakerOfNoteIndicator'] as bool?,
      outstandingJudgmentsIndicator:
          json['outstandingJudgmentsIndicator'] as bool?,
      partyToLawsuitIndicator: json['partyToLawsuitIndicator'] as bool?,
      presentlyDelinquentIndicator:
          json['presentlyDelinquentIndicator'] as bool?,
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
      'homePhoneNumber': instance.homePhoneNumber,
      'maritalStatus': instance.maritalStatus,
      'dependentAges': instance.dependentAges,
      'spouseIsCoBorrowerIndicator': instance.spouseIsCoBorrowerIndicator,
      'spouseEligibleForVABenefits': instance.spouseEligibleForVABenefits,
      'militaryServiceExpectedCompletionDate':
          instance.militaryServiceExpectedCompletionDate?.toIso8601String(),
      'militaryStatusType': instance.militaryStatusType,
      'currentAddress': instance.currentAddress,
      'addresses': instance.prevAddresses,
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
