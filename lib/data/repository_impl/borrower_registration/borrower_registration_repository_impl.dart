// // data/repositories/loan_registration/borrower_step_repository_impl.dart
// import 'dart:convert';

// import 'package:dio/dio.dart';
// import 'package:flutter/foundation.dart';
// import 'package:json_annotation/json_annotation.dart'
//     show CheckedFromJsonException;
// import 'package:loan/core/config/endpoints.dart';
// import 'package:loan/core/util/network/data_state.dart';
// // Service + Models
// import 'package:loan/data/data_source/loan_registration/loan_registration_service.dart';
// import 'package:loan/data/model/borrower/borrower_info/borrower_model.dart';
// import 'package:loan/data/model/loan_registration/loan_registration_model.dart';
// // Domain
// import 'package:loan/domain/entities/borrower/borrower_info/borrower_entity.dart';
// import 'package:loan/domain/entities/loan_registration/loan_registration_response_entity.dart';
// import 'package:loan/domain/repositories/borrower_registration/borrower_registration_repository.dart';

// class BorrowerRegistrationRepositoryImpl
//     implements BorrowerRegistrationRepository {
//   final LoanRegistrationService _service;
//   BorrowerRegistrationRepositoryImpl(this._service);

//   @override
//   Future<DataState<LoanRegistrationResponseEntity>> submitApplication({
//     required BorrowerEntity borrower,
//   }) async {
//     try {
//       // 1) Build request model
//       final borrowerModel = BorrowerModel.fromEntity(borrower);
//       final requestModel = LoanRegistrationModel(
//         loanOfficerId: 'mmaine',
//         loanPurpose: 'Purchase',
//         loanAmount: 0,
//         subjectPropertyFoundIndicator: true,
//         borrower: borrowerModel,
//         assets: const [],
//       );

//       debugPrint(
//         "BORROWER MODEL IMPL: ${const JsonEncoder.withIndent('  ').convert(BorrowerModel.fromEntity(borrower).toJson())}",
//         wrapWidth: 999999,
//       );
//       debugPrint("🍔🍔🍔🍔🍔🍔🍔🍔🍔🍔");
//       debugPrint(
//         "REQUEST MODEL IMPL: ${const JsonEncoder.withIndent('  ').convert(requestModel.toJson())}",
//         wrapWidth: 999999,
//       );

//       // 2) Debug logs
//      // if (kDebugMode) {
//         debugPrint(
//           'REQUEST BODY:\n${const JsonEncoder.withIndent("  ").convert(requestModel.toJson())}',
//           wrapWidth: 999999,
//         );
//     //  }

//       // 3) Call API
//       // Note: your Retrofit method currently returns HttpResponse<LoanRegistrationResponseModel>
//       // (ensure the service method uses LoanRegistrationResponseModel as the generic)
//       final http = await _service.createBorrowerStep(requestModel.toJson());
//       final code = http.response.statusCode ?? 0;

//      // if (kDebugMode) {
//         // If Retrofit already parsed it to a model, you can still log its JSON
//         debugPrint(
//           'RESPONSE BODY:\n${const JsonEncoder.withIndent("  ").convert(http.data.toJson())}',
//           wrapWidth: 999999,
//         );
//      // }

//       if (code >= 200 && code < 300) {
//         // 4) Success -> already parsed model; return as Entity (model extends entity)
//         return DataSuccess<LoanRegistrationResponseEntity>(http.data);
//       }

//       // Non-2xx
//       return DataFailed(
//         DioException(
//           requestOptions: http.response.requestOptions,
//           response: http.response,
//           error: http.response.statusMessage,
//           type: DioExceptionType.badResponse,
//         ),
//       );
//     } on CheckedFromJsonException catch (e, st) {
//       // Thrown when @JsonSerializable(checked: true) finds a type mismatch
//       debugPrint(
//           '❌ JSON type error in ${e.className} at key "${e.key}": ${e.message}');
//       debugPrintStack(stackTrace: st);

//       return DataFailed(
//         DioException(
//           requestOptions: RequestOptions(path: Endpoints.application),
//           error: 'Invalid value for "${e.key}" in ${e.className}: ${e.message}',
//           type: DioExceptionType.unknown,
//         ),
//       );
//     } on DioException catch (e) {
//       // Network / HTTP errors
//       return DataFailed(e);
//     } on TypeError catch (e, st) {
//       // Catches other type errors (e.g., if Retrofit parsing throws a TypeError)
//       debugPrint('❌ TypeError while parsing response: $e');
//       debugPrintStack(stackTrace: st);
//       return DataFailed(
//         DioException(
//           requestOptions: RequestOptions(path: Endpoints.application),
//           error: e.toString(),
//           type: DioExceptionType.unknown,
//         ),
//       );
//     } catch (e) {
//       // Anything else
//       return DataFailed(
//         DioException(
//           requestOptions: RequestOptions(path: Endpoints.application),
//           error: e,
//           type: DioExceptionType.unknown,
//         ),
//       );
//     }
//   }
// }
