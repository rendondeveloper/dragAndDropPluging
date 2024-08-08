import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:widget_drag_and_drop_layer/props/widget_drag_and_drop_layer_props.dart';
import 'package:widget_drag_and_drop_layer/widget_drag_and_drop_layer.dart';

void main() {
  testWidgets('Floating widget should be visible when floatingVisible is true',
      (WidgetTester tester) async {
    // Arrange
    final props = WidgetDragAndDropLayerProps(
      floatingWidget: Container(key: const Key('floatingWidget')),
      content: Container(),
      floatingFullScreen: false,
      floatingVisible: true,
    );

    // Act
    await tester.pumpWidget(
      MaterialApp(
        home: WidgetDragAndDropLayer(props: props),
      ),
    );

    // Assert
    expect(find.byKey(const Key('floatingWidget')), findsOneWidget);
  });

  testWidgets('Floating widget should be draggable',
      (WidgetTester tester) async {
    // Arrange
    final props = WidgetDragAndDropLayerProps(
      floatingWidget: Container(
        key: const Key('floatingWidget'),
        width: 50,
        height: 50,
        color: Colors.red,
      ),
      content: Container(),
      floatingFullScreen: false,
      floatingVisible: true,
    );

    // Act
    await tester.pumpWidget(
      MaterialApp(
        home: WidgetDragAndDropLayer(props: props),
      ),
    );

    final initialOffset =
        tester.getCenter(find.byKey(const Key('floatingWidget')));

    // Drag the floating widget
    await tester.drag(
      find.byKey(const Key('floatingWidget')),
      const Offset(100, 100),
    );
    await tester.pumpAndSettle();

    final newOffset = tester.getCenter(
      find.byKey(
        const Key('floatingWidget'),
      ),
    );

    // Assert
    expect(newOffset.dx, greaterThan(initialOffset.dx));
    expect(newOffset.dy, greaterThan(initialOffset.dy));
  });

  testWidgets(
      'Floating widget should take full screen when floatingFullScreen is true',
      (WidgetTester tester) async {
    // Arrange
    const screenSize = Size(800, 600);
    final props = WidgetDragAndDropLayerProps(
      floatingWidget:
          Container(key: const Key('floatingWidget'), color: Colors.red),
      content: Container(),
      floatingFullScreen: true,
      floatingVisible: true,
    );

    // Act
    await tester.pumpWidget(
      MaterialApp(
        home: SizedBox(
          width: screenSize.width,
          height: screenSize.height,
          child: WidgetDragAndDropLayer(props: props),
        ),
      ),
    );
    await tester.pumpAndSettle();

    // Assert
    final floatingWidgetSize = tester.getSize(
      find.byKey(
        const Key('floatingWidget'),
      ),
    );
    expect(floatingWidgetSize.width, screenSize.width);
    expect(floatingWidgetSize.height, screenSize.height);
  });
}
