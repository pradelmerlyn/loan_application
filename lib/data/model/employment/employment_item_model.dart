
import 'package:json_annotation/json_annotation.dart';
import 'package:loan/domain/entities/employment/employment_item_entity.dart';

part 'employment_item_model.g.dart';

@JsonSerializable()
class EmploymentItemModel extends EmploymentItem {
  const EmploymentItemModel({
    required super.employer,
    required super.isCurrent,
    required super.jobType,
    required super.since,
    required super.belongsTo,
    required super.annualSalary,
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

  factory EmploymentItemModel.fromJson(Map<String, dynamic> json) =>
      _$EmploymentItemModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$EmploymentItemModelToJson(this);
}
