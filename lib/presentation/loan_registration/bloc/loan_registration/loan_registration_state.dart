part of 'loan_registration_bloc.dart';

class LoanRegistrationState extends Equatable {
  /// Total number of steps
  final int total;

  /// 1-based current step (1..total)
  final int currentStep;

  /// Per-step completion flags (0-based indexing)
  final List<bool> completed;

  final String stepLabel;
  final int completionPercentage; // 0..100
  final String buttonLabel;

  const LoanRegistrationState({
    required this.total,
    required this.currentStep,
    required this.completed,
    this.stepLabel = 'Borrower',
    this.completionPercentage = 0,
    this.buttonLabel = 'Next',
  });

  /// Overall fractional progress (0..1)
  double get progress =>
      total == 0 ? 0 : completed.where((e) => e).length / total;

  LoanRegistrationState copyWith({
    int? total,
    int? currentStep,
    List<bool>? completed,
    String? stepLabel,
    int? completionPercentage,
    String? buttonLabel,
  }) {
    return LoanRegistrationState(
      total: total ?? this.total,
      currentStep: currentStep ?? this.currentStep,
      completed: completed ?? this.completed,
      stepLabel: stepLabel ?? this.stepLabel,
      completionPercentage: completionPercentage ?? this.completionPercentage,
      buttonLabel: buttonLabel ?? this.buttonLabel,
    );
  }

  @override
  List<Object> get props => [
        total,
        currentStep,
        completed,
        stepLabel,
        completionPercentage,
        buttonLabel,
      ];
}
