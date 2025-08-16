// presentation/loan_registration/bloc/loan_registration/loan_registration_bloc.dart
import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import 'package:loan/core/util/network/data_state.dart';

// Domain entities
import 'package:loan/domain/entities/borrower/borrower_info/borrower_entity.dart';
import 'package:loan/domain/entities/loan_registration/loan_registration_entity.dart';
import 'package:loan/domain/entities/loan_registration/loan_registration_response_entity.dart';

// Single use case for both steps
import 'package:loan/domain/use_case/loan_registration/submit_loan_use_case.dart'
    show SubmitLoanUseCase, SubmitApplicationParams;

// State
import 'package:loan/presentation/loan_registration/bloc/loan_registration/loan_registration_state.dart';

part 'loan_registration_event.dart';

class LoanRegistrationBloc
    extends Bloc<LoanRegistrationEvent, LoanRegistrationState> {
  final SubmitLoanUseCase submitApplicationUseCase;

  LoanRegistrationBloc({
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

    // API
    on<SubmitBorrowerInfo>(_onSubmitBorrowerInfo);
    on<SubmitLoanRegistration>(_onSubmitLoan); // <- final submit
  }

  // ---------- navigation / UI state ----------

  void _onInit(InitSteps e, Emitter<LoanRegistrationState> emit) {
    final total = e.total.clamp(0, 50);
    final start0 = e.startAt.clamp(0, total == 0 ? 0 : total - 1);
    final current1 = total == 0 ? 1 : start0 + 1;
    final completed = List<bool>.filled(total, false);

    emit(state.copyWith(
      total: total,
      currentStep: current1,
      completed: completed,
      stepLabel: _labelFor(current1),
      buttonLabel: _buttonFor(current1, total),
      completionPercentage: _percentFor(completed, total),
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

  // ---------- API calls (single use case) ----------

  /// STEP 1 — borrower-only submit -> POST /application
  Future<void> _onSubmitBorrowerInfo(
    SubmitBorrowerInfo event,
    Emitter<LoanRegistrationState> emit,
  ) async {
    try {
      emit(state.copyWith(
        status: LoanRegStatus.loading,
        clearError: true,
        clearRegistration: true,
      ));

      final res = await submitApplicationUseCase(
        SubmitApplicationParams.borrower(event.borrower),
      );

      await _handleResponseOrFail(
        res,
        emit,
        onSuccessLog: 'Borrower step response',
        onFailFallback: 'Failed to submit borrower',
        onSuccess: (resp) async {
          // debugPrint('[STEP 1] Response: ${resp.toJson()}');
          // debugPrint('[STEP 1] loanId: ${resp.id}');
          // debugPrint('[STEP 1] borrowerId: ${resp.borrower?.id}');

          emit(state.copyWith(
             applicationId: resp.applicationId,
            loanId: resp.id,
            loanNumber: resp.loanNumber,
            borrowerId: resp.borrower?.id,
          ));
        },
      );
    } catch (e, st) {
      log('Unexpected error in _onSubmitBorrowerInfo: $e');
      log(st.toString());
      emit(state.copyWith(
        status: LoanRegStatus.failure,
        error: 'Unexpected error occurred: $e',
      ));
    }
  }

  /// FINAL SUBMIT LOAN REGISTARTION
  Future<void> _onSubmitLoan(
    SubmitLoanRegistration e,
    Emitter<LoanRegistrationState> emit,
  ) async {
    try {
      emit(state.copyWith(
        status: LoanRegStatus.loading,
        clearError: true,
        clearRegistration: true,
      ));

      final orig = e.payload;

      // Manually build a new payload with injected IDs
      final enrichedPayload = LoanRegistrationEntity(
        id: state.loanId, // int? from step-1
        loanNumber: state.loanNumber, // int? from step-1
        loanOfficerId: orig.loanOfficerId,
        branchId: orig.branchId,
        loanPurpose: orig.loanPurpose,
        loanAmount: orig.loanAmount,
        subjectPropertyFoundIndicator: orig.subjectPropertyFoundIndicator,
        subjectProperty: orig.subjectProperty,
        coBorrower: orig.coBorrower,
        assets: orig.assets,
        refinanceCashOutDeterminationType:
            orig.refinanceCashOutDeterminationType,
        desiredCashOut: orig.desiredCashOut,
        refinanceYourPrimaryHome: orig.refinanceYourPrimaryHome,

        // inject borrower id
        borrower: orig.borrower == null
            ? null
            : BorrowerEntity(
                id: state.borrowerId,
                firstName: orig.borrower!.firstName,
                middleName: orig.borrower!.middleName,
                lastName: orig.borrower!.lastName,
                suffixName: orig.borrower!.suffixName,
                dateOfBirth: orig.borrower!.dateOfBirth,
                taxIdentifier: orig.borrower!.taxIdentifier,
                emailAddress: orig.borrower!.emailAddress,
                phoneNumbers: orig.borrower!.phoneNumbers,
                maritalStatus: orig.borrower!.maritalStatus,
                dependentAges: orig.borrower!.dependentAges,
                spouseIsCoBorrowerIndicator:
                    orig.borrower!.spouseIsCoBorrowerIndicator,
                spouseEligibleForVABenefits:
                    orig.borrower!.spouseEligibleForVABenefits,
                militaryServiceExpectedCompletionDate:
                    orig.borrower!.militaryServiceExpectedCompletionDate,
                militaryStatusType: orig.borrower!.militaryStatusType,
                currentAddress: orig.borrower!.currentAddress,
                addresses: orig.borrower!.addresses,
                isMailingAddressSameAsCurrent:
                    orig.borrower!.isMailingAddressSameAsCurrent,
                mailingAddress: orig.borrower!.mailingAddress,
                incomes: orig.borrower!.incomes,
                intentToOccupy: orig.borrower!.intentToOccupy,
                homeownerPastThreeYears: orig.borrower!.homeownerPastThreeYears,
                priorPropertyUsageType: orig.borrower!.priorPropertyUsageType,
                priorPropertyTitleType: orig.borrower!.priorPropertyTitleType,
                specialBorrowerSellerRelationshipIndicator:
                    orig.borrower!.specialBorrowerSellerRelationshipIndicator,
                undisclosedBorrowedFundsIndicator:
                    orig.borrower!.undisclosedBorrowedFundsIndicator,
                undisclosedBorrowedFundsAmount:
                    orig.borrower!.undisclosedBorrowedFundsAmount,
                undisclosedMortgageApplicationIndicator:
                    orig.borrower!.undisclosedMortgageApplicationIndicator,
                undisclosedCreditApplicationIndicator:
                    orig.borrower!.undisclosedCreditApplicationIndicator,
                propertySubjectToPriorityLienIndicator:
                    orig.borrower!.propertySubjectToPriorityLienIndicator,
                undisclosedComakerOfNoteIndicator:
                    orig.borrower!.undisclosedComakerOfNoteIndicator,
                outstandingJudgmentsIndicator:
                    orig.borrower!.outstandingJudgmentsIndicator,
                partyToLawsuitIndicator: orig.borrower!.partyToLawsuitIndicator,
                presentlyDelinquentIndicator:
                    orig.borrower!.presentlyDelinquentIndicator,
                priorPropertyDeedInLieuConveyedIndicator:
                    orig.borrower!.priorPropertyDeedInLieuConveyedIndicator,
                deedInLieuLatestCompletionDate:
                    orig.borrower!.deedInLieuLatestCompletionDate,
                priorPropertyShortSaleCompletedIndicator:
                    orig.borrower!.priorPropertyShortSaleCompletedIndicator,
                shortSaleLatestCompletionDate:
                    orig.borrower!.shortSaleLatestCompletionDate,
                priorPropertyForeclosureCompletedIndicator:
                    orig.borrower!.priorPropertyForeclosureCompletedIndicator,
                foreclosureLatestCompletionDate:
                    orig.borrower!.foreclosureLatestCompletionDate,
                bankruptcyIndicator: orig.borrower!.bankruptcyIndicator,
                bankruptcies: orig.borrower!.bankruptcies,
                hmdaGenderDetails: orig.borrower!.hmdaGenderDetails,
                hmdaEthnicityDetails: orig.borrower!.hmdaEthnicityDetails,
                hmdaRaceDetails: orig.borrower!.hmdaRaceDetails,
                action: orig.borrower!.action,
                currentTotalMonthlyHousingExpense:
                    orig.borrower!.currentTotalMonthlyHousingExpense,
                livedMoreThanTwoYears: orig.borrower!.livedMoreThanTwoYears,
              ),
      );

      final res = await submitApplicationUseCase(
        SubmitApplicationParams.finalSubmit(enrichedPayload),
      );

      await _handleResponseOrFail(
        res,
        emit,
        onSuccessLog: 'Final submit response',
        onFailFallback: 'Failed to submit application',
        onSuccess: (resp) async {
          //  debugPrint('[STEP 5] Response: ${resp.toJson()}');
          // debugPrint('[STEP 5] loanId: ${resp.id}');
          // debugPrint('[STEP 5] borrowerId: ${resp.borrower?.id}');
          emit(state.copyWith(
            applicationId: resp.applicationId,
            loanId: resp.id,
            loanNumber: resp.loanNumber,
            borrowerId: resp.borrower?.id,
            otc: resp.otc,
          ));
        },
      );
    } catch (e, st) {
      log('Unexpected error in _onSubmitLoan: $e');
      log(st.toString());
      emit(state.copyWith(
        status: LoanRegStatus.failure,
        error: 'Unexpected error occurred: $e',
      ));
    }
  }

  ///  handler for DataState<LoanRegistrationResponseEntity>
  Future<void> _handleResponseOrFail(
    DataState<LoanRegistrationResponseEntity> res,
    Emitter<LoanRegistrationState> emit, {
    required String onSuccessLog,
    required String onFailFallback,
    Future<void> Function(LoanRegistrationResponseEntity resp)? onSuccess,
  }) async {
    if (res is DataSuccess<LoanRegistrationResponseEntity>) {
      final resp = res.data;
      if (kDebugMode) debugPrint('$onSuccessLog: ${resp?.toJson()}');

     if (resp == null) {
        emit(state.copyWith(
          status: LoanRegStatus.failure,
          error: onFailFallback,
        ));
        return;
      }

      if (onSuccess != null) {
        await onSuccess(resp); // don’t emit status here
      }

      emit(state.copyWith(status: LoanRegStatus.success));
      return;
    }

    if (res is DataFailed) {
      if (kDebugMode) debugPrint('$onFailFallback: ${res.error}');
      emit(state.copyWith(
        status: LoanRegStatus.failure,
        error: res.error?.message ?? onFailFallback,
      ));
      return;
    }

    emit(state.copyWith(
      status: LoanRegStatus.failure,
      error: onFailFallback,
    ));
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
