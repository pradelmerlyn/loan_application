import 'package:flutter/material.dart';

class PropertyInfoFormControllers {
  final GlobalKey<FormState> propertyInfoKey;
  //Property Info
  final TextEditingController loanPurpose;
  final TextEditingController hasFoundHouse;
  final TextEditingController isPartOfHoa;
  final TextEditingController propertyType;
  final TextEditingController numberOfUnits;
  final TextEditingController intendedUsageType;
  final TextEditingController estimatedDownPayment;



  // Property Address
  final TextEditingController yearBuiltCtrl;
  final TextEditingController propAddressLine1Ctrl;
  final TextEditingController propUnitNoCtrl;
  final TextEditingController propCityCtrl;
  final TextEditingController propCountyCtrl;
  final TextEditingController propStateCtrl;
  final TextEditingController propZipCodeCtrl;

  PropertyInfoFormControllers({
    required this.propertyInfoKey,
    required this.loanPurpose,
    required this.hasFoundHouse,
    required this.isPartOfHoa,
    required this.propertyType,
    required this.numberOfUnits,
    required this.intendedUsageType,
    required this.estimatedDownPayment,
    required this.yearBuiltCtrl,
    required this.propAddressLine1Ctrl,
    required this.propUnitNoCtrl,
    required this.propCityCtrl,
    required this.propCountyCtrl,
    required this.propStateCtrl,
    required this.propZipCodeCtrl,
  });

  static PropertyInfoFormControllers init() {
    return PropertyInfoFormControllers(
      propertyInfoKey: GlobalKey<FormState>(),
      loanPurpose: TextEditingController(
        text: '',
      ),
      hasFoundHouse: TextEditingController(
        text: '',
      ),
      isPartOfHoa: TextEditingController(
        text: '',
      ),
      propertyType: TextEditingController(
        text: '',
      ),
      numberOfUnits: TextEditingController(
        text: '',
      ),
      intendedUsageType: TextEditingController(
        text: '',
      ),
      estimatedDownPayment: TextEditingController(
        text: '',
      ),
      propAddressLine1Ctrl: TextEditingController(
        text: '',
      ),
      yearBuiltCtrl: TextEditingController(
        text: '',
      ),
      propUnitNoCtrl: TextEditingController(
        text: '',
      ),
      propCityCtrl: TextEditingController(
        text: '',
      ),
      propCountyCtrl: TextEditingController(
        text: '',
      ),
      propStateCtrl: TextEditingController(
        text: '',
      ),
      propZipCodeCtrl: TextEditingController(
        text: '',
      ),
    );
  }

  void dispose() {
    loanPurpose.dispose();
    hasFoundHouse.dispose();
    isPartOfHoa.dispose();
    propertyType.dispose();
    numberOfUnits.dispose();
    intendedUsageType.dispose();
    estimatedDownPayment.dispose();
    yearBuiltCtrl.dispose();
    propAddressLine1Ctrl.dispose();
    propUnitNoCtrl.dispose();
    propCityCtrl.dispose();
    propCountyCtrl.dispose();
    propStateCtrl.dispose();
    propZipCodeCtrl.dispose();
  }
}
