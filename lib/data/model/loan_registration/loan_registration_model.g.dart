// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loan_registration_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoanRegistrationModel _$LoanRegistrationModelFromJson(
        Map<String, dynamic> json) =>
    LoanRegistrationModel(
      loanOfficerId: json['loanOfficerId'] as String?,
      branchId: json['branchId'] as String?,
      id: json['id'] as String?,
      borrower: json['borrower'] == null
          ? null
          : BorrowerModel.fromJson(json['borrower'] as Map<String, dynamic>),
      coBorrower: json['coBorrower'] == null
          ? null
          : BorrowerModel.fromJson(json['coBorrower'] as Map<String, dynamic>),
      assets: (json['assets'] as List<dynamic>?)
          ?.map((e) => AssetModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      loanPurpose: json['loanPurpose'] as String?,
      subjectPropertyFoundIndicator:
          json['subjectPropertyFoundIndicator'] as bool?,
      subjectProperty: json['subjectProperty'] == null
          ? null
          : PropertyModel.fromJson(
              json['subjectProperty'] as Map<String, dynamic>),
      loanAmount: (json['loanAmount'] as num?)?.toDouble(),
      refinanceCashOutDeterminationType:
          json['refinanceCashOutDeterminationType'] as String?,
      desiredCashOut: (json['desiredCashOut'] as num?)?.toDouble(),
      refinanceYourPrimaryHome: json['refinanceYourPrimaryHome'] as bool?,
    );

Map<String, dynamic> _$LoanRegistrationModelToJson(
        LoanRegistrationModel instance) =>
    <String, dynamic>{
      'loanOfficerId': instance.loanOfficerId,
      'branchId': instance.branchId,
      'id': instance.id,
      'borrower': instance.borrower,
      'coBorrower': instance.coBorrower,
      'assets': instance.assets,
      'loanPurpose': instance.loanPurpose,
      'subjectPropertyFoundIndicator': instance.subjectPropertyFoundIndicator,
      'subjectProperty': instance.subjectProperty,
      'loanAmount': instance.loanAmount,
      'refinanceCashOutDeterminationType':
          instance.refinanceCashOutDeterminationType,
      'desiredCashOut': instance.desiredCashOut,
      'refinanceYourPrimaryHome': instance.refinanceYourPrimaryHome,
    };
