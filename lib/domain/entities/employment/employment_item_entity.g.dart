// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employment_item_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmploymentItem _$EmploymentItemFromJson(Map<String, dynamic> json) =>
    EmploymentItem(
      employer: json['employer'] as String,
      isCurrent: json['isCurrent'] as bool,
      jobType: json['jobType'] as String,
      since: json['since'] as String,
      belongsTo: json['belongsTo'] as String,
      annualSalary: json['annualSalary'] as String,
    );

Map<String, dynamic> _$EmploymentItemToJson(EmploymentItem instance) =>
    <String, dynamic>{
      'employer': instance.employer,
      'isCurrent': instance.isCurrent,
      'jobType': instance.jobType,
      'since': instance.since,
      'belongsTo': instance.belongsTo,
      'annualSalary': instance.annualSalary,
    };
