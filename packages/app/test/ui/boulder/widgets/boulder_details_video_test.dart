import 'package:breizh_blok_mobile/domain/entities/video_link/video_link.dart';
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
    const videoLink = VideoLink(
      url: 'https://www.youtube.com/watch?v=foo',
      videoId: 'foo',
      type: 'youtube',
    );

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
            videoLink: videoLink,
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
          () => urlLauncher.openUrl(Uri.parse(videoLink.url)),
        ).thenReturn(TaskEither<LaunchUrlException, bool>.of(true));

        await tester.myPumpWidget(
          overrides: [urlLauncherProvider.overrideWith((_) => urlLauncher)],
          widget: const BoulderDetailsVideo(
            videoLink: videoLink,
          ),
        );

        await tester.pump();

        await tester.tap(find.byType(GestureDetector).first);

        await tester.pump();

        verify(
          () => urlLauncher.openUrl(Uri.parse(videoLink.url)),
        ).called(1);
      },
    );

    testWidgets(
      '''
When I tap on the video thumbnail and openUrl returns a LaunchUrlException,
then no error is thrown
''',
      (tester) async {
        when(
          () => urlLauncher.openUrl(Uri.parse(videoLink.url)),
        ).thenReturn(
          TaskEither<LaunchUrlException, bool>.left(
            const LaunchUrlException.unknwown(message: 'error'),
          ),
        );

        await tester.myPumpWidget(
          overrides: [urlLauncherProvider.overrideWith((_) => urlLauncher)],
          widget: const BoulderDetailsVideo(videoLink: videoLink),
        );

        await tester.pump();

        await tester.tap(find.byType(GestureDetector).first);

        await tester.pump();

        verify(
          () => urlLauncher.openUrl(Uri.parse(videoLink.url)),
        ).called(1);
      },
    );
  });
}
