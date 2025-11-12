import 'package:breizh_blok_mobile/service_locator/service_locator.dart';
import 'package:breizh_blok_mobile/ui/core/widgets/share_button.dart';
import 'package:breizh_blok_share_content/breizh_blok_share_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mocks.dart';
import '../../../widget_test_utils.dart';

void main() {
  late ShareContent shareContentService;

  setUp(() {
    shareContentService = MockShareContent();
  });
  testWidgets('ShareButton', (tester) async {
    when(() => shareContentService.share('foo')).thenReturn(
      TaskEither.right(ShareContentResult.success),
    );

    await tester.myPumpWidget(
      widget: const ShareButton(content: 'foo'),
      overrides: [
        shareContentProvider.overrideWith((_) => shareContentService),
      ],
    );
    await tester.pump();

    await tester.tap(find.byIcon(Icons.share));

    await tester.pumpAndSettle();

    verify(() => shareContentService.share('foo')).called(1);
  });
}
