// presentation/gross_monthly_income/screens/gross_monthly_income_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loan/presentation/gross_monthly_income/form_controllers/additional_income_form_controller.dart';
import 'package:loan/presentation/widgets/ui/button_outlined.dart';
import 'package:loan/presentation/widgets/form_fields/dropdown_field.dart';
import 'package:loan/presentation/widgets/form_fields/form_textfield.dart';
import 'package:loan/presentation/widgets/ui/global_appbar.dart';

class AdditionalIncomeScreen extends StatefulWidget {
  const AdditionalIncomeScreen({super.key});

  @override
  State<AdditionalIncomeScreen> createState() => _AdditionalIncomeScreenState();
}

class _AdditionalIncomeScreenState extends State<AdditionalIncomeScreen> {
  late final AdditionalIncomeFormController ctrls;

  @override
  void initState() {
    super.initState();
    ctrls = AdditionalIncomeFormController.init();
  }

  @override
  void dispose() {
    ctrls.dispose();
    super.dispose();
  }

  // ---- currency helpers ----
  double _toAmount(String s) {
    final t = s.replaceAll(RegExp(r'[^0-9.]'), '');
    return double.tryParse(t.isEmpty ? '0' : t) ?? 0;
  }

  String _fmtCurrency(num v) {
    final s = v.toStringAsFixed(2);
    final parts = s.split('.');
    final head = parts[0].replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (m) => '${m[1]},',
    );
    return '\$$head.${parts[1]}';
  }

  Future<void> _save() async {
    if (!(ctrls.grossMonthlyIncomeKey.currentState?.validate() ?? false)) {
      return;
    }

    await showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (dCtx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.check_circle, size: 64, color: Colors.green),
            const SizedBox(height: 12),
            const Text(
              'Success!',
              style: TextStyle(
                color: Colors.green,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Additional income has been saved successfully.',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF2E43DA),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                Navigator.of(dCtx).pop();
                Navigator.of(context).pop({
                  'owner': ctrls.ownerCrtl.text.trim(),
                  'source': ctrls.incomeSource.text.trim(),
                  'amount': ctrls.amount.text.trim(),
                });
              },
              child: const Text('Okay'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: const GlobalAppbar(
        title: 'Add Additional Income',
        subtitle: 'Add Additional Income Information',
      ),
      body: Form(
        key: ctrls.grossMonthlyIncomeKey,
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            _OwnerField(ctrl: ctrls.ownerCrtl),
            const SizedBox(height: 16),
            _IncomeSourceField(ctrl: ctrls.incomeSource),
            const SizedBox(height: 16),
            _AmountField(
              ctrl: ctrls.amount,
              formatToCurrency: (raw) => _fmtCurrency(_toAmount(raw)),
            ),
            const SizedBox(height: 90),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 12),
          child: Row(
            children: [
              Expanded(
                child: ButtonOutlined(
                  label: 'Back',
                  onPressed: () => Navigator.pop(context),
                  backgroundColor: Colors.white,
                  foregroundColor: theme.colorScheme.primary,
                  borderColor: theme.colorScheme.primary,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: ButtonOutlined(
                  label: 'Save',
                  onPressed: _save,
                  backgroundColor: const Color(0xFF2E43DA),
                  foregroundColor: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/* ------------ Fields ------------ */

class _OwnerField extends StatelessWidget {
  final TextEditingController ctrl;
  const _OwnerField({required this.ctrl});

  @override
  Widget build(BuildContext context) {
    return DropDownField<String>(
      label: 'Belongs To',
      value: ctrl.text.isEmpty ? 'John Doe' : ctrl.text,
      items: const [
        DropdownMenuItem(value: 'John Doe', child: Text('John Doe')),
        DropdownMenuItem(value: 'Jane Doe', child: Text('Jane Doe')),
      ],
      onChanged: (v) => ctrl.text = v ?? '',
      validator: (v) => (v == null || v.isEmpty) ? 'Select a borrower' : null,
    );
  }
}

class _IncomeSourceField extends StatelessWidget {
  final TextEditingController ctrl;
  const _IncomeSourceField({required this.ctrl});

  @override
  Widget build(BuildContext context) {
    return DropDownField<String>(
      label: 'Income Source',
      value: ctrl.text.isEmpty ? null : ctrl.text,
      items: const [
        DropdownMenuItem(
          value: 'Public Assistance',
          child: Text('Public Assistance'),
        ),
        DropdownMenuItem(
          value: 'Alimony/Child Support',
          child: Text('Alimony/Child Support'),
        ),
        DropdownMenuItem(value: 'Rental Income', child: Text('Rental Income')),
        DropdownMenuItem(
          value: 'Pension/Retirement',
          child: Text('Pension/Retirement'),
        ),
        DropdownMenuItem(value: 'Other', child: Text('Other')),
      ],
      onChanged: (v) => ctrl.text = v ?? '',
      validator: (v) => (v == null || v.isEmpty) ? 'Select a source' : null,
    );
  }
}

class _AmountField extends StatelessWidget {
  final TextEditingController ctrl;
  final String Function(String) formatToCurrency;
  const _AmountField({required this.ctrl, required this.formatToCurrency});

  @override
  Widget build(BuildContext context) {
    return FormTextField(
      label: 'Amount',
      controller: ctrl,
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'[0-9,.\$]')),
      ],
      onChanged: (_) {
        final formatted = formatToCurrency(ctrl.text);
        ctrl.value = ctrl.value.copyWith(
          text: formatted,
          selection: TextSelection.collapsed(offset: formatted.length),
          composing: TextRange.empty,
        );
      },
      validator: (v) => ((v ?? '').replaceAll(RegExp(r'[^0-9]'), '').isEmpty)
          ? 'Enter amount'
          : null,
    );
  }
}
