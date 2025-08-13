// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'borrower_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BorrowerModel _$BorrowerModelFromJson(Map<String, dynamic> json) =>
    BorrowerModel(
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
      isMailingAddressSameAsCurrent:
          json['isMailingAddressSameAsCurrent'] as bool?,
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
      action: json['action'] as String?,
      currentTotalMonthlyHousingExpense:
          json['currentTotalMonthlyHousingExpense'] as num?,
      livedMoreThanTwoYears: json['livedMoreThanTwoYears'] as bool?,
      homePhoneNumber: json['homePhoneNumber'] == null
          ? null
          : BorrowerHomePhoneNumberModel.fromJson(
              json['homePhoneNumber'] as Map<String, dynamic>),
      currentAddress: json['currentAddress'] == null
          ? null
          : BorrowerCurrentAddressModel.fromJson(
              json['currentAddress'] as Map<String, dynamic>),
      prevAddresses: (json['addresses'] as List<dynamic>?)
          ?.map((e) => BorrowerPreviousAddressesModel.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      mailingAddress: json['mailingAddress'] == null
          ? null
          : BorrowerMailingAddressModel.fromJson(
              json['mailingAddress'] as Map<String, dynamic>),
      incomes: (json['incomes'] as List<dynamic>?)
          ?.map((e) => BorrowerIncomeModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      bankruptcies: (json['bankruptcies'] as List<dynamic>?)
          ?.map((e) =>
              BorrowerBankruptcyModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      hmdaGenderDetails: json['hmdaGenderDetails'] == null
          ? null
          : BorrowerHmdaGenderDetailsModel.fromJson(
              json['hmdaGenderDetails'] as Map<String, dynamic>),
      hmdaEthnicityDetails: json['hmdaEthnicityDetails'] == null
          ? null
          : BorrowerHmdaEthnicityDetailsModel.fromJson(
              json['hmdaEthnicityDetails'] as Map<String, dynamic>),
      hmdaRaceDetails: json['hmdaRaceDetails'] == null
          ? null
          : BorrowerHmdaRaceDetailsModel.fromJson(
              json['hmdaRaceDetails'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BorrowerModelToJson(BorrowerModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'middleName': instance.middleName,
      'lastName': instance.lastName,
      'suffixName': instance.suffixName,
      'dateOfBirth': instance.dateOfBirth?.toIso8601String(),
      'taxIdentifier': instance.taxIdentifier,
      'emailAddress': instance.emailAddress,
      'homePhoneNumber': instance.homePhoneNumber?.toJson(),
      'maritalStatus': instance.maritalStatus,
      'dependentAges': instance.dependentAges,
      'spouseIsCoBorrowerIndicator': instance.spouseIsCoBorrowerIndicator,
      'spouseEligibleForVABenefits': instance.spouseEligibleForVABenefits,
      'militaryServiceExpectedCompletionDate':
          instance.militaryServiceExpectedCompletionDate?.toIso8601String(),
      'militaryStatusType': instance.militaryStatusType,
      'currentAddress': instance.currentAddress?.toJson(),
      'addresses': instance.prevAddresses?.map((e) => e.toJson()).toList(),
      'isMailingAddressSameAsCurrent': instance.isMailingAddressSameAsCurrent,
      'mailingAddress': instance.mailingAddress?.toJson(),
      'incomes': instance.incomes?.map((e) => e.toJson()).toList(),
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
      'bankruptcies': instance.bankruptcies?.map((e) => e.toJson()).toList(),
      'hmdaGenderDetails': instance.hmdaGenderDetails?.toJson(),
      'hmdaEthnicityDetails': instance.hmdaEthnicityDetails?.toJson(),
      'hmdaRaceDetails': instance.hmdaRaceDetails?.toJson(),
      'action': instance.action,
      'currentTotalMonthlyHousingExpense':
          instance.currentTotalMonthlyHousingExpense,
      'livedMoreThanTwoYears': instance.livedMoreThanTwoYears,
    };
