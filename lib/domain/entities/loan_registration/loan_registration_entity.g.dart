// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loan_registration_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoanRegistrationEntity _$LoanRegistrationEntityFromJson(
        Map<String, dynamic> json) =>
    LoanRegistrationEntity(
      loanOfficerId: json['loanOfficerId'] as String?,
      branchId: json['branchId'] as String?,
      id: json['id'] as String?,
      borrower: json['borrower'] == null
          ? null
          : BorrowerEntity.fromJson(json['borrower'] as Map<String, dynamic>),
      coBorrower: json['coBorrower'] == null
          ? null
          : BorrowerEntity.fromJson(json['coBorrower'] as Map<String, dynamic>),
      assets: (json['assets'] as List<dynamic>?)
          ?.map((e) => AssetEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      loanPurpose: json['loanPurpose'] as String?,
      subjectPropertyFoundIndicator:
          json['subjectPropertyFoundIndicator'] as bool?,
      subjectProperty: json['subjectProperty'] == null
          ? null
          : PropertyEntity.fromJson(
              json['subjectProperty'] as Map<String, dynamic>),
      loanAmount: json['loanAmount'] as num?,
      refinanceCashOutDeterminationType:
          json['refinanceCashOutDeterminationType'] as String?,
      desiredCashOut: (json['desiredCashOut'] as num?)?.toDouble(),
      refinanceYourPrimaryHome: json['refinanceYourPrimaryHome'] as bool?,
    );

Map<String, dynamic> _$LoanRegistrationEntityToJson(
        LoanRegistrationEntity instance) =>
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
