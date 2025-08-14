// data/data_source/loan_registration/loan_registration_service.dart
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:loan/core/config/endpoints.dart';
import 'package:loan/data/model/loan_registration/loan_registration_model.dart';

part 'loan_registration_service.g.dart';

@RestApi(baseUrl: Endpoints.baseUrl)
abstract class LoanRegistrationService {
  factory LoanRegistrationService(Dio dio, {String baseUrl}) =
      _LoanRegistrationService;

  /// Step 1: POST /application (borrower/minimal payload)
  @POST(Endpoints.application)
  Future<HttpResponse<LoanRegistrationModel>> createBorrowerStep(
    @Body() LoanRegistrationModel payload,
  );

  /// Final submit: POST /application/submitapp (full payload)
  @POST(Endpoints.submitApplication)
  Future<HttpResponse<LoanRegistrationModel>> submitApplication(
    @Body() LoanRegistrationModel payload,
  );
}
