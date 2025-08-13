import 'package:get_it/get_it.dart';
import 'package:loan/core/dependency_injection/bloc_registry.dart';
import 'package:loan/core/dependency_injection/repository_registry.dart';
import 'package:loan/core/dependency_injection/service_registry.dart';
import 'package:loan/core/dependency_injection/use_case_registry.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  //! ----- services -----
  final ServicesRegistry servicesRegistry = ServicesRegistry();
  servicesRegistry.registerLoanRegistrationServices();

  //! ----- repositories -----
  final RepositoryRegistry repositoryRegistry = RepositoryRegistry();
  repositoryRegistry.registerLoanRegistrationRepository();

  //! ----- use cases -----
  final UseCaseRegistry useCaseRegistry = UseCaseRegistry();
  useCaseRegistry.registerLoanRegistrationUseCases();

  //! ----- blocs -----
  final BlocRegistry blocsRegistry = BlocRegistry();
  blocsRegistry.registerLoanRegistrationBlocs();

  
}
