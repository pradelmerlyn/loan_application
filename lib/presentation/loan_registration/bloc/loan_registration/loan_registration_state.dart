import 'package:equatable/equatable.dart';
import 'package:loan/domain/entities/borrower/borrower_info/borrower_previous_addresses_entity.dart';

import 'package:loan/domain/entities/loan_registration/loan_registration_entity.dart';
import 'package:loan/domain/entities/borrower/borrower_info/borrower_entity.dart';
import 'package:loan/domain/entities/financial_assets/asset_entity.dart';
import 'package:loan/domain/entities/property/property_entity.dart';

enum LoanRegStatus { idle, loading, success, failure }

class LoanRegistrationState extends Equatable {
  // ----- UI FIELDS -----
  final int total;
  final int currentStep; // 1-based
  final List<bool> completed; // per-step flags (0-based)
  final String stepLabel;
  final String buttonLabel;
  final int completionPercentage;

  // holders for application response in step 1
  final String? loanId;
  final int? loanNumber;
  final String? borrowerId;

  final LoanRegStatus status;
  final String? error;

  final LoanRegistrationEntity? registration; //result

  final BorrowerEntity borrower;
  final BorrowerEntity? coBorrower;
  final List<AssetEntity> assets;
  final List<BorrowerPreviousAddressesEntity> addresses;
  final PropertyEntity? subjectProperty;

  final String? loanPurpose;
  final bool subjectPropertyFoundIndicator;
  final double? loanAmount;
  final String? refinanceCashOutDeterminationType;
  final double? desiredCashOut;
  final bool? refinanceYourPrimaryHome;

  const LoanRegistrationState({
    // UI
    required this.total,
    required this.currentStep,
    required this.completed,
    this.stepLabel = 'Borrower',
    this.buttonLabel = 'Next',
    this.completionPercentage = 0,
    this.loanId = "",
    this.loanNumber = 0,
    this.borrowerId = "",

    // status
    this.status = LoanRegStatus.idle,
    this.error,

    // result
    this.registration,

    // data
    this.borrower = const BorrowerEntity(),
    this.coBorrower,
    this.assets = const [],
    this.addresses = const [],
    this.subjectProperty,
    this.loanPurpose,
    this.subjectPropertyFoundIndicator = false,
    this.loanAmount,
    this.refinanceCashOutDeterminationType,
    this.desiredCashOut,
    this.refinanceYourPrimaryHome,
  });

  double get progress =>
      total == 0 ? 0 : completed.where((e) => e).length / total;

  LoanRegistrationEntity get payload => LoanRegistrationEntity(
        loanOfficerId: 'mmaine',
        loanNumber: loanNumber,
        borrower: borrower,
        coBorrower: coBorrower,
        assets: assets,
        loanPurpose: loanPurpose,
        subjectPropertyFoundIndicator: subjectPropertyFoundIndicator,
        subjectProperty: subjectProperty,
        loanAmount: loanAmount,
        refinanceCashOutDeterminationType: refinanceCashOutDeterminationType,
        desiredCashOut: desiredCashOut,
        refinanceYourPrimaryHome: refinanceYourPrimaryHome,
      );

  LoanRegistrationState copyWith({
    // UI
    int? total,
    int? currentStep,
    List<bool>? completed,
    String? stepLabel,
    String? buttonLabel,
    int? completionPercentage,

    // status
    LoanRegStatus? status,
    String? error,
    bool clearError = false,

    // result
    LoanRegistrationEntity? registration,
    bool clearRegistration = false,
    String? loanId,
    int? loanNumber,
    String? borrowerId,

    // data
    BorrowerEntity? borrower,
    BorrowerEntity? coBorrower,
    List<AssetEntity>? assets,
    PropertyEntity? subjectProperty,
    String? loanPurpose,
    bool? subjectPropertyFoundIndicator,
    double? loanAmount,
    String? refinanceCashOutDeterminationType,
    double? desiredCashOut,
    bool? refinanceYourPrimaryHome,
  }) {
    return LoanRegistrationState(
      // UI
      total: total ?? this.total,
      currentStep: currentStep ?? this.currentStep,
      completed: completed ?? this.completed,
      stepLabel: stepLabel ?? this.stepLabel,
      buttonLabel: buttonLabel ?? this.buttonLabel,
      completionPercentage: completionPercentage ?? this.completionPercentage,

      // status
      status: status ?? this.status,
      error: clearError ? null : (error ?? this.error),

      // result
      registration:
          clearRegistration ? null : (registration ?? this.registration),
      loanId: loanId ?? this.loanId,
      loanNumber: loanNumber ?? this.loanNumber,
      borrowerId: borrowerId ?? this.borrowerId,

      // data
      borrower: borrower ?? this.borrower,
      coBorrower: coBorrower ?? this.coBorrower,
      assets: assets ?? this.assets,
      subjectProperty: subjectProperty ?? this.subjectProperty,
      loanPurpose: loanPurpose ?? this.loanPurpose,
      subjectPropertyFoundIndicator:
          subjectPropertyFoundIndicator ?? this.subjectPropertyFoundIndicator,
      loanAmount: loanAmount ?? this.loanAmount,
      refinanceCashOutDeterminationType: refinanceCashOutDeterminationType ??
          this.refinanceCashOutDeterminationType,
      desiredCashOut: desiredCashOut ?? this.desiredCashOut,
      refinanceYourPrimaryHome:
          refinanceYourPrimaryHome ?? this.refinanceYourPrimaryHome,
    );
  }

  @override
  List<Object?> get props => [
        // UI
        total,
        currentStep,
        completed,
        stepLabel,
        buttonLabel,
        completionPercentage,

        // status
        status,
        error,

        // result
        registration,
        loanId,
        loanNumber,
        borrowerId,

        // data
        borrower,
        coBorrower,
        assets,
        addresses,
        subjectProperty,
        loanPurpose,
        subjectPropertyFoundIndicator,
        loanAmount,
        refinanceCashOutDeterminationType,
        desiredCashOut,
        refinanceYourPrimaryHome,
      ];
}
