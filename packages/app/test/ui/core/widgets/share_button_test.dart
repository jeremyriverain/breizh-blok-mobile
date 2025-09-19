import 'package:breizh_blok_mobile/service_locator/service_locator.dart';
import 'package:breizh_blok_mobile/services/share_content/share_content_service_impl.dart';
import 'package:breizh_blok_mobile/ui/core/widgets/share_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:share_plus/share_plus.dart';

import '../../../mocks.dart';
import '../../../widget_test_utils.dart';

void main() {
  late ShareContentServiceImpl shareContentService;

  setUp(() {
    shareContentService = MockShareContentService();
  });
  testWidgets('ShareButton', (tester) async {
    when(() => shareContentService.share('foo')).thenAnswer(
      (_) async => const ShareResult('foo', ShareResultStatus.success),
    );

    await tester.myPumpWidget(
      widget: const ShareButton(content: 'foo'),
      overrides: [
        shareContentServiceProvider.overrideWith((_) => shareContentService),
      ],
    );
    await tester.pump();

    await tester.tap(find.byIcon(Icons.share));

    await tester.pumpAndSettle();

    verify(() => shareContentService.share('foo')).called(1);
  });
}
