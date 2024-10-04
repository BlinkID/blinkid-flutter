import 'package:blinkid_flutter/microblink_scanner.dart';
import 'package:flutter/material.dart';
import 'package:sample/document_scanner.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Future<void> _handleScanningDocument(BuildContext context) async {
    final result = await context.scanDocument();
    if (!context.mounted || result == null) return;

    await context.showResultDialog(result);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('BlinkID Example')),
        body: Center(
          child: FilledButton(
            onPressed: () => _handleScanningDocument(context),
            child: const Text('Scan Document'),
          ),
        ),
      );
}

extension on BuildContext {
  Future<void> showResultDialog(List<RecognizerResult> result) => showDialog<void>(
        context: this,
        builder: (_) => Dialog(
          clipBehavior: Clip.antiAlias,
          child: Scaffold(
            appBar: AppBar(title: const Text('Result'), leading: const CloseButton()),
            body: ListView.builder(
              itemBuilder: (_, index) {
                final item = result[index];

                final name = switch (item) {
                  BlinkIdMultiSideRecognizerResult _ => 'BlinkIdMultiSideRecognizerResult',
                  _ => item.runtimeType.toString(),
                };

                return ExpansionTile(
                  title: Text(name),
                  children: (item.nativeResult ?? {})
                      .entries
                      .map((entry) => ListTile(title: Text('${entry.key}: ${entry.value}')))
                      .toList(),
                );
              },
              itemCount: result.length,
            ),
          ),
        ),
      );
}
