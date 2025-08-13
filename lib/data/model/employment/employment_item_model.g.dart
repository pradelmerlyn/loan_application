// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employment_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmploymentItemModel _$EmploymentItemModelFromJson(Map<String, dynamic> json) =>
    EmploymentItemModel(
      employer: json['employer'] as String,
      isCurrent: json['isCurrent'] as bool,
      jobType: json['jobType'] as String,
      since: json['since'] as String,
      belongsTo: json['belongsTo'] as String,
      annualSalary: json['annualSalary'] as String,
    );

Map<String, dynamic> _$EmploymentItemModelToJson(
        EmploymentItemModel instance) =>
    <String, dynamic>{
      'employer': instance.employer,
      'isCurrent': instance.isCurrent,
      'jobType': instance.jobType,
      'since': instance.since,
      'belongsTo': instance.belongsTo,
      'annualSalary': instance.annualSalary,
    };
