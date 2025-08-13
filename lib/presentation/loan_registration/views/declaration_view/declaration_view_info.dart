// presentation/loan_registration/views/declarations/declaration_info_section.dart
import 'package:flutter/material.dart';
import 'package:loan/presentation/bankruptcy_details/screens/bankcruptcy_screen.dart';
import 'package:loan/presentation/loan_registration/form_controllers/declaration_info_form_controllers.dart';
import 'package:loan/presentation/widgets/form_fields/dropdown_field.dart';
import 'package:loan/presentation/widgets/form_fields/form_date_field.dart';
import 'package:loan/presentation/widgets/form_fields/form_textfield.dart';
import 'package:loan/presentation/widgets/form_fields/toggle_switch.dart';
import 'package:loan/presentation/widgets/ui/button_outlined.dart';
import 'package:loan/presentation/widgets/ui/inset_card.dart';
import 'package:loan/presentation/widgets/ui/question_card.dart';

class DeclarationInfoSection extends StatelessWidget {
  final DeclarationInfoFormControllers ctrls;
  const DeclarationInfoSection({super.key, required this.ctrls});

  // date helpers
  String _fmtDate(DateTime d) =>
      '${d.month.toString().padLeft(2, '0')}/${d.day.toString().padLeft(2, '0')}/${d.year}';

  Future<void> _pickDate(
    BuildContext context,
    TextEditingController ctrl,
  ) async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: DateTime(1900),
      lastDate: now.add(const Duration(days: 365 * 5)),
    );
    if (picked != null) ctrl.text = _fmtDate(picked);
  }

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Simple toggles
          _ToggleQuestion(
            label: 'Occupying the property?',
            controller: ctrls.occupying,
          ),
          _ToggleQuestion(
            label:
                'Family relationship or business affiliation with the seller?',
            controller: ctrls.familyRelationship,
          ),

          _ToggleQuestion(
            label:
                'Will the borrower apply for a mortgage on another property before closing?',
            controller: ctrls.applyOtherMortgage,
          ),

          _ToggleQuestion(
            label: 'Subject property subject to lien that could take priority?',
            controller: ctrls.subjectToLien,
          ),

          _ToggleQuestion(
            label: 'Outstanding judgments against?',
            controller: ctrls.outstandingJudgments,
          ),

          _ToggleQuestion(
            label: 'Is the borrower party to a lawsuit?',
            controller: ctrls.partyToLawsuit,
          ),

          _ShortSaleField(
            toggleCtrl: ctrls.shortSale,
            dateCtrl: ctrls.shortSaleDateCtrl,
            onPickDate: () => _pickDate(context, ctrls.shortSaleDateCtrl),
          ),

          _BankruptcyField(
            toggleCtrl: ctrls.declaredBankruptcy,
            onAdd: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const BankruptcyScreen()),
              );
            },
          ),

          _OwnedHomeField(
            toggleCtrl: ctrls.ownedHome3yrs,
            priorUsageCtrl: ctrls.priorUsageCtrl,
            priorTitleCtrl: ctrls.priorTitleCtrl,
          ),

          _UndisclosedFundsField(
            toggleCtrl: ctrls.usingUndisclosedFunds,
            amountCtrl: ctrls.undisclosedAmountCtrl,
          ),

          _ToggleQuestion(
            label: 'Co‑signer or guarantor on undisclosed debt?',
            controller: ctrls.cosignerOnUndisclosedDebt,
          ),
          _ToggleQuestion(
            label: 'Presently delinquent on federal debt?',
            controller: ctrls.delinquentFederalDebt,
          ),

          _DeedInLieuField(
            toggleCtrl: ctrls.deedInLieu,
            dateCtrl: ctrls.deedLieuDateCtrl,
            onPickDate: () => _pickDate(context, ctrls.deedLieuDateCtrl),
          ),

          _ToggleQuestion(
            label: 'Applying for other credit before closing?',
            controller: ctrls.applyingOtherCredit,
          ),
        ],
      ),
    );
  }
}

/* ----------------- Fields ----------------- */

class _ToggleQuestion extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  const _ToggleQuestion({required this.label, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: ToggleSwitchField(
        label: label,
        controller: controller,
        trueLabel: 'YES',
        falseLabel: 'NO',
        storeAsYesNo: true,
      ),
    );
  }
}

class _ShortSaleField extends StatelessWidget {
  final TextEditingController toggleCtrl;
  final TextEditingController dateCtrl;
  final VoidCallback onPickDate;
  const _ShortSaleField({
    required this.toggleCtrl,
    required this.dateCtrl,
    required this.onPickDate,
  });

  bool _asBool(String t) {
    final s = t.trim().toLowerCase();
    return s == 'true' || s == 'yes' || s == '1';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: QuestionCard(
        child: Column(
          children: [
            ToggleSwitchField(
              label: 'Completed short sale last 7 years?',
              controller: toggleCtrl,
              trueLabel: 'YES',
              falseLabel: 'NO',
              storeAsYesNo: true,
            ),
            const SizedBox(height: 12),
            ValueListenableBuilder<TextEditingValue>(
              valueListenable: toggleCtrl,
              builder: (_, v, __) => _asBool(v.text)
                  ? InsetCard(
                      child: DateFormField(
                        label: 'Date short sale completed',
                        controller: dateCtrl,
                        onPick: onPickDate,
                      ),
                    )
                  : const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}

class _BankruptcyField extends StatelessWidget {
  final TextEditingController toggleCtrl;
  final VoidCallback onAdd;
  const _BankruptcyField({required this.toggleCtrl, required this.onAdd});

  bool _asBool(String t) {
    final s = t.trim().toLowerCase();
    return s == 'true' || s == 'yes' || s == '1';
  }

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: QuestionCard(
        child: Column(
          children: [
            ToggleSwitchField(
              label: 'Declared bankruptcy in last 7 years?',
              controller: toggleCtrl,
              trueLabel: 'YES',
              falseLabel: 'NO',
              storeAsYesNo: true,
            ),
            const SizedBox(height: 12),
            ValueListenableBuilder<TextEditingValue>(
              valueListenable: toggleCtrl,
              builder: (_, v, __) => _asBool(v.text)
                  ? Column(
                      children: [
                        const _BankruptcyCard(),
                        const SizedBox(height: 12),
                        ButtonOutlined(
                          label: 'Add Bankruptcy',
                          onPressed: onAdd,
                          backgroundColor: Colors.white,
                          foregroundColor: primary,
                          borderColor: primary,
                        ),
                      ],
                    )
                  : const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}

class _OwnedHomeField extends StatelessWidget {
  final TextEditingController toggleCtrl;
  final TextEditingController priorUsageCtrl;
  final TextEditingController priorTitleCtrl;
  const _OwnedHomeField({
    required this.toggleCtrl,
    required this.priorUsageCtrl,
    required this.priorTitleCtrl,
  });

  bool _asBool(String t) {
    final s = t.trim().toLowerCase();
    return s == 'true' || s == 'yes' || s == '1';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: QuestionCard(
        child: Column(
          children: [
            ToggleSwitchField(
              label: 'Owned a home in past 3 years?',
              controller: toggleCtrl,
              trueLabel: 'YES',
              falseLabel: 'NO',
              storeAsYesNo: true,
            ),
            const SizedBox(height: 12),
            ValueListenableBuilder<TextEditingValue>(
              valueListenable: toggleCtrl,
              builder: (_, v, __) => _asBool(v.text)
                  ? Column(
                      children: [
                        DropDownField<String>(
                          label: 'Prior property usage',
                          value: priorUsageCtrl.text.isEmpty
                              ? null
                              : priorUsageCtrl.text,
                          items: const [
                            DropdownMenuItem(
                              value: 'Primary Residence',
                              child: Text('Primary Residence'),
                            ),
                            DropdownMenuItem(
                              value: 'Second Home',
                              child: Text('Second Home'),
                            ),
                            DropdownMenuItem(
                              value: 'Investment',
                              child: Text('Investment'),
                            ),
                          ],
                          onChanged: (val) => priorUsageCtrl.text = val ?? '',
                          validator: (v) =>
                              (v == null || v.isEmpty) ? 'Select usage' : null,
                        ),
                        const SizedBox(height: 12),
                        DropDownField<String>(
                          label: 'Prior property title held',
                          value: priorTitleCtrl.text.isEmpty
                              ? null
                              : priorTitleCtrl.text,
                          items: const [
                            DropdownMenuItem(
                              value: 'Sole',
                              child: Text('Sole'),
                            ),
                            DropdownMenuItem(
                              value: 'Joint',
                              child: Text('Joint'),
                            ),
                            DropdownMenuItem(
                              value: 'Other',
                              child: Text('Other'),
                            ),
                          ],
                          onChanged: (val) => priorTitleCtrl.text = val ?? '',
                          validator: (v) =>
                              (v == null || v.isEmpty) ? 'Select title' : null,
                        ),
                      ],
                    )
                  : const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}

class _UndisclosedFundsField extends StatelessWidget {
  final TextEditingController toggleCtrl;
  final TextEditingController amountCtrl;
  const _UndisclosedFundsField({
    required this.toggleCtrl,
    required this.amountCtrl,
  });

  bool _asBool(String t) {
    final s = t.trim().toLowerCase();
    return s == 'true' || s == 'yes' || s == '1';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        children: [
          ToggleSwitchField(
            label:
                'Using undisclosed funds from other party for cash to close?',
            controller: toggleCtrl,
            trueLabel: 'YES',
            falseLabel: 'NO',
            storeAsYesNo: true,
          ),
          const SizedBox(height: 12),
          ValueListenableBuilder<TextEditingValue>(
            valueListenable: toggleCtrl,
            builder: (_, v, __) => _asBool(v.text)
                ? InsetCard(
                    child: FormTextField(
                      label: 'Undisclosed borrowed funds amount',
                      controller: amountCtrl,
                      keyboardType: TextInputType.number,
                    ),
                  )
                : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}

class _DeedInLieuField extends StatelessWidget {
  final TextEditingController toggleCtrl;
  final TextEditingController dateCtrl;
  final VoidCallback onPickDate;
  const _DeedInLieuField({
    required this.toggleCtrl,
    required this.dateCtrl,
    required this.onPickDate,
  });

  bool _asBool(String t) {
    final s = t.trim().toLowerCase();
    return s == 'true' || s == 'yes' || s == '1';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ToggleSwitchField(
          label: 'Conveyed deed in lieu last 7 years?',
          controller: toggleCtrl,
          trueLabel: 'YES',
          falseLabel: 'NO',
          storeAsYesNo: true,
        ),
        const SizedBox(height: 12),
        ValueListenableBuilder<TextEditingValue>(
          valueListenable: toggleCtrl,
          builder: (_, v, __) => _asBool(v.text)
              ? InsetCard(
                  child: DateFormField(
                    label: 'Date deed in lieu conveyed',
                    controller: dateCtrl,
                    onPick: onPickDate,
                  ),
                )
              : const SizedBox.shrink(),
        ),
      ],
    );
  }
}

/* -------- Tiny visual stub kept (matches your previous design) -------- */

class _BankruptcyCard extends StatelessWidget {
  const _BankruptcyCard();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.black.withValues(alpha: 0.08)),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _MiniHeading('Bankruptcy Details'),
          SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: _MiniInfo(label: 'Case number', value: '12345'),
              ),
              SizedBox(width: 12),
              Expanded(
                child: _MiniInfo(label: 'Bankruptcy chapter', value: 'Chapter'),
              ),
            ],
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: _MiniInfo(
                  label: 'Dismissed or discharged',
                  value: 'Discharged',
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: _MiniInfo(label: 'Case close date', value: '01/02/2020'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _MiniHeading extends StatelessWidget {
  final String text;
  const _MiniHeading(this.text);
  @override
  Widget build(BuildContext context) => Text(
    text,
    style: Theme.of(
      context,
    ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
  );
}

class _MiniInfo extends StatelessWidget {
  final String label;
  final String value;
  const _MiniInfo({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: theme.textTheme.bodySmall?.copyWith(color: theme.hintColor),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: theme.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
