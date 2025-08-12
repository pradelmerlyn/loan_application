import 'package:flutter/material.dart';
import 'package:loan/domain/entities/assets/asset_item_entity.dart'
    show AssetItem;
import 'package:loan/presentation/assets/screens/asset_form_screen.dart';
import 'package:loan/presentation/widgets/ui/button_outlined.dart';
import 'package:loan/presentation/widgets/ui/section_header_bar.dart';

class AssetsSection extends StatefulWidget {
  const AssetsSection({super.key});

  @override
  State<AssetsSection> createState() => _AssetsSectionState();
}

class _AssetsSectionState extends State<AssetsSection> {
  final List<AssetItem> _assets = const [
    AssetItem(
      owner: 'John Doe',
      bank: 'US BANK',
      type: 'Checking Account',
      accountNumber: '1234',
      value: '\$12,503.81',
    ),
  ].toList();

  Future<void> _handleAddAsset(BuildContext context) async {
    final choice = await showDialog<String>(
      context: context,
      builder: (_) => const _AddOptionsDialog(
        title: 'Add Asset Options',
        primaryText: 'E‑Verify',
        secondaryText: 'Manual Add',
      ),
    );
    if (choice == null) return;

    final result = await Navigator.push<AssetItem>(
      context,
      MaterialPageRoute(builder: (_) => const AssetFormScreen()),
    );
    if (result != null && mounted) {
      setState(() => _assets.add(result));
    }
  }

  @override
  Widget build(BuildContext context) {
    return _AssetsContainer(
      header: const _AssetsHeader(),
      list: _AssetsList(items: _assets),
      addButton: _AddAssetButton(onPressed: () => _handleAddAsset(context)),
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
  final List<AssetItem> items;
  const _AssetsList({required this.items});

  @override
  Widget build(BuildContext context) {
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
  final AssetItem item;
  const _AssetCard({required this.item});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final titleStyle = Theme.of(
      context,
    ).textTheme.labelSmall?.copyWith(fontWeight: FontWeight.w700);

    final acc = item.accountNumber;
    final masked = acc.length > 4
        ? 'xxxxxxx${acc.substring(acc.length - 4)}'
        : acc;

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
          // Row 1: Bank name (left) + menu (right)
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  item.bank,
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
            '${item.type} - $masked',
            style: TextStyle(color: theme.hintColor),
          ),

          const SizedBox(height: 4),

          // Row 3: Owner (left) + amount (right)
          Row(
            children: [
              Expanded(
                child: Text(
                  item.owner,
                  style: TextStyle(color: theme.hintColor),
                ),
              ),
              // keep long amounts tidy
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 180),
                child: Text(
                  item.value,
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
      onPressed: onPressed,
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
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
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
