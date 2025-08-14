
import 'package:loan/domain/use_case/borrower_registration/submit_borrower_use_case.dart';
import 'package:loan/domain/use_case/loan_registration/submit_loan_use_case.dart';

import 'injection_container.dart';

class UseCaseRegistry {
  void registerSubmitLoanUseCases() {
    // Use cases
    sl.registerLazySingleton<SubmitBorrowerUseCase>(() => SubmitBorrowerUseCase(
          sl(), // BorrowerRegistrationRepository
        ));

    sl.registerLazySingleton<SubmitLoanUseCase>(() => SubmitLoanUseCase(
          sl(), // LoanRegistrationRepository
        ));
  }
}
