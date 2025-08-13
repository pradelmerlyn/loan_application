

import 'package:dio/dio.dart';
import 'package:loan/core/config/endpoints.dart';
import 'package:retrofit/retrofit.dart';
import 'package:loan/data/model/loan_registration/loan_registration_model.dart';

part 'loan_registration_service.g.dart';

@RestApi(baseUrl: Endpoints.baseUrl)
abstract class LoanRegistrationService {
  factory LoanRegistrationService(Dio dio, {String baseUrl}) =
      _LoanRegistrationService;

  @POST(Endpoints.application)
  Future<HttpResponse<LoanRegistrationModel>> createLoanId(
    @Header('Authorization') String auth,
    @Body() LoanRegistrationModel body,
  );
}
