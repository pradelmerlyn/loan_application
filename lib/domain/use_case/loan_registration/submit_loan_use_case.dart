// domain/use_case/loan_registration/submit_application_use_case.dart
import 'package:equatable/equatable.dart';
import 'package:loan/core/util/network/data_state.dart';
import 'package:loan/domain/entities/loan_registration/loan_registration_entity.dart';
import 'package:loan/domain/repositories/loan_registration/loan_registration_repository.dart';

class SubmitLoanUseCase {
  final LoanRegistrationRepository _repo;
  SubmitLoanUseCase(this._repo);

  Future<DataState<LoanRegistrationEntity>> call(SubmitApplicationParams p) {
    return _repo.submitApplication(payload: p.payload);
  }
}

class SubmitApplicationParams extends Equatable {
  final LoanRegistrationEntity payload;
  const SubmitApplicationParams({required this.payload});
  @override
  List<Object?> get props => [payload];
}
