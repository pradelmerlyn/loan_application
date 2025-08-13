

import 'package:loan/data/data_source/loan_registration/loan_registration_service.dart';
import 'package:loan/data/repository_impl/loan_registration/loan_registration_repository_impl.dart';
import 'package:loan/domain/repositories/loan_registration/loan_registration_repository.dart';

import 'injection_container.dart';

class RepositoryRegistry {
  void registerLoanRegistrationRepository() {
    sl.registerSingleton<LoanRegistrationRepository>(LoanRegistrationRepositoryImpl(
      sl<LoanRegistrationService>(),
    ));
  }


  
}
