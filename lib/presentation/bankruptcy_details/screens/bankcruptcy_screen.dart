// presentation/bankruptcy_details/screens/add_bankruptcy_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:loan/presentation/widgets/form_fields/dropdown_field.dart';
import 'package:loan/presentation/widgets/form_fields/form_textfield.dart';
import 'package:loan/presentation/widgets/form_fields/form_date_field.dart';
import 'package:loan/presentation/widgets/ui/button_outlined.dart';
import 'package:loan/presentation/widgets/ui/global_appbar.dart';
import 'package:loan/presentation/widgets/ui/section_header.dart';
import 'package:loan/presentation/bankruptcy_details/form_controllers/bankcruptcy_form_controller.dart';

class BankruptcyScreen extends StatefulWidget {
  const BankruptcyScreen({super.key});

  @override
  State<BankruptcyScreen> createState() => _BankruptcyScreenState();
}

class _BankruptcyScreenState extends State<BankruptcyScreen> {
  late final BankcruptcyFormController ctrls;

  @override
  void initState() {
    super.initState();
    ctrls = BankcruptcyFormController.init();
  }

  @override
  void dispose() {
    ctrls.dispose();
    super.dispose();
  }

  String _fmtDate(DateTime d) =>
      '${d.month.toString().padLeft(2, '0')}/${d.day.toString().padLeft(2, '0')}/${d.year}';

  Future<void> _pickDate(TextEditingController ctrl) async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: DateTime(1900),
      lastDate: now.add(const Duration(days: 365 * 10)),
    );
    if (picked != null) {
      ctrl.text = _fmtDate(picked);
      setState(() {});
    }
  }

  Future<void> _save() async {
    if (!(ctrls.bankcruptcyKey.currentState?.validate() ?? false)) return;

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
              'Bankruptcy details were saved successfully.',
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
                  'caseNumber': ctrls.caseNumber.text.trim(),
                  'chapter': ctrls.bankcruptcyChapter.text.trim(),
                  'status': ctrls.status.text.trim(),
                  'closeDate': ctrls.caseCloseDate.text.trim(),
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
    final primary = Theme.of(context).colorScheme.primary;

    return Scaffold(
      appBar: const GlobalAppbar(title: 'Add Bankruptcy'),
      body: Form(
        key: ctrls.bankcruptcyKey,
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            const SectionHeader(label: 'Details'),
            const SizedBox(height: 12),
            _CaseNumberField(ctrl: ctrls.caseNumber),
            const SizedBox(height: 16),
            _ChapterField(ctrl: ctrls.bankcruptcyChapter),
            const SizedBox(height: 16),
            _StatusField(ctrl: ctrls.status),
            const SizedBox(height: 16),
            _CloseDateField(
              ctrl: ctrls.caseCloseDate,
              onPick: () => _pickDate(ctrls.caseCloseDate),
            ),
            const SizedBox(height: 90),
          ],
        ),
      ),
      bottomNavigationBar: _BottomButtons(onSave: _save, primary: primary),
    );
  }
}

/* ---------------- Small field widgets ---------------- */

class _BottomButtons extends StatelessWidget {
  final VoidCallback onSave;
  final Color primary;
  const _BottomButtons({required this.onSave, required this.primary});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                foregroundColor: primary,
                borderColor: primary,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: ButtonOutlined(
                label: 'Save',
                onPressed: onSave, // <- uses callback
                backgroundColor: primary,
                foregroundColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CaseNumberField extends StatelessWidget {
  final TextEditingController ctrl;
  const _CaseNumberField({required this.ctrl});

  @override
  Widget build(BuildContext context) {
    return FormTextField(
      label: 'Case Number',
      controller: ctrl,
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      validator: (v) => (v ?? '').trim().isEmpty ? 'Required' : null,
    );
  }
}

class _ChapterField extends StatelessWidget {
  final TextEditingController ctrl;
  const _ChapterField({required this.ctrl});

  @override
  Widget build(BuildContext context) {
    return FormTextField(
      label: 'Bankruptcy Chapter',
      controller: ctrl,
      validator: (v) => (v ?? '').trim().isEmpty ? 'Required' : null,
    );
  }
}

class _StatusField extends StatelessWidget {
  final TextEditingController ctrl;
  const _StatusField({required this.ctrl});

  @override
  Widget build(BuildContext context) {
    return DropDownField<String>(
      label: 'Dismissed or Discharged',
      value: ctrl.text.isEmpty ? null : ctrl.text,
      items: const [
        DropdownMenuItem(value: 'Dismissed', child: Text('Dismissed')),
        DropdownMenuItem(value: 'Discharged', child: Text('Discharged')),
        DropdownMenuItem(value: 'Pending', child: Text('Pending')),
      ],
      onChanged: (v) => ctrl.text = v ?? '',
      validator: (v) =>
          (v == null || v.isEmpty) ? 'Please select a status' : null,
    );
  }
}

class _CloseDateField extends StatelessWidget {
  final TextEditingController ctrl;
  final VoidCallback onPick;
  const _CloseDateField({required this.ctrl, required this.onPick});

  @override
  Widget build(BuildContext context) {
    return DateFormField(
      label: 'Case Close Date',
      controller: ctrl,
      onPick: onPick,
      validator: (v) => (v == null || v.isEmpty) ? 'Select date' : null,
    );
  }
}
