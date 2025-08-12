import 'package:flutter/material.dart';

class EmploymentFormControllers {
  final GlobalKey<FormState> employmentInfoKey;
  final TextEditingController isCurrentJobCtrl;
  final TextEditingController isFamilyEmployedCtrl;
  final TextEditingController isSelfEmployedCtrl;
  final TextEditingController ownerCtrl;
  final TextEditingController employerNameCtrl;
  final TextEditingController businessPhoneCtrl;
  final TextEditingController positionCtrl;
  final TextEditingController startDateCtrl;
  final TextEditingController endDateCtrl;
  final TextEditingController employmentLengthCtrl;
  final TextEditingController grossMonthlyIncome;
  final TextEditingController addressLine1Ctrl;
  final TextEditingController unitNoCtrl;
  final TextEditingController cityCtrl;
  final TextEditingController stateCtrl;
  final TextEditingController zipCodeCtrl;

  EmploymentFormControllers({
    required this.employmentInfoKey,
    required this.isCurrentJobCtrl,
    required this.isFamilyEmployedCtrl,
    required this.isSelfEmployedCtrl,
    required this.ownerCtrl,
    required this.employerNameCtrl,
    required this.businessPhoneCtrl,
    required this.positionCtrl,
    required this.startDateCtrl,
    required this.endDateCtrl,
    required this.employmentLengthCtrl,
    required this.grossMonthlyIncome,
    required this.addressLine1Ctrl,
    required this.unitNoCtrl,
    required this.cityCtrl,
    required this.stateCtrl,
    required this.zipCodeCtrl,
    
  });

  static EmploymentFormControllers init() {
    return EmploymentFormControllers(
      employmentInfoKey: GlobalKey<FormState>(),
      isCurrentJobCtrl: TextEditingController(
        text: '',
      ),
      isFamilyEmployedCtrl: TextEditingController(
        text: '',
      ),
      isSelfEmployedCtrl: TextEditingController(
        text: '',
      ),
      ownerCtrl: TextEditingController(
        text: '',
      ),
      employerNameCtrl: TextEditingController(
        text: '',
      ),
      businessPhoneCtrl: TextEditingController(
        text: '',
      ),
      positionCtrl: TextEditingController(
        text: '',
      ),
      startDateCtrl: TextEditingController(
        text: '',
      ),
      endDateCtrl: TextEditingController(
        text: '',
      ),
      employmentLengthCtrl: TextEditingController(
        text: '',
      ),
      grossMonthlyIncome: TextEditingController(
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
    );
  }

  void dispose() {
    isCurrentJobCtrl.dispose();
    isFamilyEmployedCtrl.dispose();
    isSelfEmployedCtrl.dispose();
    ownerCtrl.dispose();
    employerNameCtrl.dispose();
    businessPhoneCtrl.dispose();
    positionCtrl.dispose();
    startDateCtrl.dispose();
    endDateCtrl.dispose();
    employmentLengthCtrl.dispose();
    grossMonthlyIncome.dispose();
    addressLine1Ctrl.dispose();
    unitNoCtrl.dispose();
    cityCtrl.dispose();
    stateCtrl.dispose();
    zipCodeCtrl.dispose();
    
  }
}
