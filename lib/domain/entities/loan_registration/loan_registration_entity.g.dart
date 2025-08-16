// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loan_registration_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoanRegistrationEntity _$LoanRegistrationEntityFromJson(
        Map<String, dynamic> json) =>
    LoanRegistrationEntity(
      loanOfficerId: json['loanOfficerId'] as String?,
      loanNumber: json['loanNumber'],
      applicationId: json['applicationId'],
      branchId: json['branchId'] as String?,
      id: json['id'],
      borrower: json['borrower'] == null
          ? null
          : BorrowerEntity.fromJson(json['borrower'] as Map<String, dynamic>),
      coBorrower: json['coBorrower'] == null
          ? null
          : BorrowerEntity.fromJson(json['coBorrower'] as Map<String, dynamic>),
      assets: (json['assets'] as List<dynamic>?)
              ?.map((e) => AssetEntity.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
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
    LoanRegistrationEntity instance) {
  final val = <String, dynamic>{
    'loanOfficerId': instance.loanOfficerId,
    'loanNumber': instance.loanNumber,
    'branchId': instance.branchId,
    'id': instance.id,
    'applicationId': instance.applicationId,
    'borrower': instance.borrower,
    'coBorrower': instance.coBorrower,
    'assets': instance.assets,
    'loanPurpose': instance.loanPurpose,
    'subjectPropertyFoundIndicator': instance.subjectPropertyFoundIndicator,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('subjectProperty', instance.subjectProperty);
  val['loanAmount'] = instance.loanAmount;
  val['refinanceCashOutDeterminationType'] =
      instance.refinanceCashOutDeterminationType;
  val['desiredCashOut'] = instance.desiredCashOut;
  val['refinanceYourPrimaryHome'] = instance.refinanceYourPrimaryHome;
  return val;
}
