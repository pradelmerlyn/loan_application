
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart'
    show CheckedFromJsonException;
import 'package:loan/core/config/endpoints.dart';
import 'package:loan/core/util/network/data_state.dart';
import 'package:loan/data/data_source/loan_registration/loan_registration_service.dart';
import 'package:loan/data/model/borrower/borrower_info/borrower_model.dart';
import 'package:loan/data/model/loan_registration/loan_registration_model.dart';
import 'package:loan/data/model/financial_assets/asset_model.dart';
import 'package:loan/data/model/property/property_model.dart';
import 'package:loan/domain/entities/borrower/borrower_info/borrower_entity.dart';
import 'package:loan/domain/entities/loan_registration/loan_registration_entity.dart';
import 'package:loan/domain/entities/loan_registration/loan_registration_response_entity.dart';
import 'package:loan/domain/repositories/loan_registration/loan_registration_repository.dart';

class LoanRegistrationRepositoryImpl implements LoanRegistrationRepository {
  final LoanRegistrationService _service;
  LoanRegistrationRepositoryImpl(this._service);

  @override
  Future<DataState<LoanRegistrationResponseEntity>> submitBorrower({
    required BorrowerEntity borrower,
  }) async {
    try {
      // Minimal step-1 envelope
      final borrowerModel = BorrowerModel.fromEntity(borrower);
      final req = LoanRegistrationModel(
        loanOfficerId: 'mmaine',
        loanPurpose: 'Purchase',
        loanAmount: 0,
        subjectPropertyFoundIndicator: true,
        borrower: borrowerModel,
        assets: const [],
      );

      if (kDebugMode) {
        debugPrint(
            'STEP1 REQUEST:\n${const JsonEncoder.withIndent('  ').convert(req.toJson())}');
      }

      final http = await _service.createBorrowerStep(req.toJson());
      final code = http.response.statusCode ?? 0;

      if (kDebugMode) {
        debugPrint(
            'STEP1 RESPONSE:\n${const JsonEncoder.withIndent('  ').convert(http.data.toJson())}');
      }

      if (code >= 200 && code < 300) {
        return DataSuccess<LoanRegistrationResponseEntity>(http.data);
      }

      return DataFailed(
        DioException(
          requestOptions: http.response.requestOptions,
          response: http.response,
          error: http.response.data ?? http.response.statusMessage,
          type: DioExceptionType.badResponse,
        ),
      );
    } on CheckedFromJsonException catch (e, st) {
      debugPrint(
          '❌ JSON type error in ${e.className} at key "${e.key}": ${e.message}');
      debugPrintStack(stackTrace: st);
      return DataFailed(
        DioException(
          requestOptions: RequestOptions(path: Endpoints.application),
          error: 'Invalid value for "${e.key}" in ${e.className}: ${e.message}',
          type: DioExceptionType.unknown,
        ),
      );
    } on DioException catch (e) {
      return DataFailed(e);
    } on TypeError catch (e, st) {
      debugPrint('❌ TypeError while parsing step-1 response: $e');
      debugPrintStack(stackTrace: st);
      return DataFailed(
        DioException(
          requestOptions: RequestOptions(path: Endpoints.application),
          error: e.toString(),
          type: DioExceptionType.unknown,
        ),
      );
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

  @override
  Future<DataState<LoanRegistrationResponseEntity>> submitApplication({
    required LoanRegistrationEntity payload,
  }) async {
    try {
      final model = LoanRegistrationModel(
        loanOfficerId: (payload.loanOfficerId?.isNotEmpty ?? false)
            ? payload.loanOfficerId
            : 'mmaine',
        branchId: payload.branchId,
        id: payload.id,
        borrower: payload.borrower != null
            ? BorrowerModel.fromEntity(payload.borrower!)
            : null,
        coBorrower: payload.coBorrower != null
            ? BorrowerModel.fromEntity(payload.coBorrower!)
            : null,
        assets: (payload.assets ?? const [])
            .map((e) => AssetModel.fromEntity(e))
            .toList(),
        loanPurpose: payload.loanPurpose,
        subjectPropertyFoundIndicator: payload.subjectPropertyFoundIndicator,
        subjectProperty: payload.subjectProperty != null
            ? PropertyModel.fromEntity(payload.subjectProperty!)
            : null,
        loanAmount: payload.loanAmount ?? 0,
        refinanceCashOutDeterminationType:
            payload.refinanceCashOutDeterminationType,
        desiredCashOut: payload.desiredCashOut,
        refinanceYourPrimaryHome: payload.refinanceYourPrimaryHome,
      );

      if (kDebugMode) {
        debugPrint("🍔🍔🍔🍔🍔🍔🍔🍔🍔🍔");
        debugPrint(
            'SUBMIT APP REQUEST:\n${const JsonEncoder.withIndent('  ').convert(model.toJson())}');
      }

      final http = await _service.submitApplication(model.toJson());
      final code = http.response.statusCode ?? 0;

      if (kDebugMode) {
        debugPrint(
            'SUBMIT APP RESPONSE:\n${const JsonEncoder.withIndent('  ').convert(http.data.toJson())}');
      }

      if (code >= 200 && code < 300) {
        return DataSuccess<LoanRegistrationResponseEntity>(http.data);
      }

      return DataFailed(
        DioException(
          requestOptions: http.response.requestOptions,
          response: http.response,
          error: http.response.data ?? http.response.statusMessage,
          type: DioExceptionType.badResponse,
        ),
      );
    } on CheckedFromJsonException catch (e, st) {
      debugPrint(
          '❌ JSON type error in ${e.className} at key "${e.key}": ${e.message}');
      debugPrintStack(stackTrace: st);
      return DataFailed(
        DioException(
          requestOptions: RequestOptions(path: Endpoints.submitApplication),
          error: 'Invalid value for "${e.key}" in ${e.className}: ${e.message}',
          type: DioExceptionType.unknown,
        ),
      );
    } on DioException catch (e) {
      return DataFailed(e);
    } on TypeError catch (e, st) {
      debugPrint('❌ TypeError while parsing submitApplication response: $e');
      debugPrintStack(stackTrace: st);
      return DataFailed(
        DioException(
          requestOptions: RequestOptions(path: Endpoints.submitApplication),
          error: e.toString(),
          type: DioExceptionType.unknown,
        ),
      );
    } catch (e) {
      return DataFailed(
        DioException(
          requestOptions: RequestOptions(path: Endpoints.submitApplication),
          error: e,
          type: DioExceptionType.unknown,
        ),
      );
    }
  }
}
