// data/data_source/loan_registration/loan_registration_service.dart
import 'package:dio/dio.dart';
import 'package:loan/core/config/endpoints.dart';
import 'package:loan/data/model/loan_registration/loan_registration_response_model.dart';
import 'package:retrofit/retrofit.dart';

part 'loan_registration_service.g.dart';

@RestApi(baseUrl: Endpoints.baseUrl)
abstract class LoanRegistrationService {
  factory LoanRegistrationService(Dio dio, {String baseUrl}) =
      _LoanRegistrationService;

  /// Step 1: POST /application (borrower/minimal payload)
  @POST(Endpoints.application)
  Future<HttpResponse<LoanRegistrationResponseModel>> createBorrowerStep(
    @Body() Map<String, dynamic> payload,
  );

  /// Final submit: POST /application/submitapp (full payload)
  @POST(Endpoints.submitApplication)
  Future<HttpResponse<LoanRegistrationResponseModel>> submitApplication(
     @Body() Map<String, dynamic> payload,
  );
}
