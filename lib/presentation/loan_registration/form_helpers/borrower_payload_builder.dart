import 'package:loan/domain/entities/borrower/borrower_info/borrower_entity.dart';
import 'package:loan/domain/entities/borrower/borrower_info/borrower_current_address_entity.dart';
import 'package:loan/domain/entities/borrower/borrower_info/borrower_phone_number_entity.dart';
import 'package:loan/domain/entities/property/property_entity.dart';
import 'package:loan/domain/entities/property/property_address_entity.dart';
import 'package:loan/domain/entities/financial_assets/asset_entity.dart';
import 'package:loan/domain/entities/loan_registration/loan_registration_entity.dart';

// controllers
import 'package:loan/presentation/loan_registration/form_controllers/borrower_info_form_controllers.dart';
import 'package:loan/presentation/loan_registration/form_controllers/property_info_form_controllers.dart';
import 'package:loan/presentation/assets/form_controllers/asset_form_controllers.dart';

/// Build just the borrower (for Step 1 API call)
BorrowerEntity buildBorrowerFromForm(BorrowerInfoFormControllers ctrls) {
  DateTime? dob;
  DateTime? expirationTerm;

  final rawDob = ctrls.bdayCtrl.text.trim();
  if (rawDob.isNotEmpty) {
    dob = DateTime.tryParse(rawDob);
  }

  final rawExpTerm = ctrls.expirationTermCtrl.text.trim();
  if (rawExpTerm.isNotEmpty) {
    expirationTerm = DateTime.tryParse(rawExpTerm);
  }

  return BorrowerEntity(
    firstName: ctrls.firstNameCtrl.text.trim(),
    middleName: ctrls.middleNameCtrl.text.trim(),
    lastName: ctrls.lastNameCtrl.text.trim(),
    suffixName: ctrls.suffixCtrl.text.trim(),
    dateOfBirth: dob,
    emailAddress: ctrls.emailCtrl.text.trim(),

    // ✅ must be a LIST
    phoneNumbers: const [
      BorrowerPhoneNumberEntity(
        number: '(222) 222-2222',
        type: 'Home',
      ),
    ],

    maritalStatus: ctrls.maritalStatusCtrl.text.trim(),
    dependentAges: const [],

    spouseIsCoBorrowerIndicator: false,
    spouseEligibleForVABenefits: false,

    militaryServiceType: ctrls.militaryServiceTypeCtrl.text.trim(),
    militaryServiceExpectedCompletionDate: expirationTerm,

    currentAddress: const BorrowerCurrentAddressEntity(
      line: "",
     // line2: "",
      city: "",
      state: "",
      zipCode: "",
     // action: 'Add',
      // line: ctrls.addressLine1Ctrl.text.trim(),
      // line2: ctrls.unitNoCtrl.text.trim(),
      // city: ctrls.cityCtrl.text.trim(),
      // state: ctrls.stateCtrl.text.trim(),
      // zipCode: ctrls.zipCodeCtrl.text.trim(),
      // action: 'Add',
    ),
    //action: 'Add',
  );
}

/// Build the full payload (for final SUBMIT)
LoanRegistrationEntity buildFullPayload({
  required BorrowerInfoFormControllers borrowerCtrls,
  required PropertyInfoFormControllers propertyCtrls,
  required AssetFormControllers financialCtrl,
}) {
  final borrower = buildBorrowerFromForm(borrowerCtrls);

  final subjectProperty = PropertyEntity(
    intendedUsageType: propertyCtrls.intendedUsageType.text.trim(),
    propertyType: propertyCtrls.propertyType.text.trim(),
    address: PropertyAddressEntity(
      line: propertyCtrls.propAddressLine1Ctrl.text.trim(),
      line2: propertyCtrls.propUnitNoCtrl.text.trim(),
      city: propertyCtrls.propCityCtrl.text.trim(),
      state: propertyCtrls.propStateCtrl.text.trim(),
      zipCode: propertyCtrls.propZipCodeCtrl.text.trim(),
      action: 'Add',
    ),
  );

  final assets = financialCtrl.rows
      .map(
        (row) => AssetEntity(
          assetType: row.assetTypeCtrl.text.trim(),
          institutionName: row.financialInstitutionNameCtrl.text.trim(),
          accountIdentifier: row.accountNumberCtrl.text.trim(),
          assetValue: double.tryParse(row.cashMarketValueCtrl.text.trim()) ?? 0,
          userType: 'Borrower',
          action: 'Add',
        ),
      )
      .toList();

  return LoanRegistrationEntity(
    loanOfficerId: 'mmaine', // if you want to send it now
    loanPurpose: 'Purchase', // static as requested
    borrower: borrower,
    subjectPropertyFoundIndicator: true,
    subjectProperty: subjectProperty,
    // assets: assets,                 // include when ready
    // loanAmount: double.tryParse(propertyCtrls.estimatedDownPayment.text.trim()) ?? 0,
  );
}
