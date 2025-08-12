import 'package:flutter/material.dart';

class DeclarationInfoFormControllers {
  final GlobalKey<FormState> declarationKey;
  final TextEditingController occupying;
  final TextEditingController familyRelationship;
  final TextEditingController applyOtherMortgage;
  final TextEditingController subjectToLien;
  final TextEditingController outstandingJudgments;
  final TextEditingController partyToLawsuit;
  final TextEditingController shortSale;
  final TextEditingController declaredBankruptcy;
  final TextEditingController ownedHome3yrs;
  final TextEditingController usingUndisclosedFunds;
  final TextEditingController cosignerOnUndisclosedDebt;
  final TextEditingController delinquentFederalDebt;
  final TextEditingController deedInLieu;
  final TextEditingController applyingOtherCredit;

  final TextEditingController shortSaleDateCtrl;
  final TextEditingController deedLieuDateCtrl;
  final TextEditingController priorUsageCtrl;
  final TextEditingController priorTitleCtrl;
  final TextEditingController undisclosedAmountCtrl;

  DeclarationInfoFormControllers({
    required this.declarationKey,
    required this.occupying,
    required this.familyRelationship,
    required this.applyOtherMortgage,
    required this.subjectToLien,
    required this.outstandingJudgments,
    required this.partyToLawsuit,
    required this.shortSale,
    required this.declaredBankruptcy,
    required this.ownedHome3yrs,
    required this.usingUndisclosedFunds,
    required this.cosignerOnUndisclosedDebt,
    required this.delinquentFederalDebt,
    required this.deedInLieu,
    required this.applyingOtherCredit,
    required this.shortSaleDateCtrl,
    required this.deedLieuDateCtrl,
    required this.priorUsageCtrl,
    required this.priorTitleCtrl,
    required this.undisclosedAmountCtrl,
  });

  static DeclarationInfoFormControllers init() {
    return DeclarationInfoFormControllers(
      declarationKey: GlobalKey<FormState>(),
      occupying: TextEditingController(
        text: '',
      ),
      familyRelationship: TextEditingController(
        text: '',
      ),
      applyOtherMortgage: TextEditingController(
        text: '',
      ),
      subjectToLien: TextEditingController(
        text: '',
      ),
      outstandingJudgments: TextEditingController(
        text: '',
      ),
      partyToLawsuit: TextEditingController(
        text: '',
      ),
      shortSale: TextEditingController(
        text: '',
      ),
      declaredBankruptcy: TextEditingController(
        text: '',
      ),
      ownedHome3yrs: TextEditingController(
        text: '',
      ),
      usingUndisclosedFunds: TextEditingController(
        text: '',
      ),
      cosignerOnUndisclosedDebt: TextEditingController(
        text: '',
      ),
      delinquentFederalDebt: TextEditingController(
        text: '',
      ),
      deedInLieu: TextEditingController(
        text: '',
      ),
      applyingOtherCredit: TextEditingController(
        text: '',
      ),
      shortSaleDateCtrl: TextEditingController(
        text: '',
      ),
      deedLieuDateCtrl: TextEditingController(
        text: '',
      ),
      priorUsageCtrl: TextEditingController(
        text: '',
      ),
      priorTitleCtrl: TextEditingController(
        text: '',
      ),
      undisclosedAmountCtrl: TextEditingController(
        text: '',
      ),
    );
  }

  void dispose() {
    occupying.dispose();
    familyRelationship.dispose();
    applyOtherMortgage.dispose();
    subjectToLien.dispose();
    outstandingJudgments.dispose();
    partyToLawsuit.dispose();
    shortSale.dispose();
    declaredBankruptcy.dispose();
    ownedHome3yrs.dispose();
    usingUndisclosedFunds.dispose();
    cosignerOnUndisclosedDebt.dispose();
    delinquentFederalDebt.dispose();
    deedInLieu.dispose();
    applyingOtherCredit.dispose();
    shortSaleDateCtrl.dispose();
    deedLieuDateCtrl.dispose();
    priorUsageCtrl.dispose();
    priorTitleCtrl.dispose();
    undisclosedAmountCtrl.dispose();
  }
}
