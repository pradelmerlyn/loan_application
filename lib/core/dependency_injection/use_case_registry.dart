

import 'package:loan/domain/repositories/loan_registration/loan_registration_repository.dart';
import 'package:loan/domain/use_case/loan_registration/loan_registration_use_case.dart';

import 'injection_container.dart';

class UseCaseRegistry {
  
  void registerLoanRegistrationUseCases() {

    sl.registerLazySingleton<LoanRegistrationUseCase>(
      () => LoanRegistrationUseCase(sl<LoanRegistrationRepository>()),
    );
  }
}
