import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:loan/core/util/network/data_state.dart';
import 'package:loan/domain/entities/borrower/borrower_info/borrower_entity.dart';
import 'package:loan/domain/entities/loan_registration/loan_registration_entity.dart';

// ✅ two distinct use cases (and their params)
import 'package:loan/domain/use_case/borrower_registration/submit_borrower_use_case.dart'
    show SubmitBorrowerUseCase, SubmitBorrowerParams;

import 'package:loan/domain/use_case/loan_registration/submit_loan_use_case.dart'
    show SubmitLoanUseCase, SubmitApplicationParams;

import 'package:loan/presentation/loan_registration/bloc/loan_registration/loan_registration_state.dart';

part 'loan_registration_event.dart';

class LoanRegistrationBloc
    extends Bloc<LoanRegistrationEvent, LoanRegistrationState> {
  final SubmitBorrowerUseCase submitBorrowerUseCase;
  final SubmitLoanUseCase submitApplicationUseCase;

  LoanRegistrationBloc({
    required this.submitBorrowerUseCase,
    required this.submitApplicationUseCase,
  }) : super(const LoanRegistrationState(
          total: 0,
          currentStep: 1,
          completed: [],
        )) {
    on<InitSteps>(_onInit);
    on<GoToStep>(_onGoToStep);
    on<NextStepsEvent>(_onNext);
    on<PrevStepsEvent>(_onPrev);
    on<MarkCompleted>(_onMarkCompleted);
    on<SubmitBorrowerInfo>(_onSubmitBorrowerInfo);
    on<SubmitLoanRegistration>(_onSubmitLoan);
  }

  void _onInit(InitSteps e, Emitter<LoanRegistrationState> emit) {
    final total = e.total.clamp(0, 50);
    final start0 = e.startAt.clamp(0, total == 0 ? 0 : total - 1);
    final current1 = total == 0 ? 1 : start0 + 1;
    final list = List<bool>.filled(total, false);

    emit(state.copyWith(
      total: total,
      currentStep: current1,
      completed: list,
      stepLabel: _labelFor(current1),
      buttonLabel: _buttonFor(current1, total),
      completionPercentage: _percentFor(list, total),
      status: LoanRegStatus.idle,
      clearError: true,
      clearRegistration: true,
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

  // ---------- API calls ----------

  Future<void> _onSubmitBorrowerInfo(
    SubmitBorrowerInfo event,
    Emitter<LoanRegistrationState> emit,
  ) async {
    emit(state.copyWith(
      status: LoanRegStatus.loading,
      clearError: true,
      clearRegistration: true,
    ));

    // ✅ FIX: pass the correct named param
    final res = await submitBorrowerUseCase(
      SubmitBorrowerParams(borrower: event.borrower),
    );

    if (res is DataSuccess<LoanRegistrationEntity>) {
      emit(state.copyWith(
        status: LoanRegStatus.success,
        registration: res.data,
      ));
    } else if (res is DataFailed) {
      emit(state.copyWith(
        status: LoanRegStatus.failure,
        error: res.error?.message ?? 'Failed to submit borrower',
      ));
    }
  }

  Future<void> _onSubmitLoan(
    SubmitLoanRegistration e,
    Emitter<LoanRegistrationState> emit,
  ) async {
    emit(state.copyWith(
      status: LoanRegStatus.loading,
      clearError: true,
      clearRegistration: true,
    ));

    // ✅ Ensure you’re importing + using SubmitApplicationParams from submit_loan_use_case.dart
    final res = await submitApplicationUseCase(
      SubmitApplicationParams(payload: e.payload),
    );

    if (res is DataSuccess<LoanRegistrationEntity>) {
      emit(state.copyWith(
        status: LoanRegStatus.success,
        registration: res.data,
      ));
    } else if (res is DataFailed) {
      emit(state.copyWith(
        status: LoanRegStatus.failure,
        error: res.error?.message ?? 'Failed to submit application',
      ));
    }
  }

  // ---------- helpers ----------

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
    final idx = (current1 - 1).clamp(0, labels.length - 1);
    return labels[idx];
  }

  int _percentFor(List<bool> list, int total) {
    if (total == 0) return 0;
    final done = list.where((e) => e).length;
    return ((done / total) * 100).round();
  }
}
