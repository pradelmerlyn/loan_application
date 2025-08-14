// presentation/loan_registration/screens/loan_registration_screen.dart
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loan/core/dependency_injection/injection_container.dart';

// controllers
import 'package:loan/presentation/assets/form_controllers/asset_form_controllers.dart';
import 'package:loan/presentation/loan_registration/form_controllers/borrower_info_form_controllers.dart';
import 'package:loan/presentation/loan_registration/form_controllers/property_info_form_controllers.dart';
import 'package:loan/presentation/loan_registration/form_controllers/declaration_info_form_controllers.dart';
import 'package:loan/presentation/loan_registration/form_controllers/demographic_info_form_controller.dart';

// blocs + state
import 'package:loan/presentation/loan_registration/bloc/loan_registration/loan_registration_bloc.dart';
import 'package:loan/presentation/loan_registration/bloc/loan_registration/loan_registration_state.dart';
import 'package:loan/presentation/loan_registration/bloc/borrower_view/borrower_view_bloc.dart';

// payload helpers
import 'package:loan/presentation/loan_registration/form_helpers/borrower_payload_builder.dart'
    show buildBorrowerFromForm;
import 'package:loan/presentation/loan_registration/form_helpers/payload_builder.dart'
    show buildLoanRegistrationEntityFromControllers;

// views
import 'package:loan/presentation/loan_registration/views/borrower_view/borrower_view.dart';
import 'package:loan/presentation/loan_registration/views/property_view/property_view.dart';
import 'package:loan/presentation/loan_registration/views/financial_view/financial_view.dart';
import 'package:loan/presentation/loan_registration/views/declaration_view/declaration_view.dart';
import 'package:loan/presentation/loan_registration/views/demographics_view/demographic_view.dart';

// UI
import 'package:loan/presentation/widgets/ui/button_outlined.dart';
import 'package:loan/presentation/widgets/ui/step_progress_header.dart';

class LoanRegistrationScreen extends StatefulWidget {
  const LoanRegistrationScreen({super.key});
  @override
  State<LoanRegistrationScreen> createState() => _LoanRegistrationScreenState();
}

class _LoanRegistrationScreenState extends State<LoanRegistrationScreen>
    with TickerProviderStateMixin {
  late final TabController _tabs;

  // controllers
  late final BorrowerInfoFormControllers borrowerCtrls;
  late final PropertyInfoFormControllers propertyCtrls;
  late final AssetFormControllers financialCtrl;
  late final DeclarationInfoFormControllers declarationCtrls;
  late final DemographicsFormControllers demographicsCtrls;

  // form keys
  final borrowerFormKey = GlobalKey<FormState>();
  final propertyFormKey = GlobalKey<FormState>();
  final financialFormKey = GlobalKey<FormState>();
  final declarationFormKey = GlobalKey<FormState>();
  final demographicFormKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _tabs = TabController(length: 5, vsync: this);

    borrowerCtrls = BorrowerInfoFormControllers.init();
    propertyCtrls = PropertyInfoFormControllers.init();
    financialCtrl = AssetFormControllers.single();
    declarationCtrls = DeclarationInfoFormControllers.init();
    demographicsCtrls = DemographicsFormControllers.init();

    SystemChannels.textInput.invokeMethod('TextInput.hide');
  }

  @override
  void dispose() {
    _tabs.dispose();
    borrowerCtrls.dispose();
    propertyCtrls.dispose();
    financialCtrl.dispose();
    declarationCtrls.dispose();
    demographicsCtrls.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      // ✅ use DI to build the bloc (both use cases already injected)
      create: (_) => sl<LoanRegistrationBloc>()..add(const InitSteps(total: 5)),
      child: BlocListener<LoanRegistrationBloc, LoanRegistrationState>(
        listener: (context, state) {
          final target = (state.currentStep - 1).clamp(0, 4);
          if (_tabs.index != target) _tabs.animateTo(target);

          if (kDebugMode) debugPrint('Step -> ${state.currentStep}');

          final err = state.error ?? '';
          if (state.status == LoanRegStatus.failure && err.isNotEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(err)),
            );
          }

          // move forward automatically when borrower submit succeeds
          if (state.status == LoanRegStatus.success && state.currentStep == 1) {
            context.read<LoanRegistrationBloc>().add(const NextStepsEvent());
          }
        },
        child: BlocBuilder<LoanRegistrationBloc, LoanRegistrationState>(
          builder: (context, state) {
            final theme = Theme.of(context);
            final curr = state.currentStep;
            final isFirst = curr == 1;
            final isLast = curr == state.total;
            final nextLabel = isLast ? 'SUBMIT' : 'NEXT';

            return Scaffold(
              appBar: AppBar(
                systemOverlayStyle: SystemUiOverlayStyle.light,
                backgroundColor: theme.colorScheme.primary,
                iconTheme: const IconThemeData(color: Colors.white),
                title: Text(
                  state.stepLabel.isEmpty
                      ? 'Loan Registration'
                      : state.stepLabel,
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                centerTitle: true,
                elevation: 0,
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(96),
                  child: StepProgressHeader(
                    current: state.currentStep,
                    icons: const [
                      Icons.person,
                      Icons.home_rounded,
                      Icons.attach_money_rounded,
                      Icons.fact_check_rounded,
                      Icons.groups_rounded,
                    ],
                  ),
                ),
              ),
              body: TabBarView(
                controller: _tabs,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  BlocProvider(
                    create: (_) => BorrowerViewBloc(),
                    child: BorrowerView(
                      controllers: borrowerCtrls,
                      formKey: borrowerFormKey,
                    ),
                  ),
                  PropertyView(
                    controllers: propertyCtrls,
                    formKey: propertyFormKey,
                  ),
                  FinancialView(
                    controllers: financialCtrl,
                    formKey: financialFormKey,
                  ),
                  DeclarationView(
                    controllers: declarationCtrls,
                    formKey: declarationFormKey,
                  ),
                  DemographicView(
                    controllers: demographicsCtrls,
                    formKey: demographicFormKey,
                  ),
                ],
              ),
              bottomNavigationBar: _BottomNavBar(
                isFirst: isFirst,
                nextLabel: nextLabel,
                currStep: curr,
                borrowerFormKey: borrowerFormKey,
                propertyFormKey: propertyFormKey,
                financialFormKey: financialFormKey,
                declarationFormKey: declarationFormKey,
                demographicFormKey: demographicFormKey,
                borrowerCtrls: borrowerCtrls,
                propertyCtrls: propertyCtrls,
                financialCtrl: financialCtrl,
                declarationCtrls: declarationCtrls,
                demographicsCtrls: demographicsCtrls,
              ),
            );
          },
        ),
      ),
    );
  }
}

class _BottomNavBar extends StatelessWidget {
  final bool isFirst;
  final String nextLabel;
  final int currStep;

  final GlobalKey<FormState> borrowerFormKey;
  final GlobalKey<FormState> propertyFormKey;
  final GlobalKey<FormState> financialFormKey;
  final GlobalKey<FormState> declarationFormKey;
  final GlobalKey<FormState> demographicFormKey;

  final BorrowerInfoFormControllers borrowerCtrls;
  final PropertyInfoFormControllers propertyCtrls;
  final AssetFormControllers financialCtrl;
  final DeclarationInfoFormControllers declarationCtrls;
  final DemographicsFormControllers demographicsCtrls;

  const _BottomNavBar({
    required this.isFirst,
    required this.nextLabel,
    required this.currStep,
    required this.borrowerFormKey,
    required this.propertyFormKey,
    required this.financialFormKey,
    required this.declarationFormKey,
    required this.demographicFormKey,
    required this.borrowerCtrls,
    required this.propertyCtrls,
    required this.financialCtrl,
    required this.declarationCtrls,
    required this.demographicsCtrls,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    bool validateForStep() {
      switch (currStep) {
        case 1:
          return borrowerFormKey.currentState?.validate() ?? true;
        case 2:
          return propertyFormKey.currentState?.validate() ?? true;
        case 3:
          return financialFormKey.currentState?.validate() ?? true;
        case 4:
          return declarationFormKey.currentState?.validate() ?? true;
        case 5:
          return demographicFormKey.currentState?.validate() ?? true;
        default:
          return true;
      }
    }

    final state = context.watch<LoanRegistrationBloc>().state;
    final isLoading = state.status == LoanRegStatus.loading;

    return SafeArea(
      top: false,
      child: Container(
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 12),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 16,
              offset: const Offset(0, -6),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: ButtonOutlined(
                label: isFirst ? 'CANCEL' : 'BACK',
                onPressed: isLoading
                    ? null
                    : () {
                        SystemChannels.textInput.invokeMethod('TextInput.hide');
                        if (isFirst) {
                          Navigator.maybePop(context);
                        } else {
                          context.read<LoanRegistrationBloc>().add(
                                const PrevStepsEvent(),
                              );
                        }
                      },
                backgroundColor: Colors.white,
                foregroundColor: theme.colorScheme.secondary,
                borderColor: theme.colorScheme.secondary,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: ButtonOutlined(
                label: isLoading ? 'PLEASE WAIT...' : nextLabel,
                onPressed: isLoading
                    ? null
                    : () {
                        final bloc = context.read<LoanRegistrationBloc>();
                        SystemChannels.textInput.invokeMethod('TextInput.hide');
                        if (!validateForStep()) return;

                        final isLast =
                            bloc.state.currentStep == bloc.state.total;

                        // ✅ STEP 1: submit Borrower only
                        if (bloc.state.currentStep == 1) {
                          borrowerFormKey.currentState?.save();

                          final borrower = buildBorrowerFromForm(borrowerCtrls);
                          if (kDebugMode) {
                            debugPrint(
                                '[UI] Submitting borrower: ${borrower.toJson()}');
                          }

                          context.read<LoanRegistrationBloc>().add(
                                SubmitBorrowerInfo(borrower: borrower),
                              );
                          return; // listener will advance on success
                        }

                        // ✅ FINAL SUBMIT (OPTIONAL): submit the full application
                        if (isLast) {
                          final payload =
                              buildLoanRegistrationEntityFromControllers(
                            borrowerCtrls: borrowerCtrls,
                            propertyCtrls: propertyCtrls,
                            financialCtrl: financialCtrl,
                          );
                          if (kDebugMode) {
                            debugPrint(
                                '[UI] Final submit payload: ${payload.toJson()}');
                          }
                          context
                              .read<LoanRegistrationBloc>()
                              .add(SubmitLoanRegistration(payload: payload));
                          return;
                        }

                        // otherwise go next
                        bloc.add(const NextStepsEvent());
                      },
                backgroundColor: theme.colorScheme.secondary,
                foregroundColor: Colors.white,
                trailing: isLoading
                    ? const SizedBox(
                        width: 16,
                        height: 16,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
