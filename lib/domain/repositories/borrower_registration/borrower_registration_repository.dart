
import 'package:loan/core/util/network/data_state.dart';
import 'package:loan/domain/entities/borrower/borrower_info/borrower_entity.dart';
import 'package:loan/domain/entities/loan_registration/loan_registration_entity.dart';

abstract class BorrowerRegistrationRepository {
  Future<DataState<LoanRegistrationEntity>> submitBorrower({
     required BorrowerEntity borrower,
  });
}
