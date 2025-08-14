import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:loan/core/config/endpoints.dart';
import 'package:loan/core/util/network/data_state.dart';

// Service + Models
import 'package:loan/data/data_source/loan_registration/loan_registration_service.dart';
import 'package:loan/data/model/loan_registration/loan_registration_model.dart';
import 'package:loan/data/model/borrower/borrower_info/borrower_model.dart';

// Domain
import 'package:loan/domain/entities/borrower/borrower_info/borrower_entity.dart';
import 'package:loan/domain/entities/loan_registration/loan_registration_entity.dart';
import 'package:loan/domain/repositories/borrower_registration/borrower_registration_repository.dart';

class BorrowerRegistrationRepositoryImpl
    implements BorrowerRegistrationRepository {
  final LoanRegistrationService _service;
  BorrowerRegistrationRepositoryImpl(this._service);

  @override
  Future<DataState<LoanRegistrationEntity>> submitBorrower({
    required BorrowerEntity borrower,
  }) async {
    try {
      // Wrap the borrower with the minimal envelope your API expects
      final request = LoanRegistrationModel(
        loanOfficerId: 'mmaine', // default per requirement
        loanPurpose: 'Purchase', // minimal value for step 1
        loanAmount: 0, // minimal value for step 1
        subjectPropertyFoundIndicator: true, // optional but often required
        borrower: BorrowerModel.fromEntity(borrower),
      );

      debugPrint(
        "BORROWER MODEL IMPL: ${const JsonEncoder.withIndent('  ').convert(BorrowerModel.fromEntity(borrower).toJson())}",
        wrapWidth: 999999,
      );
      debugPrint("🍔🍔🍔🍔🍔🍔🍔🍔🍔🍔");
      debugPrint(
        "REQUEST MODEL IMPL: ${const JsonEncoder.withIndent('  ').convert(request.toJson())}",
        wrapWidth: 999999,
      );

      // Call the step-1 endpoint (adjust method name to your service)
      final res = await _service.createBorrowerStep(request);
      final code = res.response.statusCode ?? 0;

      if (code >= 200 && code < 300) {
        // res.data should already be a LoanRegistrationModel which extends the entity
        return DataSuccess<LoanRegistrationEntity>(res.data);
      }

      return DataFailed(
        DioException(
          requestOptions: res.response.requestOptions,
          response: res.response,
          error: res.response.statusMessage,
          type: DioExceptionType.badResponse,
        ),
      );
    } on DioException catch (e) {
      return DataFailed(e);
    } catch (e) {
      return DataFailed(
        DioException(
          requestOptions: RequestOptions(path: Endpoints.application),
          error: e,
          type: DioExceptionType.unknown,
        ),
      );
    }
  }
}
