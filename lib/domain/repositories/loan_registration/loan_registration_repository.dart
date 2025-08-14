import 'package:loan/core/util/network/data_state.dart';
import 'package:loan/domain/entities/loan_registration/loan_registration_entity.dart';

abstract class LoanRegistrationRepository {
  Future<DataState<LoanRegistrationEntity>> submitApplication({
    //required String token,
    required LoanRegistrationEntity payload,
  });
}
