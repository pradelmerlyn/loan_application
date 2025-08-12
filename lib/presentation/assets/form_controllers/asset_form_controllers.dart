import 'package:flutter/material.dart';

class AssetFormControllers {
  final GlobalKey<FormState> assetFormKey;
  final TextEditingController ownerCrtl;
  final TextEditingController financialInstitutionNameCrtl;
  final TextEditingController assetTypeCrtl;
  final TextEditingController accountNumberCrtl;
  final TextEditingController cashMarketValueCrtl;



  AssetFormControllers({
    required this.assetFormKey,
    required this.ownerCrtl,
    required this.financialInstitutionNameCrtl,
    required this.assetTypeCrtl,
    required this.accountNumberCrtl,
    required this.cashMarketValueCrtl,
    
  });

  static AssetFormControllers init() {
    return AssetFormControllers(
      assetFormKey: GlobalKey<FormState>(),
      ownerCrtl: TextEditingController(
        text: '',
      ),
      financialInstitutionNameCrtl: TextEditingController(
        text: '',
      ),
      assetTypeCrtl: TextEditingController(
        text: '',
      ),
      accountNumberCrtl: TextEditingController(
        text: '',
      ),
      cashMarketValueCrtl: TextEditingController(
        text: '',
      ),
      
    );
  }

  void dispose() {
    ownerCrtl.dispose();
    financialInstitutionNameCrtl.dispose();
    assetTypeCrtl.dispose();
    accountNumberCrtl.dispose();
    cashMarketValueCrtl.dispose();
    
  }
}
