import 'package:flutter/material.dart';

class AdditionalIncomeFormController {
  final GlobalKey<FormState> grossMonthlyIncomeKey;
  final TextEditingController ownerCrtl;
  final TextEditingController incomeSource;
  final TextEditingController amount;

  AdditionalIncomeFormController({
    required this.grossMonthlyIncomeKey,
    required this.ownerCrtl,
    required this.incomeSource,
    required this.amount,
  });

  static AdditionalIncomeFormController init() {
    return AdditionalIncomeFormController(
      grossMonthlyIncomeKey: GlobalKey<FormState>(),
      ownerCrtl: TextEditingController(
        text: '',
      ),
      incomeSource: TextEditingController(
        text: '',
      ),
      amount: TextEditingController(
        text: '',
      ),
    );
  }

  void dispose() {
    ownerCrtl.dispose();
    incomeSource.dispose();
    amount.dispose();
  }
}
