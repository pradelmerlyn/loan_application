// domain/entities/employment/employment_item_entity.dart
class EmploymentItem {
  final String employer;
  final bool isCurrent;
  final String jobType; // e.g., Full Time
  final String since; // e.g., "Since Oct 2019"
  final String belongsTo; // e.g., John Doe
  final String annualSalary; // formatted: $80,000.00/Year

  const EmploymentItem({
    required this.employer,
    required this.isCurrent,
    required this.jobType,
    required this.since,
    required this.belongsTo,
    required this.annualSalary,
  });
}
