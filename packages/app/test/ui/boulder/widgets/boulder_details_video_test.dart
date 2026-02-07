import 'package:breizh_blok_mobile/service_locator/service_locator.dart';
import 'package:breizh_blok_mobile/ui/boulder/widgets/boulder_details_video.dart';
import 'package:breizh_blok_url_launcher/breizh_blok_url_launcher.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mocks.dart';
import '../../../widget_test_utils.dart';

void main() {
  group('BoulderDetailsVideo', () {
    const videoId = 'abc123';
    const url = 'https://www.youtube.com/watch?v=abc123';

    late UrlLauncher urlLauncher;

    setUp(() {
      urlLauncher = MockUrlLauncher();
    });

    testWidgets(
      'Then it displays a play icon and a thumbnail image',
      (tester) async {
        await tester.myPumpWidget(
          overrides: [urlLauncherProvider.overrideWith((_) => urlLauncher)],
          widget: const BoulderDetailsVideo(
            videoId: videoId,
            url: url,
          ),
        );

        await tester.pump();

        expect(find.byIcon(Icons.play_arrow), findsOneWidget);
        expect(find.byType(CachedNetworkImage), findsOneWidget);
      },
    );

    testWidgets(
      'When I tap on the video thumbnail, then it opens the video url',
      (tester) async {
        when(
          () => urlLauncher.openUrl(Uri.parse(url)),
        ).thenReturn(TaskEither<LaunchUrlException, bool>.of(true));

        await tester.myPumpWidget(
          overrides: [urlLauncherProvider.overrideWith((_) => urlLauncher)],
          widget: const BoulderDetailsVideo(
            videoId: videoId,
            url: url,
          ),
        );

        await tester.pump();

        await tester.tap(find.byType(GestureDetector).first);

        await tester.pump();

        verify(
          () => urlLauncher.openUrl(Uri.parse(url)),
        ).called(1);
      },
    );
  });
}
