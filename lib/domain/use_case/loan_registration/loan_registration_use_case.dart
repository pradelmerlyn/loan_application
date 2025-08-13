// lib/domain/usecases/loan_registration/create_loan_id_usecase.dart
import 'package:equatable/equatable.dart';
import 'package:loan/core/util/network/data_state.dart';
import 'package:loan/domain/entities/loan_registration/loan_registration_entity.dart';
import 'package:loan/domain/repositories/loan_registration/loan_registration_repository.dart';

class LoanRegistrationUseCase {
  final LoanRegistrationRepository _repo;
  LoanRegistrationUseCase(this._repo);

  Future<DataState<LoanRegistrationEntity>> call(
      LoanRegistrationIdParams params) {
    return _repo.createLoanId(
      token: params.token,
      payload: params.payload,
    );
  }
}

class LoanRegistrationIdParams extends Equatable {
  final String token;
  final LoanRegistrationEntity payload;

  const LoanRegistrationIdParams({
    required this.token,
    required this.payload,
  });

  @override
  List<Object?> get props => [token, payload];
}
