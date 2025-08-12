import 'package:flutter/material.dart';
import 'package:loan/presentation/loan_registration/form_controllers/demographic_info_form_controller.dart';
import 'package:loan/presentation/widgets/form_fields/checkbox_field.dart';
import 'package:loan/presentation/widgets/form_fields/radio_button_field.dart';
import 'package:loan/presentation/widgets/ui/question_card.dart';
import 'package:loan/presentation/widgets/ui/inset_card.dart';
import 'package:loan/presentation/widgets/form_fields/form_textfield.dart';

class DemographicsSection extends StatelessWidget {
  final DemographicsFormControllers ctrls;
  const DemographicsSection({super.key, required this.ctrls});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 12),
          _EthnicityGroup(ctrls: ctrls),
          const SizedBox(height: 12),
          _RaceGroup(ctrls: ctrls),
          const SizedBox(height: 12),
          _SexField(ctrl: ctrls.sexCtrl),
        ],
      ),
    );
  }
}

/* ================= helpers ================= */

bool _asBool(TextEditingController c) {
  final t = c.text.trim().toLowerCase();
  return t == 'true' || t == 'yes' || t == '1';
}

void _setBool(TextEditingController c, bool v) {
  c.text = v ? 'true' : 'false';
}

/* ================= ethnicity ================= */

class _EthnicityGroup extends StatelessWidget {
  final DemographicsFormControllers ctrls;
  const _EthnicityGroup({required this.ctrls});

  @override
  Widget build(BuildContext context) {
    const subIndent = EdgeInsets.only(left: 36);

    return QuestionCard(
      title: 'Ethnicity',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CheckboxField(ctrl: ctrls.hispanicCtrl, label: 'Hispanic or Latino'),
          const SizedBox(height: 6),

          ValueListenableBuilder<TextEditingValue>(
            valueListenable: ctrls.hispanicCtrl,
            builder: (_, __, ___) => !_asBool(ctrls.hispanicCtrl)
                ? const SizedBox.shrink()
                : Padding(
                    padding: subIndent,
                    child: Column(
                      children: [
                        CheckboxField(
                          ctrl: ctrls.mexicanCtrl,
                          label: 'Mexican',
                        ),
                        const SizedBox(height: 6),
                        CheckboxField(
                          ctrl: ctrls.puertoRicanCtrl,
                          label: 'Puerto Rican',
                        ),
                        const SizedBox(height: 6),
                        CheckboxField(ctrl: ctrls.cubanCtrl, label: 'Cuban'),
                        const SizedBox(height: 6),
                        CheckboxField(
                          ctrl: ctrls.otherHispanicCtrl,
                          label: 'Other Hispanic or Latino - Enter Origin',
                        ),
                        const SizedBox(height: 10),
                        ValueListenableBuilder<TextEditingValue>(
                          valueListenable: ctrls.otherHispanicCtrl,
                          builder: (_, __, ___) =>
                              !_asBool(ctrls.otherHispanicCtrl)
                              ? const SizedBox.shrink()
                              : Padding(
                                  padding: const EdgeInsets.only(right: 8),
                                  child: InsetCard(
                                    child: FormTextField(
                                      label: 'Other',
                                      controller: ctrls.otherHispanicTextCtrl,
                                    ),
                                  ),
                                ),
                        ),
                      ],
                    ),
                  ),
          ),

          const SizedBox(height: 12),
          CheckboxField(
            ctrl: ctrls.notHispanicCtrl,
            label: 'Not Hispanic or Latino',
          ),
          const SizedBox(height: 6),
          CheckboxField(
            ctrl: ctrls.preferNoEthnicityCtrl,
            label: 'Prefer not to disclose',
          ),
        ],
      ),
    );
  }
}

/* ================= race ================= */
class _RaceGroup extends StatelessWidget {
  final DemographicsFormControllers ctrls;
  const _RaceGroup({required this.ctrls});

  @override
  Widget build(BuildContext context) {
    return QuestionCard(
      title: 'Race',
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // American Indian or Alaska Native + tribe text
          CheckboxField(
            ctrl: ctrls.americanIndianCtrl,
            label: 'American Indian or Alaska Native',
          ),
          const SizedBox(height: 10),
          ValueListenableBuilder<TextEditingValue>(
            valueListenable: ctrls.americanIndianCtrl,
            builder: (_, __, ___) => !_asBool(ctrls.americanIndianCtrl)
                ? const SizedBox.shrink()
                : Padding(
                    padding: const EdgeInsets.only(left: 28),
                    child: InsetCard(
                      child: FormTextField(
                        label: 'Enter name of enrolled or principal tribe',
                        controller: ctrls.americanIndianTribeCtrl,
                      ),
                    ),
                  ),
          ),
          const SizedBox(height: 12),

          // Asian + sub-races
          CheckboxField(ctrl: ctrls.asianCtrl, label: 'Asian'),
          const SizedBox(height: 6),
          ValueListenableBuilder<TextEditingValue>(
            valueListenable: ctrls.asianCtrl,
            builder: (_, __, ___) => !_asBool(ctrls.asianCtrl)
                ? const SizedBox.shrink()
                : Padding(
                    padding: const EdgeInsets.only(left: 28),
                    child: Column(
                      children: [
                        CheckboxField(
                          ctrl: ctrls.asianIndianCtrl,
                          label: 'Asian Indian',
                        ),
                        const SizedBox(height: 6),
                        CheckboxField(
                          ctrl: ctrls.chineseCtrl,
                          label: 'Chinese',
                        ),
                        const SizedBox(height: 6),
                        CheckboxField(
                          ctrl: ctrls.filipinoCtrl,
                          label: 'Filipino',
                        ),
                        const SizedBox(height: 6),
                        CheckboxField(ctrl: ctrls.koreanCtrl, label: 'Korean'),
                        const SizedBox(height: 6),
                        CheckboxField(
                          ctrl: ctrls.vietnameseCtrl,
                          label: 'Vietnamese',
                        ),
                        const SizedBox(height: 6),
                        CheckboxField(
                          ctrl: ctrls.otherAsianCtrl,
                          label: 'Other Asian - Enter Race',
                        ),
                        const SizedBox(height: 10),
                        ValueListenableBuilder<TextEditingValue>(
                          valueListenable: ctrls.otherAsianCtrl,
                          builder: (_, __, ___) =>
                              !_asBool(ctrls.otherAsianCtrl)
                              ? const SizedBox.shrink()
                              : InsetCard(
                                  child: FormTextField(
                                    label: 'Other',
                                    controller: ctrls.otherAsianTextCtrl,
                                  ),
                                ),
                        ),
                      ],
                    ),
                  ),
          ),
          const SizedBox(height: 12),

          CheckboxField(
            ctrl: ctrls.blackCtrl,
            label: 'Black or African American',
          ),
          const SizedBox(height: 12),

          // Pacific Islander + sub
          CheckboxField(
            ctrl: ctrls.pacificIslanderCtrl,
            label: 'Native Hawaiian or Other Pacific Islander',
          ),
          const SizedBox(height: 6),
          ValueListenableBuilder<TextEditingValue>(
            valueListenable: ctrls.pacificIslanderCtrl,
            builder: (_, __, ___) => !_asBool(ctrls.pacificIslanderCtrl)
                ? const SizedBox.shrink()
                : Padding(
                    padding: const EdgeInsets.only(left: 28),
                    child: Column(
                      children: [
                        CheckboxField(
                          ctrl: ctrls.nativeHawaiianCtrl,
                          label: 'Native Hawaiian',
                        ),
                        const SizedBox(height: 6),
                        CheckboxField(
                          ctrl: ctrls.guamanianCtrl,
                          label: 'Guamanian or Chamorro',
                        ),
                        const SizedBox(height: 6),
                        CheckboxField(ctrl: ctrls.samoanCtrl, label: 'Samoan'),
                        const SizedBox(height: 6),
                        CheckboxField(
                          ctrl: ctrls.otherPacificCtrl,
                          label: 'Other Pacific Islander - Enter Race',
                        ),
                        const SizedBox(height: 10),
                        ValueListenableBuilder<TextEditingValue>(
                          valueListenable: ctrls.otherPacificCtrl,
                          builder: (_, __, ___) =>
                              !_asBool(ctrls.otherPacificCtrl)
                              ? const SizedBox.shrink()
                              : InsetCard(
                                  child: FormTextField(
                                    label: 'Other',
                                    controller: ctrls.otherPacificTextCtrl,
                                  ),
                                ),
                        ),
                      ],
                    ),
                  ),
          ),
          const SizedBox(height: 12),

          CheckboxField(ctrl: ctrls.whiteCtrl, label: 'White'),
          const SizedBox(height: 6),
          CheckboxField(
            ctrl: ctrls.preferNoRaceCtrl,
            label: 'Prefer not to disclose',
          ),
        ],
      ),
    );
  }
}

/* ================= sex ================= */
class _SexField extends StatelessWidget {
  final TextEditingController ctrl; // 'Female' | 'Male' | 'NoInfo'
  const _SexField({required this.ctrl});

  @override
  Widget build(BuildContext context) {
    return QuestionCard(
      child: ValueListenableBuilder<TextEditingValue>(
        valueListenable: ctrl,
        builder: (context, _, __) {
          final group = ctrl.text;
          void set(String v) => ctrl.text = v;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title inside card (same style as Ethnicity/Race)
              Text(
                'Sex',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: const Color(0xFF2E43DA),
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 12),

              RadioButtonField(
                label: 'Female',
                value: 'Female',
                group: group,
                onChanged: set,
              ),
              RadioButtonField(
                label: 'Male',
                value: 'Male',
                group: group,
                onChanged: set,
              ),
              RadioButtonField(
                label: 'I do not wish to provide this information',
                value: 'NoInfo',
                group: group,
                onChanged: set,
              ),
            ],
          );
        },
      ),
    );
  }
}
