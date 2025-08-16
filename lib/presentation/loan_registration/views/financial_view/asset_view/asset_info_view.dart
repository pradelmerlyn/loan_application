import 'package:flutter/material.dart';
import 'package:loan/domain/entities/financial_assets/asset_entity.dart';
import 'package:loan/presentation/assets/screens/asset_form_screen.dart';
import 'package:loan/presentation/widgets/ui/button_outlined.dart';
import 'package:loan/presentation/widgets/ui/section_header_bar.dart';

class AssetsSection extends StatefulWidget {
  const AssetsSection({super.key});

  @override
  State<AssetsSection> createState() => _AssetsSectionState();
}

class _AssetsSectionState extends State<AssetsSection> {
  final List<AssetEntity> _assets = [
    const AssetEntity(
      institutionName: 'UnionBank',
      assetType: 'Savings Account',
      accountIdentifier: '123456789012',
      borrowersIds: ['John Doe'],
      userType: 'Primary',
      assetValue: 10000.00,
    ),
  ];

  Future<void> _handleAddAsset() async {
    final choice = await showDialog<String>(
      context: context,
      builder: (dialogCtx) => const _AddOptionsDialog(
        title: 'Add Asset Options',
        primaryText: 'E‑Verify',
        secondaryText: 'Manual Add',
      ),
    );

    if (!mounted || choice == null) return;

    // For now both choices go to the same manual form screen
    final result = await Navigator.of(context).push<AssetEntity>(
      MaterialPageRoute(builder: (_) => const AssetFormScreen()),
    );

    if (!mounted || result == null) return;

    setState(() => _assets.add(result));
  }

  @override
  Widget build(BuildContext context) {
    return _AssetsContainer(
      header: const _AssetsHeader(),
      list: _AssetsList(items: _assets),
      addButton: _AddAssetButton(onPressed: _handleAddAsset),
    );
  }
}

/* ----------------- Small widgets ----------------- */

class _AssetsContainer extends StatelessWidget {
  final Widget header;
  final Widget list;
  final Widget addButton;
  const _AssetsContainer({
    required this.header,
    required this.list,
    required this.addButton,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.onSecondary,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          header,
          Padding(padding: const EdgeInsets.all(16), child: list),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: addButton,
          ),
        ],
      ),
    );
  }
}

class _AssetsHeader extends StatelessWidget {
  const _AssetsHeader();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onSecondary,
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [SectionHeaderBar(title: 'Assets Information')],
      ),
    );
  }
}

class _AssetsList extends StatelessWidget {
  final List<AssetEntity> items;
  const _AssetsList({required this.items});

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return const Text('No assets added yet.');
    }
    return Column(
      children: items
          .map(
            (a) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: _AssetCard(item: a),
            ),
          )
          .toList(),
    );
  }
}

class _AssetCard extends StatelessWidget {
  final AssetEntity item;
  const _AssetCard({required this.item});

  String _maskAccount(String? acc) {
    final s = acc ?? '';
    if (s.length <= 4) return s;
    return '•••• ${s.substring(s.length - 4)}';
  }

  String _formatAmount(num? value) {
    if (value == null) return '—';
    // simple formatting; swap for intl NumberFormat if you use it
    return '\$${value.toStringAsFixed(2)}';
  }

  String _ownerLabel(List<String>? borrowersIds, String? userType) {
    if (userType != null && userType.isNotEmpty) return userType;
    if (borrowersIds != null && borrowersIds.isNotEmpty) {
      return 'Owners: ${borrowersIds.join(", ")}';
    }
    return 'Owner: —';
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final titleStyle = Theme.of(context)
        .textTheme
        .labelSmall
        ?.copyWith(fontWeight: FontWeight.w700);

    final bank = item.institutionName ?? '—';
    final type = item.assetType ?? '—';
    final maskedAcc = _maskAccount(item.accountIdentifier);
    final ownerText = _ownerLabel(item.borrowersIds, item.userType);
    final amountText = _formatAmount(item.assetValue);

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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Row 1: Bank name (left) + menu (right)
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  bank,
                  style: titleStyle,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
              const SizedBox(width: 8),
              const Icon(Icons.more_vert, size: 22),
            ],
          ),

          const SizedBox(height: 8),

          // Row 2: Account type – masked number
          Text(
            '$type – $maskedAcc',
            style: TextStyle(color: theme.hintColor),
          ),

          const SizedBox(height: 4),

          // Row 3: Owner (left) + amount (right)
          Row(
            children: [
              Expanded(
                child: Text(
                  ownerText,
                  style: TextStyle(color: theme.hintColor),
                ),
              ),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 180),
                child: Text(
                  amountText,
                  style: titleStyle,
                  textAlign: TextAlign.right,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _AddAssetButton extends StatelessWidget {
  final VoidCallback onPressed;
  const _AddAssetButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ButtonOutlined(
      label: 'Add Asset',
      leading: const Icon(
        Icons.add_circle_outline,
        size: 20,
        color: Colors.white,
      ),
      onPressed: () {},
      backgroundColor: theme.colorScheme.secondary,
      foregroundColor: Colors.white,
    );
  }
}

/* ----------------- Dialog ----------------- */

class _AddOptionsDialog extends StatelessWidget {
  final String title;
  final String primaryText;
  final String secondaryText;

  const _AddOptionsDialog({
    required this.title,
    required this.primaryText,
    required this.secondaryText,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Dialog(
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
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontWeight: FontWeight.w700),
              ),
            ),
            const SizedBox(height: 16),
            ButtonOutlined(
              label: primaryText,
              leading: const Icon(Icons.public, color: Colors.white),
              onPressed: () => Navigator.of(context).pop('primary'),
              backgroundColor: theme.colorScheme.secondary,
              foregroundColor: Colors.white,
            ),
            const SizedBox(height: 12),
            ButtonOutlined(
              label: secondaryText,
              leading: Icon(
                Icons.add_circle_outline,
                color: theme.colorScheme.secondary,
              ),
              onPressed: () => Navigator.of(context).pop('secondary'),
              backgroundColor: theme.colorScheme.onSecondary,
              foregroundColor: theme.colorScheme.primary,
              borderColor: theme.colorScheme.primary,
            ),
          ],
        ),
      ),
    );
  }
}
