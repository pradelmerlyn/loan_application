import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:loan/presentation/employment/form_controllers/employment_form_controllers.dart';
import 'package:loan/presentation/widgets/form_fields/form_textfield.dart';
import 'package:loan/presentation/widgets/form_fields/dropdown_field.dart';
import 'package:loan/presentation/widgets/ui/button_outlined.dart';
import 'package:loan/presentation/widgets/ui/global_appbar.dart';
import 'package:loan/presentation/widgets/ui/section_header.dart';
import 'package:loan/domain/entities/employment/employment_item_entity.dart';

class EmploymentFormScreen extends StatefulWidget {
  const EmploymentFormScreen({super.key});

  @override
  State<EmploymentFormScreen> createState() => _EmploymentFormScreenState();
}

class _EmploymentFormScreenState extends State<EmploymentFormScreen> {
  late final EmploymentFormControllers ctrls;

  DateTime? _startDate;
  DateTime? _endDate;

  @override
  void initState() {
    super.initState();
    ctrls = EmploymentFormControllers.init();

    // Defaults (optional)
    ctrls.isCurrentJobCtrl.text = 'true';
    ctrls.ownerCtrl.text = 'John Doe';
    ctrls.stateCtrl.text = 'California';
  }

  @override
  void dispose() {
    ctrls.dispose();
    super.dispose();
  }

  String _fmtDate(DateTime d) =>
      '${d.month.toString().padLeft(2, '0')}/${d.day.toString().padLeft(2, '0')}/${d.year}';

  Future<void> _pickDate({required bool start}) async {
    final seed = start
        ? (_startDate ?? DateTime(2019, 10, 9))
        : (_endDate ?? DateTime.now());
    final picked = await showDatePicker(
      context: context,
      initialDate: seed,
      firstDate: DateTime(1900),
      lastDate: DateTime.now().add(const Duration(days: 365 * 5)),
    );
    if (picked != null) {
      setState(() {
        if (start) {
          _startDate = picked;
          ctrls.startDateCtrl.text = _fmtDate(
            picked,
          ); // <- makes the field update
        } else {
          _endDate = picked;
          ctrls.endDateCtrl.text = _fmtDate(
            picked,
          ); // <- makes the field update
        }
      });
    }
  }

  // helpers to use the YES/NO or true/false text fields as booleans
  bool _textBool(TextEditingController c) =>
      (c.text.toLowerCase() == 'true' || c.text.toUpperCase() == 'YES');
  void _setBool(TextEditingController c, bool v) =>
      c.text = v ? 'true' : 'false';

  Future<void> _save() async {
    if (!(ctrls.employmentInfoKey.currentState?.validate() ?? false)) return;

    final item = EmploymentItem(
      employer: ctrls.employerNameCtrl.text.trim(),
      isCurrent: _textBool(ctrls.isCurrentJobCtrl),
      jobType: 'Full Time',
      since: _startDate == null ? '' : 'Since ${_fmtDate(_startDate!)}',
      belongsTo: ctrls.ownerCtrl.text.trim().isEmpty
          ? 'John Doe'
          : ctrls.ownerCtrl.text.trim(),
      annualSalary: r'$80,000.00/Year',
    );

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
              'Employment item has been saved successfully.',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.of(dCtx).pop();
                Navigator.of(context).pop(item);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
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
        title: 'Add Employment',
        subtitle: 'Add Employment Information',
      ),
      body: Form(
        key: ctrls.employmentInfoKey,
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            // top checkboxes bound to text controllers
            CheckboxListTile(
              value: _textBool(ctrls.isCurrentJobCtrl),
              onChanged: (v) =>
                  setState(() => _setBool(ctrls.isCurrentJobCtrl, v ?? false)),
              controlAffinity: ListTileControlAffinity.leading,
              title: const Text('This is my current job.'),
              contentPadding: EdgeInsets.zero,
            ),
            CheckboxListTile(
              value: _textBool(ctrls.isFamilyEmployedCtrl),
              onChanged: (v) => setState(
                () => _setBool(ctrls.isFamilyEmployedCtrl, v ?? false),
              ),
              controlAffinity: ListTileControlAffinity.leading,
              title: const Text(
                'I am employed by a family member, property seller, real estate agent, or other party to the transaction.',
              ),
              contentPadding: EdgeInsets.zero,
            ),
            CheckboxListTile(
              value: _textBool(ctrls.isSelfEmployedCtrl),
              onChanged: (v) => setState(
                () => _setBool(ctrls.isSelfEmployedCtrl, v ?? false),
              ),
              controlAffinity: ListTileControlAffinity.leading,
              title: const Text('Business Owner or Self‑Employed'),
              contentPadding: EdgeInsets.zero,
            ),

            const SizedBox(height: 12),

            // Belongs to (store chosen name in ownerCtrl.text)
            DropDownField<String>(
              label: 'Belongs To',
              value: (ctrls.ownerCtrl.text.isEmpty
                  ? 'John Doe'
                  : ctrls.ownerCtrl.text),
              items: const [
                DropdownMenuItem(value: 'John Doe', child: Text('John Doe')),
                DropdownMenuItem(value: 'Jane Doe', child: Text('Jane Doe')),
              ],
              onChanged: (v) => ctrls.ownerCtrl.text = v ?? 'John Doe',
              validator: (v) =>
                  (v == null || v.isEmpty) ? 'Select a borrower' : null,
            ),

            const SizedBox(height: 16),
            FormTextField(
              label: 'Employer Name',
              controller: ctrls.employerNameCtrl,
              validator: (v) => (v ?? '').trim().isEmpty ? 'Required' : null,
            ),
            const SizedBox(height: 16),
            FormTextField(
              label: 'Business Phone',
              controller: ctrls.businessPhoneCtrl,
              keyboardType: TextInputType.phone,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              validator: (v) => (v ?? '').trim().isEmpty ? 'Required' : null,
            ),
            const SizedBox(height: 16),
            FormTextField(
              label: 'Position',
              controller: ctrls.positionCtrl,
              validator: (v) => (v ?? '').trim().isEmpty ? 'Required' : null,
            ),

            const SizedBox(height: 16),

            // Dates: use controllers so picked date shows up
            Row(
              children: [
                Expanded(
                  child: FormTextField(
                    label: 'Start Date',
                    controller: ctrls.startDateCtrl,
                    readOnly: true,
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.calendar_today),
                      onPressed: () => _pickDate(start: true),
                    ),
                    validator: (_) =>
                        _startDate == null ? 'Select start date' : null,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: FormTextField(
                    label: 'End Date',
                    controller: ctrls.endDateCtrl,
                    readOnly: true,
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.calendar_today),
                      onPressed: () => _pickDate(start: false),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),
            FormTextField(
              label: 'Length of Employment',
              controller: ctrls.employmentLengthCtrl,
              readOnly: true,
              initialValue: ctrls.employmentLengthCtrl.text.isEmpty
                  ? 'Value'
                  : null,
            ),

            const SizedBox(height: 16),
            FormTextField(
              label: 'What is your gross monthly income?',
              controller: ctrls.grossMonthlyIncome,
              keyboardType: TextInputType.number,
              validator: (v) => (v ?? '').trim().isEmpty ? 'Required' : null,
            ),

            const SizedBox(height: 16),
            const SectionHeader(label: 'Address Line 1'),
            const SizedBox(height: 8),
            FormTextField(
              label: 'Address Line 1',
              controller: ctrls.addressLine1Ctrl,
            ),

            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: FormTextField(
                    label: 'Apt/Unit/Suite',
                    controller: ctrls.unitNoCtrl,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: FormTextField(
                    label: 'City',
                    controller: ctrls.cityCtrl,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: DropDownField<String>(
                    label: 'State',
                    value: ctrls.stateCtrl.text.isEmpty
                        ? null
                        : ctrls.stateCtrl.text,
                    items: const [
                      DropdownMenuItem(
                        value: 'California',
                        child: Text('California'),
                      ),
                      DropdownMenuItem(value: 'Texas', child: Text('Texas')),
                      DropdownMenuItem(
                        value: 'Florida',
                        child: Text('Florida'),
                      ),
                    ],
                    onChanged: (nv) => ctrls.stateCtrl.text = nv ?? '',
                    validator: (nv) =>
                        (nv == null || nv.isEmpty) ? 'Select state' : null,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: FormTextField(
                    label: 'Zip Code',
                    controller: ctrls.zipCodeCtrl,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    validator: (v) =>
                        (v ?? '').trim().length < 5 ? 'Enter ZIP' : null,
                  ),
                ),
              ],
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
                  backgroundColor: theme.colorScheme.primary,
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
