// ignore_for_file: avoid_print

import 'package:breizh_blok_mobile/services/share_content/share_content_service.dart';
import 'package:breizh_blok_mobile/services/share_content/share_content_service_interface.dart';
import 'package:breizh_blok_mobile/ui/core/widgets/share_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../widget_test_utils.dart';
@GenerateNiceMocks([MockSpec<ShareContentService>()])
import 'share_button_test.mocks.dart';

void main() {
  testWidgets('BbShareButton', (tester) async {
    final mockShareContentService = MockShareContentService();

    await myPumpAndSettle(
      tester,
      widget: RepositoryProvider<ShareContentServiceInterface>(
        create: (context) => mockShareContentService,
        child: const ShareButton(content: 'foo'),
      ),
    );

    await tester.tap(find.byIcon(Icons.share));

    await tester.pumpAndSettle();

    verify(
      mockShareContentService.share(
        'foo',
      ),
    ).called(1);
  });
}
