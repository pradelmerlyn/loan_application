// asset_item.dart
class AssetItem {
  final String owner;
  final String bank;
  final String type;
  final String accountNumber;
  final String value; // formatted for display

  const AssetItem({
    required this.owner,
    required this.bank,
    required this.type,
    required this.accountNumber,
    required this.value,
  });
}
