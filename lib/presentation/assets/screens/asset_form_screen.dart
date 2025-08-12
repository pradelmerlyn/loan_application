import 'package:flutter/material.dart';
import 'package:loan/domain/entities/assets/asset_item_entity.dart'; // AssetItem
import 'package:loan/presentation/assets/form_controllers/asset_form_controllers.dart';
import 'package:loan/presentation/widgets/form_fields/form_textfield.dart';

class AssetFormScreen extends StatefulWidget {
  const AssetFormScreen({super.key});

  @override
  State<AssetFormScreen> createState() => _AssetFormScreenState();
}

class _AssetFormScreenState extends State<AssetFormScreen> {
  late final AssetFormControllers _assetCtrls;

  @override
  void initState() {
    super.initState();
    _assetCtrls = AssetFormControllers.init();
  }

  @override
  void dispose() {
    _assetCtrls.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    if (!(_assetCtrls.assetFormKey.currentState?.validate() ?? false)) return;

    final item = AssetItem(
      owner: _assetCtrls.ownerCrtl.text.trim(),
      bank: _assetCtrls.financialInstitutionNameCrtl.text.trim(),
      type: _assetCtrls.assetTypeCrtl.text.trim(),
      accountNumber: _assetCtrls.accountNumberCrtl.text.trim(),
      value: _assetCtrls.cashMarketValueCrtl.text.trim(),
    );

    await showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (dCtx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
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
              'Asset item has been saved successfully.',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.of(dCtx).pop();
                Navigator.of(context).pop(item);
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
    return Scaffold(
      appBar: AppBar(title: const Text('Add Asset')),
      body: Form(
        key: _assetCtrls.assetFormKey,
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            FormTextField(
              label: 'Owner',
              controller: _assetCtrls.ownerCrtl,
              validator: (v) => (v ?? '').trim().isEmpty ? 'Required' : null,
            ),
            const SizedBox(height: 16),
            FormTextField(
              label: 'Financial Institution',
              controller: _assetCtrls.financialInstitutionNameCrtl,
              validator: (v) => (v ?? '').trim().isEmpty ? 'Required' : null,
            ),
            const SizedBox(height: 16),
            FormTextField(
              label: 'Asset Type',
              controller: _assetCtrls.assetTypeCrtl,
              validator: (v) => (v ?? '').trim().isEmpty ? 'Required' : null,
            ),
            const SizedBox(height: 16),
            FormTextField(
              label: 'Account Number',
              controller: _assetCtrls.accountNumberCrtl,
              validator: (v) => (v ?? '').trim().isEmpty ? 'Required' : null,
            ),
            const SizedBox(height: 16),
            FormTextField(
              label: 'Cash / Market Value',
              controller: _assetCtrls.cashMarketValueCrtl,
              validator: (v) => (v ?? '').trim().isEmpty ? 'Required' : null,
            ),
            const SizedBox(height: 30),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Back'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: _save,
                    child: const Text('Save'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
