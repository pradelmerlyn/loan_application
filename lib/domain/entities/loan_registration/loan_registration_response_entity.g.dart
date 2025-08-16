// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loan_registration_response_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoanRegistrationResponseEntity _$LoanRegistrationResponseEntityFromJson(
        Map<String, dynamic> json) =>
    LoanRegistrationResponseEntity(
      borrowerBpUserId: json['borrowerBpUserId'],
      loanNumber: json['loanNumber'],
      id: json['id'] as String?,
      applicationId: json['applicationId'] as String?,
      borrower: json['borrower'] == null
          ? null
          : BorrowerEntity.fromJson(json['borrower'] as Map<String, dynamic>),
      assets: (json['assets'] as List<dynamic>?)
              ?.map((e) => AssetEntity.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      loanPurpose: json['loanPurpose'],
      subjectPropertyFoundIndicator:
          json['subjectPropertyFoundIndicator'] as bool?,
      subjectProperty: json['subjectProperty'] == null
          ? null
          : PropertyEntity.fromJson(
              json['subjectProperty'] as Map<String, dynamic>),
      loanAmount: json['loanAmount'],
      refinanceCashOutDeterminationType:
          json['refinanceCashOutDeterminationType'] as String?,
      desiredCashOut: (json['desiredCashOut'] as num?)?.toDouble(),
      refinanceYourPrimaryHome: json['refinanceYourPrimaryHome'] as bool?,
      otc: json['otc'] as String?,
    );

Map<String, dynamic> _$LoanRegistrationResponseEntityToJson(
    LoanRegistrationResponseEntity instance) {
  final val = <String, dynamic>{
    'borrowerBpUserId': instance.borrowerBpUserId,
    'loanNumber': instance.loanNumber,
    'id': instance.id,
    'applicationId': instance.applicationId,
    'borrower': instance.borrower,
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
  val['otc'] = instance.otc;
  return val;
}
