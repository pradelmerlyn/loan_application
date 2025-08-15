
import 'package:loan/domain/use_case/loan_registration/submit_loan_use_case.dart';
import 'package:loan/presentation/loan_registration/bloc/loan_registration/loan_registration_bloc.dart';

import 'injection_container.dart';

class BlocRegistry {
  void registerLoanRegistrationBlocs() {
    sl.registerFactory<LoanRegistrationBloc>(() => LoanRegistrationBloc(
          submitApplicationUseCase: sl<SubmitLoanUseCase>(),
        ));
  }
}
