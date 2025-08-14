import 'package:flutter/material.dart';
import 'package:loan/domain/entities/financial_assets/asset_entity.dart';

// Controllers for ONE asset row.
class AssetRowControllers {
  final GlobalKey<FormState> formKey;
  final TextEditingController ownerCtrl;
  final TextEditingController financialInstitutionNameCtrl;
  final TextEditingController assetTypeCtrl;
  final TextEditingController accountNumberCtrl;
  final TextEditingController cashMarketValueCtrl;

  AssetRowControllers({
    required this.formKey,
    required this.ownerCtrl,
    required this.financialInstitutionNameCtrl,
    required this.assetTypeCtrl,
    required this.accountNumberCtrl,
    required this.cashMarketValueCtrl,
  });

  factory AssetRowControllers.empty() => AssetRowControllers(
        formKey: GlobalKey<FormState>(),
        ownerCtrl: TextEditingController(text: ''),
        financialInstitutionNameCtrl: TextEditingController(text: ''),
        assetTypeCtrl: TextEditingController(text: ''),
        accountNumberCtrl: TextEditingController(text: ''),
        cashMarketValueCtrl: TextEditingController(text: ''),
      );

  void dispose() {
    ownerCtrl.dispose();
    financialInstitutionNameCtrl.dispose();
    assetTypeCtrl.dispose();
    accountNumberCtrl.dispose();
    cashMarketValueCtrl.dispose();
  }
  bool validate() => formKey.currentState?.validate() ?? true;
}

class AssetFormControllers {
  final GlobalKey<FormState> sectionFormKey;

  final List<AssetRowControllers> rows;

  AssetFormControllers._({
    required this.sectionFormKey,
    required this.rows,
  });

  factory AssetFormControllers.single() => AssetFormControllers._(
        sectionFormKey: GlobalKey<FormState>(),
        rows: [AssetRowControllers.empty()],
      );

  factory AssetFormControllers.multiple({int initial = 1}) {
    final count = initial.clamp(1, 999);
    return AssetFormControllers._(
      sectionFormKey: GlobalKey<FormState>(),
      rows: List.generate(count, (_) => AssetRowControllers.empty()),
    );
  }

  bool get isSingle => rows.length == 1;
  void addRow() => rows.add(AssetRowControllers.empty());

  void removeRow(int index) {
    if (index < 0 || index >= rows.length) return;
    rows[index].dispose();
    rows.removeAt(index);
  }

  //form validation
  bool validateAll() {
    final sectionOk = sectionFormKey.currentState?.validate() ?? true;
    final rowsOk = rows.every((r) => r.validate());
    return sectionOk && rowsOk;
  }

  /// Dispose all rows and the manager.
  void dispose() {
    for (final r in rows) {
      r.dispose();
    }
  }
  // -----------------------------
  TextEditingController get ownerCrtl => rows.first.ownerCtrl;
  TextEditingController get financialInstitutionNameCrtl =>
      rows.first.financialInstitutionNameCtrl;
  TextEditingController get assetTypeCrtl => rows.first.assetTypeCtrl;
  TextEditingController get accountNumberCrtl => rows.first.accountNumberCtrl;
  TextEditingController get cashMarketValueCrtl =>
      rows.first.cashMarketValueCtrl;

  GlobalKey<FormState> get assetFormKey => rows.first.formKey;
  
  List<AssetEntity> toAssetEntities() {
    return rows.map((c) {
      return AssetEntity(
        assetType: c.assetTypeCtrl.text.trim(),
        institutionName: c.financialInstitutionNameCtrl.text.trim(),
        accountIdentifier: c.accountNumberCtrl.text.trim(),
        assetValue: double.tryParse(c.cashMarketValueCtrl.text.trim()) ?? 0,
        userType: 'Borrower',
        action: 'Add',
      );
    }).toList();
  }
}
