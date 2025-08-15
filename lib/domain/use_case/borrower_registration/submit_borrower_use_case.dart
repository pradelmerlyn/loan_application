// // domain/use_case/loan_registration/submit_borrower_use_case.dart
// import 'package:equatable/equatable.dart';
// import 'package:loan/core/util/network/data_state.dart';
// import 'package:loan/domain/entities/borrower/borrower_info/borrower_entity.dart';
// import 'package:loan/domain/entities/loan_registration/loan_registration_response_entity.dart';
// import 'package:loan/domain/repositories/borrower_registration/borrower_registration_repository.dart';

// class SubmitBorrowerUseCase {
//   final BorrowerRegistrationRepository _repo;
//   SubmitBorrowerUseCase(this._repo);

//   Future<DataState<LoanRegistrationResponseEntity>> call(
//     SubmitBorrowerParams params,
//   ) {
//     return _repo.submitApplication(payload: params.pa);
//   }
// }

// class SubmitBorrowerParams extends Equatable {
//   final BorrowerEntity borrower;
//   const SubmitBorrowerParams({required this.borrower});

//   @override
//   List<Object?> get props => [borrower];
// }
