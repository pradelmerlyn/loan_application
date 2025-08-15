import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loan/presentation/loan_registration/validators/form_validators.dart';
import 'package:loan/presentation/widgets/form_fields/currency_formatter.dart';

import 'package:loan/presentation/widgets/ui/section_header.dart';
import 'package:loan/presentation/widgets/form_fields/form_textfield.dart';
import 'package:loan/presentation/loan_registration/form_controllers/borrower_info_form_controllers.dart';
import 'package:loan/presentation/loan_registration/bloc/borrower_view/borrower_view_bloc.dart';

class MonthlyHousingExpensesSection extends StatelessWidget {
  final BorrowerInfoFormControllers borrControllers;
  const MonthlyHousingExpensesSection({
    super.key,
    required this.borrControllers,
  });

  @override
  Widget build(BuildContext context) {
    final c = borrControllers;

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(label: 'Monthly Housing Expenses'),
          const SizedBox(height: 16),
          _TwoCols(
            left: _ExpenseField(
              label: 'Mortgage P&I',
              ctrl: c.mortgageCtrl,
              field: HousingField.mortgage,
            ),
            right: _ExpenseField(
              label: 'Subordinate Mortgage',
              ctrl: c.subordinateCtrl,
              field: HousingField.subordinate,
            ),
          ),
          const SizedBox(height: 16),
          _TwoCols(
            left: _ExpenseField(
              label: 'Property Tax',
              ctrl: c.propertyTaxCtrl,
              field: HousingField.propertyTax,
            ),
            right: _ExpenseField(
              label: 'HOA Dues',
              ctrl: c.hoaDuesCtrl,
              field: HousingField.hoa,
            ),
          ),
          const SizedBox(height: 16),
          _TwoCols(
            left: _ExpenseField(
              label: 'Home Insurance',
              ctrl: c.homeInsuranceCtrl,
              field: HousingField.homeIns,
            ),
            right: _ExpenseField(
              label: 'Mortgage Insurance',
              ctrl: c.mortgageInsuranceCtrl,
              field: HousingField.mortgageIns,
            ),
          ),
          const SizedBox(height: 16),
          _ExpenseField(
            label: 'Other Housing',
            ctrl: c.otherHousingCtrl,
            field: HousingField.other,
          ),
          const SizedBox(height: 16),
          BlocBuilder<BorrowerViewBloc, BorrowerViewState>(
            buildWhen: (p, n) =>
                p.totalHousingFormatted != n.totalHousingFormatted,
            builder: (context, state) {
              return FormTextField(
                label: 'Total Housing Expenses',
                readOnly: true,
                // Use a key to force the field to refresh its text when value changes
                key: ValueKey(state.totalHousingFormatted),
                initialValue: state.totalHousingFormatted,
              );
            },
          ),
        ],
      ),
    );
  }
}

/* ----------------  widgets ---------------- */

class _TwoCols extends StatelessWidget {
  final Widget left;
  final Widget right;
  const _TwoCols({required this.left, required this.right});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: left),
        const SizedBox(width: 12),
        Expanded(child: right),
      ],
    );
  }
}

class _ExpenseField extends StatelessWidget {
  final String label;
  final TextEditingController ctrl;
  final HousingField field;

  const _ExpenseField({
    required this.label,
    required this.ctrl,
    required this.field,
  });

  @override
  Widget build(BuildContext context) {
    const borrValidator = FormValidators.i;
    return FormTextField(
      label: label,
      controller: ctrl,
      keyboardType: TextInputType.number,
      inputFormatters: const [CurrencyFormatter()],
      onChanged: (text) {
        // Push raw text to the bloc; bloc will parse/format/sum
        context.read<BorrowerViewBloc>().add(
              HousingExpenseChanged(field: field, text: text),
            );
      },
      validator: (value) => borrValidator.requiredField(value, field: label),
    );
  }
}
