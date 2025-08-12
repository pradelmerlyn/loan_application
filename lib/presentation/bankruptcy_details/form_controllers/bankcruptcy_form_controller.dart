import 'package:flutter/material.dart';

class BankcruptcyFormController {
  final GlobalKey<FormState> bankcruptcyKey;
  final TextEditingController caseNumber;
  final TextEditingController bankcruptcyChapter;
  final TextEditingController status;
  final TextEditingController caseCloseDate;

  BankcruptcyFormController({
    required this.bankcruptcyKey,
    required this.caseNumber,
    required this.bankcruptcyChapter,
    required this.status,
    required this.caseCloseDate,
  });

  static BankcruptcyFormController init() {
    return BankcruptcyFormController(
      bankcruptcyKey: GlobalKey<FormState>(),
      caseNumber: TextEditingController(
        text: '',
      ),
      bankcruptcyChapter: TextEditingController(
        text: '',
      ),
      status: TextEditingController(
        text: '',
      ),
      caseCloseDate: TextEditingController(
        text: '',
      ),
    );
  }

  void dispose() {
    caseNumber.dispose();
    bankcruptcyChapter.dispose();
    status.dispose();
    caseCloseDate.dispose();
  }
}
