import 'package:breizh_blok_mobile/ui/core/widgets/my_map_switch_style_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mocks.dart';
import '../../../widget_test_utils.dart';

void main() {
  group('MyMapSwitchStyleButton', () {
    late MapboxMap mapboxMap;
    late StyleManager styleManager;

    setUp(() {
      mapboxMap = MockMapboxMap();
      styleManager = MockStyleManager();

      when(() => mapboxMap.style).thenReturn(styleManager);
    });

    testWidgets(
      '''
Given default style is currently used,
When I tap on the button,
Then the style switches to satellite. 
''',
      (tester) async {
        const defaultStyle = 'foo';
        when(
          () => styleManager.getStyleURI(),
        ).thenAnswer((_) async => defaultStyle);

        when(
          () => styleManager.setStyleURI(any()),
        ).thenAnswer((_) async => () {}());

        await tester.myPumpWidget(
          widget: MyMapSwitchStyleButton(
            mapboxMap: mapboxMap,
            defaultStyle: defaultStyle,
          ),
        );

        await tester.pump();

        await tester.tap(find.byType(IconButton));

        await tester.pump();

        verify(() => styleManager.getStyleURI()).called(1);

        verify(
          () => styleManager.setStyleURI(MapboxStyles.SATELLITE),
        ).called(1);

        verifyNoMoreInteractions(styleManager);
      },
    );

    testWidgets(
      '''
Given default style is not currently used,
When I tap on the button,
Then the style switches to default style. 
''',
      (tester) async {
        const defaultStyle = 'foo';
        when(() => styleManager.getStyleURI()).thenAnswer((_) async => 'bar');

        when(
          () => styleManager.setStyleURI(any()),
        ).thenAnswer((_) async => () {}());

        await tester.myPumpWidget(
          widget: MyMapSwitchStyleButton(
            mapboxMap: mapboxMap,
            defaultStyle: defaultStyle,
          ),
        );

        await tester.pump();

        await tester.tap(find.byType(IconButton));

        await tester.pump();

        verify(() => styleManager.getStyleURI()).called(1);

        verify(() => styleManager.setStyleURI(defaultStyle)).called(1);

        verifyNoMoreInteractions(styleManager);
      },
    );

    testWidgets(
      '''
Given mapbox throws an error after tapping on the button,
Then the exception is properly caught. 
''',
      (tester) async {
        const defaultStyle = 'foo';
        when(() => styleManager.getStyleURI()).thenThrow(Exception('foo'));

        when(
          () => styleManager.setStyleURI(any()),
        ).thenAnswer((_) async => () {}());

        await tester.myPumpWidget(
          widget: MyMapSwitchStyleButton(
            mapboxMap: mapboxMap,
            defaultStyle: defaultStyle,
          ),
        );

        await tester.pump();

        await tester.tap(find.byType(IconButton));

        await tester.pump();

        verify(() => styleManager.getStyleURI()).called(1);

        verifyNoMoreInteractions(styleManager);
      },
    );
  });
}
