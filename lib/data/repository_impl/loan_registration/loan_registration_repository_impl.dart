// data/repositories/loan_registration/loan_registration_repository_impl.dart
import 'package:dio/dio.dart';
import 'package:loan/core/config/endpoints.dart';
import 'package:loan/core/util/network/data_state.dart';
import 'package:loan/data/data_source/loan_registration/loan_registration_service.dart';
import 'package:loan/data/model/loan_registration/loan_registration_model.dart';
import 'package:loan/data/model/borrower/borrower_info/borrower_model.dart';
import 'package:loan/data/model/financial_assets/asset_model.dart';
import 'package:loan/data/model/property/property_model.dart';
import 'package:loan/domain/entities/loan_registration/loan_registration_entity.dart';
import 'package:loan/domain/repositories/loan_registration/loan_registration_repository.dart';

class LoanRegistrationRepositoryImpl implements LoanRegistrationRepository {
  final LoanRegistrationService _service;
  LoanRegistrationRepositoryImpl(this._service);

  @override
  Future<DataState<LoanRegistrationEntity>> submitApplication({
    required LoanRegistrationEntity payload,
  }) async {
    try {
      // Map Entity -> Model
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
        // Prefer [] instead of null if your API expects arrays
        assets: (payload.assets ?? const [])
            .map((e) => AssetModel.fromEntity(e))
            .toList(),
        loanPurpose: payload.loanPurpose,
        subjectPropertyFoundIndicator: payload.subjectPropertyFoundIndicator,
        subjectProperty: payload.subjectProperty != null
            ? PropertyModel.fromEntity(payload.subjectProperty!)
            : null,
        loanAmount:
            payload.loanAmount ?? 0, // normalize if API expects a number
        refinanceCashOutDeterminationType:
            payload.refinanceCashOutDeterminationType,
        desiredCashOut: payload.desiredCashOut,
        refinanceYourPrimaryHome: payload.refinanceYourPrimaryHome,
      );

      final res = await _service.submitApplication(model);
      final status = res.response.statusCode ?? 0;

      if (status >= 200 && status < 300) {
        // LoanRegistrationModel extends LoanRegistrationEntity -> type-safe
        return DataSuccess<LoanRegistrationEntity>(res.data);
      }

      return DataFailed(
        DioException(
          requestOptions: res.response.requestOptions,
          response: res.response,
          error: res.response.data ?? res.response.statusMessage,
          type: DioExceptionType.badResponse,
        ),
      );
    } on DioException catch (e) {
      return DataFailed(e);
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
