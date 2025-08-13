import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'employment_item_entity.g.dart';

@JsonSerializable()
class EmploymentItem extends Equatable {
  @JsonKey(name: 'employer')
  final String employer;

  @JsonKey(name: 'isCurrent')
  final bool isCurrent;

  @JsonKey(name: 'jobType')
  final String jobType; 

  @JsonKey(name: 'since')
  final String since; 

  @JsonKey(name: 'belongsTo')
  final String belongsTo; 

  @JsonKey(name: 'annualSalary')
  final String annualSalary; 

  const EmploymentItem({
    required this.employer,
    required this.isCurrent,
    required this.jobType,
    required this.since,
    required this.belongsTo,
    required this.annualSalary,
  });

  @override
  List<Object?> get props => [
        employer,
        isCurrent,
        jobType,
        since,
        belongsTo,
        annualSalary,
      ];

  factory EmploymentItem.fromJson(Map<String, dynamic> json) =>
      _$EmploymentItemFromJson(json);

  Map<String, dynamic> toJson() => _$EmploymentItemToJson(this);
}
