import 'package:loan/domain/entities/loan_registration/loan_registration_response_entity.dart';

extension LoanRegistrationResponseX on LoanRegistrationResponseEntity {
  bool get isValid =>
      (id != null && id!.isNotEmpty) &&
      (loanNumber != null) &&
      (borrower != null);

  String get validationErrorMessage {
    if (id == null || id!.isEmpty) return 'Missing application id';
    if (loanNumber == null) return 'Missing loan number';
    if (borrower == null) return 'Missing borrower in response';
    return 'Invalid response';
  }
}
