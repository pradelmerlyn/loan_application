import 'package:flutter/material.dart';

class LoadingDialog extends StatelessWidget {
  final String message;

  const LoadingDialog({
    super.key,
    this.message = 'Please wait…',
  });

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false, // block system back
      child: AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        contentPadding: const EdgeInsets.fromLTRB(24, 24, 24, 16),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              width: 40,
              height: 40,
              child: CircularProgressIndicator(),
            ),
            const SizedBox(height: 16),
            Text(
              message,
              style: const TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

// handy helper
Future<void> showLoadingDialog(BuildContext context,
    {String message = 'Please wait…'}) {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // block tap outside
    useRootNavigator: true,
    builder: (_) => LoadingDialog(message: message),
  );
}
