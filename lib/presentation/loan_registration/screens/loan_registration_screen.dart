// presentation/loan_registration/screens/loan_registration_screen.dart
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loan/domain/use_case/loan_registration/loan_registration_use_case.dart';
import 'package:loan/presentation/assets/form_controllers/asset_form_controllers.dart';

import 'package:loan/presentation/loan_registration/bloc/loan_registration/loan_registration_bloc.dart';
import 'package:loan/presentation/loan_registration/bloc/borrower_view/borrower_view_bloc.dart';

import 'package:loan/presentation/loan_registration/form_controllers/borrower_info_form_controllers.dart';
import 'package:loan/presentation/loan_registration/form_controllers/property_info_form_controllers.dart';
import 'package:loan/presentation/loan_registration/form_controllers/declaration_info_form_controllers.dart';
import 'package:loan/presentation/loan_registration/form_controllers/demographic_info_form_controller.dart';

import 'package:loan/presentation/loan_registration/views/borrower_view/borrower_view.dart';
import 'package:loan/presentation/loan_registration/views/property_view/property_view.dart';
import 'package:loan/presentation/loan_registration/views/financial_view/financial_view.dart';
import 'package:loan/presentation/loan_registration/views/declaration_view/declaration_view.dart';
import 'package:loan/presentation/loan_registration/views/demographics_view/demographic_view.dart';
import 'package:loan/presentation/widgets/ui/button_outlined.dart';
import 'package:loan/presentation/widgets/ui/step_progress_header.dart';
import 'package:loan/presentation/widgets/ui/success_dialog.dart';

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
    financialCtrl = AssetFormControllers.init();
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
      // initialize steps
      create: (_) => LoanRegistrationBloc(
        sl<LoanRegistrationUseCase>(),
      )..add(const InitSteps(total: 5)),
      child: BlocListener<LoanRegistrationBloc, LoanRegistrationState>(
        listener: (context, state) {
          final target = (state.currentStep - 1).clamp(0, _tabs.length - 1);
          if (_tabs.index != target) _tabs.animateTo(target);
          if (kDebugMode) debugPrint('Step -> ${state.currentStep}');
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
                      Icons.person, // Borrower
                      Icons.home_rounded, // Property
                      Icons.attach_money_rounded, // Financial
                      Icons.fact_check_rounded, // Declarations
                      Icons.groups_rounded, // Demographics
                    ],
                  ),
                ),
              ),
              body: TabBarView(
                controller: _tabs,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  // Borrower
                  BlocProvider(
                    create: (_) => BorrowerViewBloc(),
                    child: BorrowerView(
                      controllers: borrowerCtrls,
                      formKey: borrowerFormKey,
                    ),
                  ),
                  // Property
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

  // NEW: controllers
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

    return SafeArea(
      top: false,
      child: Container(
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 12),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
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
                onPressed: () {
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
                label: nextLabel,
                onPressed: () async {
                  SystemChannels.textInput.invokeMethod('TextInput.hide');
                  if (!validateForStep()) return;

                  final bloc = context.read<LoanRegistrationBloc>();
                  final isLast = bloc.state.currentStep == bloc.state.total;
                  const token = 'YOUR_JWT_TOKEN_HERE';

                  if (isLast) {
                    // Build the full payload from controllers
                    // final payload = buildLoanRegistrationPayload(
                    //   borrowerCtrls: context.findAncestorStateOfType<_LoanRegistrationScreenState>()!.borrowerCtrls,
                    //   propertyCtrls: context.findAncestorStateOfType<_LoanRegistrationScreenState>()!.propertyCtrls,
                    //   financialCtrl: context.findAncestorStateOfType<_LoanRegistrationScreenState>()!.financialCtrl,
                    //   // add declarationCtrls / demographicsCtrls if needed
                    // );

                    //bloc.add(SubmitLoanRegistration(token: token, payload: payload));
                    return;
                  }

                  bloc.add(const NextStepsEvent());
                },
                backgroundColor: theme.colorScheme.secondary,
                foregroundColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
