
import 'package:loan/core/config/endpoints.dart';
import 'package:loan/core/util/network/dio_instance.dart';
import 'package:loan/data/data_source/loan_registration/loan_registration_service.dart';

import 'injection_container.dart';

class ServicesRegistry {

  void registerLoanRegistrationServices() {
    sl.registerLazySingleton<LoanRegistrationService>(
      () => LoanRegistrationService(DioInstance.init(), baseUrl: Endpoints.baseUrl),
    );
    
  }


}
