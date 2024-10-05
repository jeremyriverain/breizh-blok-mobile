// ignore_for_file: avoid_print

import 'package:breizh_blok_mobile/components/bb_share_button.dart';
import 'package:breizh_blok_mobile/share_content_service.dart';
import 'package:breizh_blok_mobile/share_content_service_interface.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
@GenerateNiceMocks([MockSpec<ShareContentService>()])
import './bb_share_button_test.mocks.dart';

void main() {
  testWidgets('BbShareButton', (tester) async {
    final mockShareContentService = MockShareContentService();

    await tester.pumpWidget(
      MaterialApp(
        home: RepositoryProvider<ShareContentServiceInterface>(
          create: (context) => mockShareContentService,
          child: const BbShareButton(content: 'foo'),
        ),
      ),
    );

    await tester.pumpAndSettle();

    await tester.tap(find.byIcon(Icons.share));

    await tester.pumpAndSettle();

    verify(
      mockShareContentService.share(
        'foo',
      ),
    ).called(1);
  });
}
