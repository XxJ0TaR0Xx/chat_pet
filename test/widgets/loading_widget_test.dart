import 'package:chat_pet/presentation/ui_kit/molecule/common_widgets/loading_widget.dart';
import 'package:chat_pet/presentation/ui_kit/ui_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'utils/screen_util_extension.dart';

Future<void> _pumpLoadingWidget(WidgetTester tester, {Color? color}) async {
  await tester.pumpWidget(
    MaterialApp(
      home: LoadingWidget(color: color),
    ).screenUtil,
  );

  await tester.pump();
}

void main() {
  group(
    'LoadingWidget',
    () {
      testWidgets('Rendering', (tester) async {
        await _pumpLoadingWidget(tester);

        expect(find.byType(CircularProgressIndicator), findsOneWidget);
      });

      testWidgets('Color', (tester) async {
        await _pumpLoadingWidget(tester, color: ColorsFoundation.error);

        final indicator = tester.widget<CircularProgressIndicator>(find.byType(CircularProgressIndicator));

        expect(indicator.color, ColorsFoundation.error);
      });

      testWidgets('Null color', (tester) async {
        await _pumpLoadingWidget(tester);

        final indicator = tester.widget<CircularProgressIndicator>(
          find.byType(CircularProgressIndicator),
        );

        expect(indicator.color, isNull);
      });
    },
  );
}
