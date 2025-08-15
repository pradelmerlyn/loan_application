
import 'package:loan/data/repository_impl/loan_registration/loan_registration_repository_impl.dart';
import 'package:loan/domain/repositories/loan_registration/loan_registration_repository.dart';

import 'injection_container.dart';

class RepositoryRegistry {
  void registerLoanRegistrationRepository() {
    // sl.registerLazySingleton<BorrowerRegistrationRepository>(
    //   () => BorrowerRegistrationRepositoryImpl(
    //       sl()), // 
    // );
    sl.registerLazySingleton<LoanRegistrationRepository>(
      () => LoanRegistrationRepositoryImpl(sl()),
    );
  }


  
}
