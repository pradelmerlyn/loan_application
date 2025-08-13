// presentation/loan_registration/views/financial_view/employment_view/employment_section.dart
import 'package:flutter/material.dart';
import 'package:loan/presentation/employment/screens/employment_form_screen.dart';
import 'package:loan/presentation/widgets/ui/button_outlined.dart';
import 'package:loan/domain/entities/employment/employment_item_entity.dart';
import 'package:loan/presentation/widgets/ui/section_header_bar.dart';

class EmploymentSection extends StatefulWidget {
  const EmploymentSection({super.key});

  @override
  State<EmploymentSection> createState() => _EmploymentSectionState();
}

class _EmploymentSectionState extends State<EmploymentSection> {
  final List<EmploymentItem> _items = const [
    EmploymentItem(
      employer: 'American Network',
      isCurrent: true,
      jobType: 'Full Time',
      since: 'Since Oct 2019',
      belongsTo: 'John Doe',
      annualSalary: r'$80,000.00/Year',
    ),
  ];

  Future<void> _handleAdd() async {
    // 1) Show options dialog
    final choice = await _showAddOptions(
      context,
      title: 'Add Employment Options',
      primaryText: 'E‑Verify',
      secondaryText: 'Manual Add',
    );

    // After an await, ALWAYS guard context usage
    if (!mounted || choice == null) return;

    // 2) Navigate to the form
    final result = await Navigator.of(context).push<EmploymentItem>(
      MaterialPageRoute(builder: (_) => const EmploymentFormScreen()),
    );

    if (!mounted || result == null) return;

    // 3) Update UI
    setState(() => _items.add(result));
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.onSecondary,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeaderBar(title: 'Employment Information'),
          _EmploymentList(items: _items),
          _AddEmploymentButton(onAdd: _handleAdd),
        ],
      ),
    );
  }
}

/* ---------- Small widget functions / components ---------- */

class _EmploymentList extends StatelessWidget {
  final List<EmploymentItem> items;
  const _EmploymentList({required this.items});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: Column(
        children: items
            .map(
              (e) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: _EmploymentCard(item: e),
              ),
            )
            .toList(),
      ),
    );
  }
}

class _EmploymentCard extends StatelessWidget {
  final EmploymentItem item;
  const _EmploymentCard({required this.item});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final titleStyle = Theme.of(
      context,
    ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.normal);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: .04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Row 1: Employer + badge + menu
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Wrap(
                  spacing: 8,
                  runSpacing: 4,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Text(
                      item.employer,
                      style: titleStyle,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                    if (item.isCurrent)
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.green.withValues(alpha: .15),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Text(
                          'Current Job',
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              const Icon(Icons.more_vert, size: 22),
            ],
          ),
          const SizedBox(height: 8),

          // Row 2
          Text(
            '${item.jobType} - ${item.since}',
            style: TextStyle(color: theme.hintColor),
          ),
          const SizedBox(height: 4),

          // Row 3
          Row(
            children: [
              Expanded(
                child: Text(
                  item.belongsTo,
                  style: TextStyle(color: theme.hintColor),
                ),
              ),
              Text(
                item.annualSalary,
                style: titleStyle,
                textAlign: TextAlign.right,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _AddEmploymentButton extends StatelessWidget {
  final VoidCallback onAdd;
  const _AddEmploymentButton({required this.onAdd});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
      child: ButtonOutlined(
        label: 'Add Employment',
        leading: const Icon(
          Icons.add_circle_outline,
          size: 20,
          color: Colors.white,
        ),
        onPressed: onAdd,
        backgroundColor: theme.colorScheme.secondary,
        foregroundColor: Colors.white,
      ),
    );
  }
}

/* ---------- Dialog helper ---------- */

Future<String?> _showAddOptions(
  BuildContext context, {
  required String title,
  required String primaryText,
  required String secondaryText,
}) {
  final theme = Theme.of(context);
  return showDialog<String>(
    context: context,
    builder: (dCtx) => Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                title,
                style: Theme.of(
                  dCtx,
                ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
              ),
            ),
            const SizedBox(height: 16),
            ButtonOutlined(
              label: primaryText,
              leading: const Icon(Icons.public, color: Colors.white),
              onPressed: () => Navigator.of(dCtx).pop('primary'),
              backgroundColor: theme.colorScheme.primary,
              foregroundColor: Colors.white,
            ),
            const SizedBox(height: 12),
            ButtonOutlined(
              label: secondaryText,
              leading: Icon(
                Icons.add_circle_outline,
                color: theme.colorScheme.primary,
              ),
              onPressed: () => Navigator.of(dCtx).pop('secondary'),
              backgroundColor: theme.colorScheme.onSecondary,
              foregroundColor: theme.colorScheme.primary,
              borderColor: theme.colorScheme.primary,
            ),
          ],
        ),
      ),
    ),
  );
}
