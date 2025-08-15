
import 'package:dio/dio.dart';
import 'package:loan/core/util/network/data_state.dart';
import 'package:loan/domain/entities/borrower/borrower_info/borrower_entity.dart';
import 'package:loan/domain/entities/loan_registration/loan_registration_entity.dart';
import 'package:loan/domain/entities/loan_registration/loan_registration_response_entity.dart';
import 'package:loan/domain/repositories/loan_registration/loan_registration_repository.dart';

class SubmitLoanUseCase {
  final LoanRegistrationRepository _repo;
  SubmitLoanUseCase(this._repo);

  Future<DataState<LoanRegistrationResponseEntity>> call(
    SubmitApplicationParams p,
  ) {
    switch (p.kind) {
      case SubmitKind.borrowerOnly:
        final borrower = p.borrower;
        if (borrower == null) {
          return Future.value(
            DataFailed(
              DioException(
                requestOptions: RequestOptions(path: '/application'),
                error: 'Missing borrower for borrowerOnly submit',
                type: DioExceptionType.unknown,
              ),
            ),
          );
        }
        return _repo.submitBorrower(borrower: borrower);

      case SubmitKind.finalSubmit:
        final payload = p.payload;
        if (payload == null) {
          return Future.value(
            DataFailed(
              DioException(
                requestOptions: RequestOptions(path: '/application/submitapp'),
                error: 'Missing payload for finalSubmit',
                type: DioExceptionType.unknown,
              ),
            ),
          );
        }
        return _repo.submitApplication(payload: payload);
    }
  }
}

enum SubmitKind { borrowerOnly, finalSubmit }

class SubmitApplicationParams {
  final SubmitKind kind;
  final BorrowerEntity? borrower;
  final LoanRegistrationEntity? payload;

  const SubmitApplicationParams.borrower(this.borrower)
      : kind = SubmitKind.borrowerOnly,
        payload = null;

  const SubmitApplicationParams.finalSubmit(this.payload)
      : kind = SubmitKind.finalSubmit,
        borrower = null;
}
