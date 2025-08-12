import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'loan_registration_event.dart';
part 'loan_registration_state.dart';

class LoanRegistrationBloc
    extends Bloc<LoanRegistrationEvent, LoanRegistrationState> {
  LoanRegistrationBloc()
      : super(const LoanRegistrationState(
          total: 0,
          currentStep: 1, // 1-based
          completed: [],
        )) {
    on<InitSteps>(_onInit);
    on<GoToStep>(_onGoToStep);
    on<NextStepsEvent>(_onNext);
    on<PrevStepsEvent>(_onPrev);
    on<MarkCompleted>(_onMarkCompleted);
  }

  void _onInit(InitSteps e, Emitter<LoanRegistrationState> emit) {
    final total = e.total.clamp(0, 50);
    final start0 = e.startAt.clamp(0, total == 0 ? 0 : total - 1);
    final current1 = total == 0 ? 1 : start0 + 1; // convert to 1-based
    final list = List<bool>.filled(total, false);

    emit(state.copyWith(
      total: total,
      currentStep: current1,
      completed: list,
      stepLabel: _labelFor(current1),
      buttonLabel: _buttonFor(current1, total),
      completionPercentage: _percentFor(list, total),
    ));
  }

  void _onGoToStep(GoToStep e, Emitter<LoanRegistrationState> emit) {
    if (state.total == 0) return;
    final current1 = (e.index.clamp(0, state.total - 1)) + 1;
    emit(state.copyWith(
      currentStep: current1,
      stepLabel: _labelFor(current1),
      buttonLabel: _buttonFor(current1, state.total),
      completionPercentage: _percentFor(state.completed, state.total),
    ));
  }

  void _onNext(NextStepsEvent e, Emitter<LoanRegistrationState> emit) {
    if (state.total == 0) return;
    final next1 = (state.currentStep + 1).clamp(1, state.total);
    emit(state.copyWith(
      currentStep: next1,
      stepLabel: _labelFor(next1),
      buttonLabel: _buttonFor(next1, state.total),
      completionPercentage: _percentFor(state.completed, state.total),
    ));
  }

  void _onPrev(PrevStepsEvent e, Emitter<LoanRegistrationState> emit) {
    if (state.total == 0) return;
    final prev1 = (state.currentStep - 1).clamp(1, state.total);
    emit(state.copyWith(
      currentStep: prev1,
      stepLabel: _labelFor(prev1),
      buttonLabel: _buttonFor(prev1, state.total),
      completionPercentage: _percentFor(state.completed, state.total),
    ));
  }

  void _onMarkCompleted(MarkCompleted e, Emitter<LoanRegistrationState> emit) {
    if (e.index < 0 || e.index >= state.total) return;
    final list = List<bool>.from(state.completed);
    list[e.index] = e.completed;
    emit(state.copyWith(
      completed: list,
      completionPercentage: _percentFor(list, state.total),
    ));
  }

  // --- helpers ---

  String _buttonFor(int current1, int total) =>
      current1 >= total ? 'Submit' : 'Next';

  String _labelFor(int current1) {
    const labels = <String>[
      'Borrower',
      'Property',
      'Financial',
      'Declarations',
      'Demographics',
    ];
    // Guard in case total != labels.length
    final idx = (current1 - 1).clamp(0, labels.length - 1);
    return labels[idx];
  }

  int _percentFor(List<bool> list, int total) {
    if (total == 0) return 0;
    final done = list.where((e) => e).length;
    return ((done / total) * 100).round();
  }
}
