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

Map<String, dynamic> _$LoanRegistrationModelToJson(
    LoanRegistrationModel instance) {
  final val = <String, dynamic>{
    'loanOfficerId': instance.loanOfficerId,
    'branchId': instance.branchId,
    'id': instance.id,
    'borrower': instance.borrower?.toJson(),
    'coBorrower': instance.coBorrower?.toJson(),
    'assets': instance.assets?.map((e) => e.toJson()).toList(),
    'loanPurpose': instance.loanPurpose,
    'subjectPropertyFoundIndicator': instance.subjectPropertyFoundIndicator,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('subjectProperty', instance.subjectProperty?.toJson());
  val['loanAmount'] = instance.loanAmount;
  val['refinanceCashOutDeterminationType'] =
      instance.refinanceCashOutDeterminationType;
  val['desiredCashOut'] = instance.desiredCashOut;
  val['refinanceYourPrimaryHome'] = instance.refinanceYourPrimaryHome;
  return val;
}
