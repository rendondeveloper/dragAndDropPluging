import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'widget_home.dart';

void main() {
  group('Test widget main', () {
    testWidgets('testing show button', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: HomePage(),
        ),
      );

      final widget = find.byElementPredicate((predicate) {
        return predicate.widget is FloatingActionButton &&
            (predicate.widget as FloatingActionButton).heroTag == 'showWidget';
      });

      expect(widget, findsOne);

      await tester.tap(find.byWidget(
        widget.found.single.widget,
        ),
      );

      await tester.pumpAndSettle();

      expect(find.byType(ElevatedButton), findsWidgets);
    });

    testWidgets('testing show button and hidden button', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: HomePage(),
        ),
      );

      final widget = find.byElementPredicate((predicate) {
        return predicate.widget is FloatingActionButton &&
            (predicate.widget as FloatingActionButton).heroTag == 'showWidget';
      });

      expect(widget, findsOne);

      await tester.tap(find.byWidget(
        widget.found.single.widget,
        ),
      );

      await tester.pumpAndSettle();

      expect(find.byType(ElevatedButton), findsWidgets);

      await tester.tap(find.byWidget(
        widget.found.single.widget,
        ),
      );

      await tester.pumpAndSettle();

      expect(find.byType(ElevatedButton), findsNothing);
    });

    testWidgets('testing show button and move', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: HomePage(),
        ),
      );

      final widget = find.byElementPredicate((predicate) {
        return predicate.widget is FloatingActionButton &&
            (predicate.widget as FloatingActionButton).heroTag == 'showWidget';
      });

      expect(widget, findsOne);

      await tester.tap(find.byWidget(
        widget.found.single.widget,
        ),
      );

      await tester.pumpAndSettle();

      final widgetsElevation = find.byType(ElevatedButton);

      expect(widgetsElevation, findsWidgets);

      await tester.drag(
        find.byWidget(
          widgetsElevation.found.first.widget,
        ),
        const Offset(500, 500),
      );

      await tester.pumpAndSettle();
    });

    testWidgets('testing show full screen', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: HomePage(),
        ),
      );

      final widgetShow = find.byElementPredicate((predicate) {
        return predicate.widget is FloatingActionButton &&
            (predicate.widget as FloatingActionButton).heroTag == 'showWidget';
      });

      expect(widgetShow, findsOne);

      await tester.tap(find.byWidget(
        widgetShow.found.single.widget,
        ),
      );

      await tester.pumpAndSettle();

      final widgetFullScreen = find.byElementPredicate((predicate) {
        return predicate.widget is FloatingActionButton &&
            (predicate.widget as FloatingActionButton).heroTag ==
                'showFullScreen';
      });

      expect(widgetFullScreen, findsOne);

      await tester.tap(find.byWidget(
        widgetFullScreen.found.single.widget,
        ),
      );

      await tester.pumpAndSettle();
    });
  });
}
