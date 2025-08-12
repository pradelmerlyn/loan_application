import 'package:flutter/material.dart';

class BorrowerInfoFormControllers {
  final GlobalKey<FormState> borrowerInfoKey;
  //Borrower - Personal Info
  final TextEditingController ssnCtrl;
  final TextEditingController firstNameCtrl;
  final TextEditingController middleNameCtrl;
  final TextEditingController lastNameCtrl;
  final TextEditingController suffixCtrl;
  final TextEditingController bdayCtrl;
  final TextEditingController citizenshipCtrl;
  final TextEditingController maritalStatusCtrl;
  final TextEditingController dependentAgeCtrl;

  // Borrower - Military Service Info
  final TextEditingController militaryServiceTypeCtrl;
  final TextEditingController expirationTermCtrl;
  final TextEditingController isVABorrowingCtrl;

  //Borrower - Contact Info
  final TextEditingController phoneCtrl;
  final TextEditingController emailCtrl;

  //Borrower - Current Address
  final TextEditingController homeStatusCrtl;
  final TextEditingController monthlyRentCtrl;
  final TextEditingController startDateCtrl;
  final TextEditingController occupancyTypeCtrl;
  final TextEditingController addressLine1Ctrl;
  final TextEditingController unitNoCtrl;
  final TextEditingController cityCtrl;
  final TextEditingController stateCtrl;
  final TextEditingController zipCodeCtrl;

  //Borrower - Previous Address
  final TextEditingController prevAddressLine1Ctrl;
  final TextEditingController prevUnitNoCtrl;
  final TextEditingController prevCityCtrl;
  final TextEditingController prevStateCtrl;
  final TextEditingController prevZipCodeCtrl;
  final TextEditingController prevStartDateCtrl;
  final TextEditingController prevEndDateCtrl;

  //Borrower - Mailing Address
  final TextEditingController isSameAsCurrentCtrl;
  final TextEditingController mailAddressLine1Ctrl;
  final TextEditingController mailUnitNoCtrl;
  final TextEditingController mailCityCtrl;
  final TextEditingController mailStateCtrl;
  final TextEditingController mailZipCodeCtrl;

  //Borrower - Monthy Housing Expense
  final TextEditingController mortgageCtrl;
  final TextEditingController subordinateCtrl;
  final TextEditingController propertyTaxCtrl;
  final TextEditingController hoaDuesCtrl;
  final TextEditingController homeInsuranceCtrl;
  final TextEditingController mortgageInsuranceCtrl;
  final TextEditingController otherHousingCtrl;
  final TextEditingController totalHousingExpenseCtrl;

  BorrowerInfoFormControllers({
    required this.borrowerInfoKey,
    required this.ssnCtrl,
    required this.firstNameCtrl,
    required this.middleNameCtrl,
    required this.lastNameCtrl,
    required this.suffixCtrl,
    required this.bdayCtrl,
    required this.citizenshipCtrl,
    required this.maritalStatusCtrl,
    required this.dependentAgeCtrl,
    required this.militaryServiceTypeCtrl,
    required this.expirationTermCtrl,
    required this.isVABorrowingCtrl,
    required this.phoneCtrl,
    required this.emailCtrl,
    required this.homeStatusCrtl,
    required this.monthlyRentCtrl,
    required this.startDateCtrl,
    required this.occupancyTypeCtrl,
    required this.addressLine1Ctrl,
    required this.unitNoCtrl,
    required this.cityCtrl,
    required this.stateCtrl,
    required this.zipCodeCtrl,
    required this.prevAddressLine1Ctrl,
    required this.prevUnitNoCtrl,
    required this.prevCityCtrl,
    required this.prevStateCtrl,
    required this.prevZipCodeCtrl,
    required this.prevStartDateCtrl,
    required this.prevEndDateCtrl,
    required this.isSameAsCurrentCtrl,
    required this.mailAddressLine1Ctrl,
    required this.mailUnitNoCtrl,
    required this.mailCityCtrl,
    required this.mailStateCtrl,
    required this.mailZipCodeCtrl,
    required this.mortgageCtrl,
    required this.subordinateCtrl,
    required this.propertyTaxCtrl,
    required this.hoaDuesCtrl,
    required this.homeInsuranceCtrl,
    required this.mortgageInsuranceCtrl,
    required this.otherHousingCtrl,
    required this.totalHousingExpenseCtrl,
  });

  static BorrowerInfoFormControllers init() {
    return BorrowerInfoFormControllers(
      borrowerInfoKey: GlobalKey<FormState>(),
      ssnCtrl: TextEditingController(
        text: '',
      ),
      firstNameCtrl: TextEditingController(
        text: '',
      ),
      middleNameCtrl: TextEditingController(
        text: '',
      ),
      lastNameCtrl: TextEditingController(
        text: '',
      ),
      suffixCtrl: TextEditingController(
        text: '',
      ),
      bdayCtrl: TextEditingController(
        text: '',
      ),
      citizenshipCtrl: TextEditingController(
        text: '',
      ),
      maritalStatusCtrl: TextEditingController(
        text: '',
      ),
      dependentAgeCtrl: TextEditingController(
        text: '',
      ),
      militaryServiceTypeCtrl: TextEditingController(
        text: '',
      ),
      expirationTermCtrl: TextEditingController(
        text: '',
      ),
      isVABorrowingCtrl: TextEditingController(
        text: '',
      ),
      phoneCtrl: TextEditingController(
        text: '',
      ),
      emailCtrl: TextEditingController(
        text: '',
      ),
      homeStatusCrtl: TextEditingController(
        text: '',
      ),
      monthlyRentCtrl: TextEditingController(
        text: '',
      ),
      startDateCtrl: TextEditingController(
        text: '',
      ),
      occupancyTypeCtrl: TextEditingController(
        text: '',
      ),
      addressLine1Ctrl: TextEditingController(
        text: '',
      ),
      unitNoCtrl: TextEditingController(
        text: '',
      ),
      cityCtrl: TextEditingController(
        text: '',
      ),
      stateCtrl: TextEditingController(
        text: '',
      ),
      zipCodeCtrl: TextEditingController(
        text: '',
      ),
      prevAddressLine1Ctrl: TextEditingController(
        text: '',
      ),
      prevUnitNoCtrl: TextEditingController(
        text: '',
      ),
      prevCityCtrl: TextEditingController(
        text: '',
      ),
      prevStateCtrl: TextEditingController(
        text: '',
      ),
      prevZipCodeCtrl: TextEditingController(
        text: '',
      ),
      prevStartDateCtrl: TextEditingController(
        text: '',
      ),
      prevEndDateCtrl: TextEditingController(
        text: '',
      ),
      isSameAsCurrentCtrl: TextEditingController(
        text: '',
      ),
      mailAddressLine1Ctrl: TextEditingController(
        text: '',
      ),
      mailUnitNoCtrl: TextEditingController(
        text: '',
      ),
      mailCityCtrl: TextEditingController(
        text: '',
      ),
      mailStateCtrl: TextEditingController(
        text: '',
      ),
      mailZipCodeCtrl: TextEditingController(
        text: '',
      ),
      mortgageCtrl: TextEditingController(
        text: '',
      ),
      subordinateCtrl: TextEditingController(
        text: '',
      ),
      propertyTaxCtrl: TextEditingController(
        text: '',
      ),
      hoaDuesCtrl: TextEditingController(
        text: '',
      ),
      homeInsuranceCtrl: TextEditingController(
        text: '',
      ),
      mortgageInsuranceCtrl: TextEditingController(
        text: '',
      ),
      otherHousingCtrl: TextEditingController(
        text: '',
      ),
      totalHousingExpenseCtrl: TextEditingController(
        text: '',
      ),
    );
  }

  void dispose() {
    ssnCtrl.dispose();
    firstNameCtrl.dispose();
    middleNameCtrl.dispose();
    lastNameCtrl.dispose();
    suffixCtrl.dispose();
    bdayCtrl.dispose();
    citizenshipCtrl.dispose();
    maritalStatusCtrl.dispose();
    militaryServiceTypeCtrl.dispose();
    expirationTermCtrl.dispose();
    isVABorrowingCtrl.dispose();
    phoneCtrl.dispose();
    emailCtrl.dispose();
    homeStatusCrtl.dispose();
    monthlyRentCtrl.dispose();
    startDateCtrl.dispose();
    occupancyTypeCtrl.dispose();
    addressLine1Ctrl.dispose();
    unitNoCtrl.dispose();
    cityCtrl.dispose();
    stateCtrl.dispose();
    zipCodeCtrl.dispose();
    prevAddressLine1Ctrl.dispose();
    prevUnitNoCtrl.dispose();
    prevCityCtrl.dispose();
    prevStateCtrl.dispose();
    prevZipCodeCtrl.dispose();
    prevStartDateCtrl.dispose();
    prevEndDateCtrl.dispose();
    isSameAsCurrentCtrl.dispose();
    mailAddressLine1Ctrl.dispose();
    mailUnitNoCtrl.dispose();
    mailCityCtrl.dispose();
    mailStateCtrl.dispose();
    mailZipCodeCtrl.dispose();
    mortgageCtrl.dispose();
    subordinateCtrl.dispose();
    propertyTaxCtrl.dispose();
    hoaDuesCtrl.dispose();
    homeInsuranceCtrl.dispose();
    mortgageInsuranceCtrl.dispose();
    otherHousingCtrl.dispose();
    totalHousingExpenseCtrl.dispose();
  }
}
