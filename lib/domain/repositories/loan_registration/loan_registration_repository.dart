import 'package:loan/core/util/network/data_state.dart';
import 'package:loan/domain/entities/borrower/borrower_info/borrower_entity.dart';
import 'package:loan/domain/entities/loan_registration/loan_registration_entity.dart';
import 'package:loan/domain/entities/loan_registration/loan_registration_response_entity.dart';

abstract class LoanRegistrationRepository {
  // submit borrower partial data
  Future<DataState<LoanRegistrationResponseEntity>> submitBorrower({
    required BorrowerEntity borrower,
  });

  // submit loan application data
  Future<DataState<LoanRegistrationResponseEntity>> submitApplication({
    required LoanRegistrationEntity payload,
  });
}
