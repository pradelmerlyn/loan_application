// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'borrower_income_employer_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BorrowerIncomeEmployerEntity _$BorrowerIncomeEmployerEntityFromJson(
        Map<String, dynamic> json) =>
    BorrowerIncomeEmployerEntity(
      id: json['id'] as String?,
      status: json['status'] as String?,
      specialBorrowerEmployerRelationshipIndicator:
          json['specialBorrowerEmployerRelationshipIndicator'] as bool?,
      name: json['name'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      startDate: json['startDate'] == null
          ? null
          : DateTime.parse(json['startDate'] as String),
      endDate: json['endDate'] == null
          ? null
          : DateTime.parse(json['endDate'] as String),
      jobTitle: json['jobTitle'] as String?,
      address: json['address'] == null
          ? null
          : BorrowerIncomeEmployerAddressEntity.fromJson(
              json['address'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BorrowerIncomeEmployerEntityToJson(
        BorrowerIncomeEmployerEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'specialBorrowerEmployerRelationshipIndicator':
          instance.specialBorrowerEmployerRelationshipIndicator,
      'name': instance.name,
      'phoneNumber': instance.phoneNumber,
      'startDate': instance.startDate?.toIso8601String(),
      'endDate': instance.endDate?.toIso8601String(),
      'jobTitle': instance.jobTitle,
      'address': instance.address,
    };
