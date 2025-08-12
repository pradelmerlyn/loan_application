import 'package:flutter/material.dart';

class DemographicsFormControllers {
  final GlobalKey<FormState> demographicsKey;

  // Ethnicity
  final TextEditingController hispanicCtrl;
  final TextEditingController mexicanCtrl;
  final TextEditingController puertoRicanCtrl;
  final TextEditingController cubanCtrl;
  final TextEditingController otherHispanicCtrl;
  final TextEditingController otherHispanicTextCtrl;
  final TextEditingController notHispanicCtrl;
  final TextEditingController preferNoEthnicityCtrl;

  // Race - American Indian
  final TextEditingController americanIndianCtrl;
  final TextEditingController americanIndianTribeCtrl;

  // Race - Asian
  final TextEditingController asianCtrl;
  final TextEditingController asianIndianCtrl;
  final TextEditingController chineseCtrl;
  final TextEditingController filipinoCtrl;
  final TextEditingController koreanCtrl;
  final TextEditingController vietnameseCtrl;
  final TextEditingController otherAsianCtrl;
  final TextEditingController otherAsianTextCtrl;

  // Race - Black / Pacific Islander
  final TextEditingController blackCtrl;
  final TextEditingController pacificIslanderCtrl;
  final TextEditingController nativeHawaiianCtrl;
  final TextEditingController guamanianCtrl;
  final TextEditingController samoanCtrl;
  final TextEditingController otherPacificCtrl;
  final TextEditingController otherPacificTextCtrl;

  // Race - White & Prefer Not
  final TextEditingController whiteCtrl;
  final TextEditingController preferNoRaceCtrl;

  // Sex
  final TextEditingController sexCtrl;

  DemographicsFormControllers({
    required this.demographicsKey,
    required this.hispanicCtrl,
    required this.mexicanCtrl,
    required this.puertoRicanCtrl,
    required this.cubanCtrl,
    required this.otherHispanicCtrl,
    required this.otherHispanicTextCtrl,
    required this.notHispanicCtrl,
    required this.preferNoEthnicityCtrl,
    required this.americanIndianCtrl,
    required this.americanIndianTribeCtrl,
    required this.asianCtrl,
    required this.asianIndianCtrl,
    required this.chineseCtrl,
    required this.filipinoCtrl,
    required this.koreanCtrl,
    required this.vietnameseCtrl,
    required this.otherAsianCtrl,
    required this.otherAsianTextCtrl,
    required this.blackCtrl,
    required this.pacificIslanderCtrl,
    required this.nativeHawaiianCtrl,
    required this.guamanianCtrl,
    required this.samoanCtrl,
    required this.otherPacificCtrl,
    required this.otherPacificTextCtrl,
    required this.whiteCtrl,
    required this.preferNoRaceCtrl,
    required this.sexCtrl,
  });

  static DemographicsFormControllers init() {
    return DemographicsFormControllers(
      demographicsKey: GlobalKey<FormState>(),

      // Ethnicity
      hispanicCtrl: TextEditingController(text: ''),
      mexicanCtrl: TextEditingController(text: ''),
      puertoRicanCtrl: TextEditingController(text: ''),
      cubanCtrl: TextEditingController(text: ''),
      otherHispanicCtrl: TextEditingController(text: ''),
      otherHispanicTextCtrl: TextEditingController(text: ''),
      notHispanicCtrl: TextEditingController(text: ''),
      preferNoEthnicityCtrl: TextEditingController(text: ''),

      // Race - American Indian
      americanIndianCtrl: TextEditingController(text: ''),
      americanIndianTribeCtrl: TextEditingController(text: ''),

      // Race - Asian
      asianCtrl: TextEditingController(text: ''),
      asianIndianCtrl: TextEditingController(text: ''),
      chineseCtrl: TextEditingController(text: ''),
      filipinoCtrl: TextEditingController(text: ''),
      koreanCtrl: TextEditingController(text: ''),
      vietnameseCtrl: TextEditingController(text: ''),
      otherAsianCtrl: TextEditingController(text: ''),
      otherAsianTextCtrl: TextEditingController(text: ''),

      // Race - Black / Pacific Islander
      blackCtrl: TextEditingController(text: ''),
      pacificIslanderCtrl: TextEditingController(text: ''),
      nativeHawaiianCtrl: TextEditingController(text: ''),
      guamanianCtrl: TextEditingController(text: ''),
      samoanCtrl: TextEditingController(text: ''),
      otherPacificCtrl: TextEditingController(text: ''),
      otherPacificTextCtrl: TextEditingController(text: ''),

      // Race - White & Prefer Not
      whiteCtrl: TextEditingController(text: ''),
      preferNoRaceCtrl: TextEditingController(text: ''),

      // Sex
      sexCtrl: TextEditingController(text: ''),
    );
  }

  void dispose() {
    hispanicCtrl.dispose();
    mexicanCtrl.dispose();
    puertoRicanCtrl.dispose();
    cubanCtrl.dispose();
    otherHispanicCtrl.dispose();
    otherHispanicTextCtrl.dispose();
    notHispanicCtrl.dispose();
    preferNoEthnicityCtrl.dispose();

    americanIndianCtrl.dispose();
    americanIndianTribeCtrl.dispose();

    asianCtrl.dispose();
    asianIndianCtrl.dispose();
    chineseCtrl.dispose();
    filipinoCtrl.dispose();
    koreanCtrl.dispose();
    vietnameseCtrl.dispose();
    otherAsianCtrl.dispose();
    otherAsianTextCtrl.dispose();

    blackCtrl.dispose();
    pacificIslanderCtrl.dispose();
    nativeHawaiianCtrl.dispose();
    guamanianCtrl.dispose();
    samoanCtrl.dispose();
    otherPacificCtrl.dispose();
    otherPacificTextCtrl.dispose();

    whiteCtrl.dispose();
    preferNoRaceCtrl.dispose();

    sexCtrl.dispose();
  }
}
