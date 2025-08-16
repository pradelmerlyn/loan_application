// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loan_registration_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoanRegistrationResponseModel _$LoanRegistrationResponseModelFromJson(
        Map<String, dynamic> json) =>
    LoanRegistrationResponseModel(
      borrowerBpUserId: json['borrowerBpUserId'],
      loanNumber: json['loanNumber'],
      id: json['id'] as String?,
      borrower: json['borrower'] == null
          ? null
          : BorrowerModel.fromJson(json['borrower'] as Map<String, dynamic>),
      assets: (json['assets'] as List<dynamic>?)
              ?.map((e) => AssetModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      loanPurpose: json['loanPurpose'],
      subjectPropertyFoundIndicator:
          json['subjectPropertyFoundIndicator'] as bool?,
      subjectProperty: json['subjectProperty'] == null
          ? null
          : PropertyModel.fromJson(
              json['subjectProperty'] as Map<String, dynamic>),
      loanAmount: json['loanAmount'],
      refinanceCashOutDeterminationType:
          json['refinanceCashOutDeterminationType'] as String?,
      desiredCashOut: (json['desiredCashOut'] as num?)?.toDouble(),
      refinanceYourPrimaryHome: json['refinanceYourPrimaryHome'] as bool?,
      otc: json['otc'] as String?,
    );

Map<String, dynamic> _$LoanRegistrationResponseModelToJson(
    LoanRegistrationResponseModel instance) {
  final val = <String, dynamic>{
    'borrowerBpUserId': instance.borrowerBpUserId,
    'loanNumber': instance.loanNumber,
    'id': instance.id,
    'borrower': instance.borrower?.toJson(),
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
  val['otc'] = instance.otc;
  return val;
}
