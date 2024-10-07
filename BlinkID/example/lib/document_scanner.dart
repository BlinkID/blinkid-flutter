import 'package:blinkid_flutter/microblink_scanner.dart';
import 'package:blinkid_flutter/microblink_scanner_widget.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

typedef ScanResult = List<RecognizerResult>;

extension ScanDocumentExtension on BuildContext {
  Future<ScanResult?> scanDocument() => _isPermissionGranted().then(
        (isGranted) => isGranted
            ? Navigator.push(
                this,
                MaterialPageRoute<ScanResult>(
                  fullscreenDialog: true,
                  builder: (BuildContext context) => const _DocumentScannerDialog(),
                ),
              )
            : () {
                ScaffoldMessenger.of(this).showSnackBar(
                  const SnackBar(
                    content: Text('Permission to use Camera is required.'),
                    action: SnackBarAction(label: 'Open App Settings', onPressed: openAppSettings),
                  ),
                );
              }(),
      );

  Future<bool> _isPermissionGranted() => Permission.camera.request().then((permissions) => permissions.isGranted);
}

class _DocumentScannerDialog extends StatefulWidget {
  const _DocumentScannerDialog();

  @override
  State<_DocumentScannerDialog> createState() => _DocumentScannerDialogState();
}

class _DocumentScannerDialogState extends State<_DocumentScannerDialog> {
  final ValueNotifier<bool> _firstSideScannedNotifier = ValueNotifier(false);
  final ValueNotifier<DetectionStatus?> _detectionStatusNotifier = ValueNotifier(null);
  ScanResult? _result;

  static const _shadows = [
    Shadow(blurRadius: 60),
    Shadow(blurRadius: 40),
    Shadow(blurRadius: 20),
    Shadow(blurRadius: 10),
  ];

  @override
  void dispose() {
    _firstSideScannedNotifier.dispose();
    _detectionStatusNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            Positioned.fill(
              child: ColoredBox(
                color: Colors.black,
                child: MicroblinkScannerWidget(
                  collection: RecognizerCollection(<Recognizer>[
                    BlinkIdMultiSideRecognizer()
                      ..recognitionModeFilter = (RecognitionModeFilter()..enablePhotoId = false)
                      ..skipUnsupportedBack = true
                      ..anonymizationMode = AnonymizationMode.None,
                  ]),
                  onResult: (result) {
                    if (_result != null) return Future.value(false);
                    _result = result;

                    Navigator.of(context).pop(_result);

                    return Future.value(false);
                  },
                  onScanDone: (scanResultState) {},
                  onError: print,
                  licenseKey: Theme.of(context).platform.microblinkLicenseKey,
                  onFirstSideScanned: () => _firstSideScannedNotifier.value = true,
                  onDetectionUpdate: (update) => _detectionStatusNotifier.value = update.status,
                  settings: DocumentVerificationOverlaySettings()
                    ..useFrontCamera = false
                    ..flipFrontCamera = false,
                ),
              ),
            ),
            Positioned(
              left: 40,
              right: 40,
              top: 40,
              child: SafeArea(
                left: true,
                top: true,
                bottom: false,
                right: false,
                child: Column(
                  children: [
                    ValueListenableBuilder(
                      valueListenable: _firstSideScannedNotifier,
                      builder: (_, firstSideScanned, __) => Text(
                        firstSideScanned ? 'Scan the back of the document.' : 'Scan the front of the document.',
                        style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                              color: Colors.white,
                              shadows: _shadows,
                            ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    ValueListenableBuilder(
                      valueListenable: _detectionStatusNotifier,
                      builder: (_, detectionStatus, __) => Text(
                        detectionStatus?.name ?? '',
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium
                            ?.copyWith(color: Colors.white, shadows: _shadows),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: SafeArea(
                left: true,
                top: true,
                bottom: false,
                right: false,
                child: IconButton(
                  padding: const EdgeInsets.all(40),
                  icon: const Icon(
                    Icons.close,
                    color: Colors.white,
                    shadows: _shadows,
                    size: 28,
                  ),
                  onPressed: () => Navigator.of(context).pop(null),
                ),
              ),
            ),
          ],
        ),
      );
}

extension on TargetPlatform {
  String get microblinkLicenseKey => switch (this) {
        TargetPlatform.iOS =>
          'sRwCABVjb20ubWljcm9ibGluay5zYW1wbGUBbGV5SkRjbVZoZEdWa1QyNGlPakUzTWpFek9EVTRNVEEyTlRFc0lrTnlaV0YwWldSR2Iz'
              'SWlPaUprWkdRd05qWmxaaTAxT0RJekxUUXdNRGd0T1RRNE1DMDFORFU0WWpBeFlUVTJZamdpZlE9PWEJrlgmmQ9VywX915J8m1TjF2GrO'
              '750y/ksBB6HA6EHBHcRe3cQ6hS2IL6rSnxw2rb3foQSv3L7LxjTiJiKtO23Rb5a3xHvNoe7A8BlX7iCT39OB48Cx8pkDmRFQ/vgwDrO6j'
              '4GqNCP8u//M0fMoE9XG2nI9PVY',
        TargetPlatform.android =>
          'sRwCABVjb20ubWljcm9ibGluay5zYW1wbGUAbGV5SkRjbVZoZEdWa1QyNGlPakUzTWpFek9EVTNOak0xTmpRc0lrTnlaV0YwWldSR2Iz'
              'SWlPaUprWkdRd05qWmxaaTAxT0RJekxUUXdNRGd0T1RRNE1DMDFORFU0WWpBeFlUVTJZamdpZlE9PWKzGRpwZ0Yg81/n2kQ09RrtiQhs5'
              'K8k+Mjawaer1MOcxgeLaIhkBn5CpPi4cbtqTdTj9h7vrE6cxFRbrqpYyfoIAAFut1hI/f7zN3CFouAebHnqS38/Ocwk8xIafUumdpdtpB'
              'tU1er+p6Z+CeUnzr6c84A9xjxK',
        TargetPlatform.fuchsia ||
        TargetPlatform.linux ||
        TargetPlatform.macOS ||
        TargetPlatform.windows =>
          throw UnsupportedError('Unsupported platform $this')
      };
}
