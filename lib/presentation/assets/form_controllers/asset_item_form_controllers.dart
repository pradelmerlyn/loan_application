import 'package:flutter/material.dart';

class SingleAssetControllers {
  final TextEditingController institution;
  final TextEditingController account;
  final TextEditingController amount;
  final ValueNotifier<String> type;

  SingleAssetControllers({
    required this.institution,
    required this.account,
    required this.amount,
    required this.type,
  });

  void dispose() {
    institution.dispose();
    account.dispose();
    amount.dispose();
    type.dispose();
  }
}

class AssetFormControllers {
  final List<SingleAssetControllers> items;

  AssetFormControllers({required this.items});

  factory AssetFormControllers.init() {
    return AssetFormControllers(items: [
      SingleAssetControllers(
        institution: TextEditingController(),
        account: TextEditingController(),
        amount: TextEditingController(),
        type: ValueNotifier<String>(''), 
      ),
    ]);
  }

  void addAsset() {
    items.add(
      SingleAssetControllers(
        institution: TextEditingController(),
        account: TextEditingController(),
        amount: TextEditingController(),
        type: ValueNotifier<String>(''),
      ),
    );
  }

  void removeAsset(int index) {
    if (index >= 0 && index < items.length) {
      items[index].dispose();
      items.removeAt(index);
    }
  }

  void dispose() {
    for (final asset in items) {
      asset.dispose();
    }
  }
}
