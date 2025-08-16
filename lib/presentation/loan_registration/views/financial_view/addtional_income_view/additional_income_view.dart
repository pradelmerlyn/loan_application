import 'package:flutter/material.dart';
import 'package:loan/presentation/widgets/ui/button_outlined.dart';
import 'package:loan/presentation/widgets/ui/section_header_bar.dart';

class AdditionalIncomeItem {
  final String source;
  final String owner;
  final String amount; // formatted: $1,500.00
  const AdditionalIncomeItem({
    required this.source,
    required this.owner,
    required this.amount,
  });
}

class AdditionalIncomeSection extends StatefulWidget {
  const AdditionalIncomeSection({super.key});
  @override
  State<AdditionalIncomeSection> createState() =>
      _AdditionalIncomeSectionState();
}

class _AdditionalIncomeSectionState extends State<AdditionalIncomeSection> {
  final List<AdditionalIncomeItem> _items = const [
    AdditionalIncomeItem(
      source: 'Public Assistance',
      owner: 'John Doe',
      amount: r'$1,500.00',
    ),
  ];

  // currency helpers (for total)
  double _toAmount(String s) {
    final t = s.replaceAll(RegExp(r'[^0-9.]'), '');
    return double.tryParse(t.isEmpty ? '0' : t) ?? 0;
  }

  String _fmtCurrency(num v) {
    final s = v.toStringAsFixed(2);
    final parts = s.split('.');
    final head = parts[0].replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (m) => '${m[1]},',
    );
    return '\$$head.${parts[1]}';
  }

  num get _totalMonthly =>
      _items.fold<num>(0, (sum, it) => sum + _toAmount(it.amount));

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final totalText = _fmtCurrency(_totalMonthly);

    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.onSecondary,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeaderBar(title: 'Additional Gross Monthly Income'),

          // cards
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Column(
              children: [
                for (final it in _items) ...[
                  _IncomeCard(item: it),
                  const SizedBox(height: 12),
                ],
                _TotalRow(amount: totalText),
              ],
            ),
          ),

          // button
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
            child: ButtonOutlined(
                label: 'Add Another Income',
                leading: const Icon(
                  Icons.add_circle_outline,
                  size: 20,
                  color: Colors.white,
                ),
                backgroundColor: theme.colorScheme.secondary,
                foregroundColor: Colors.white,
                onPressed: () {},
                //async {
                //   final result = await Navigator.push<Map<String, String>>(
                //     context,
                //     MaterialPageRoute(
                //       builder: (_) => const AdditionalIncomeScreen(),
                //     ),
                //   );
                //   if (!mounted || result == null) return;
                //   setState(() {
                //     _items.add(
                //       AdditionalIncomeItem(
                //         source: result['source'] ?? '',
                //         owner: result['owner'] ?? '',
                //         amount: result['amount'] ?? r'$0.00',
                //       ),
                //     );
                //   });
                // },
                ),
          ),
        ],
      ),
    );
  }
}

/* ---------------- small widgets ---------------- */

class _IncomeCard extends StatelessWidget {
  final AdditionalIncomeItem item;
  const _IncomeCard({required this.item});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final titleStyle = theme.textTheme.labelSmall;
    final subtitleStyle = theme.textTheme.bodyMedium;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          // Row 1: Title + menu
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  item.source,
                  style: titleStyle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const Icon(Icons.more_vert, size: 22),
            ],
          ),
          const SizedBox(height: 4),
          // Row 2: Owner + amount
          Row(
            children: [
              Expanded(
                child: Text(
                  item.owner,
                  style: subtitleStyle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(item.amount, style: titleStyle),
            ],
          ),
        ],
      ),
    );
  }
}

class _TotalRow extends StatelessWidget {
  final String amount;
  const _TotalRow({required this.amount});

  @override
  Widget build(BuildContext context) {
    final styleLabel = Theme.of(context).textTheme.titleSmall;
    final styleValue = Theme.of(context).textTheme.titleSmall;

    return Padding(
      padding: const EdgeInsets.only(top: 4, left: 4, right: 4),
      child: Row(
        children: [
          Expanded(child: Text('Total Additional Income', style: styleLabel)),
          Text('$amount/Year', style: styleValue),
        ],
      ),
    );
  }
}
