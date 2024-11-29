import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:widget_drag_and_drop_layer/props/widget_drag_and_drop_layer_props.dart';

///WidgetDragAndDropLayer Is a widget that allows you to have a floating widget
///that can be dragged across the screen
class WidgetDragAndDropLayer extends StatefulWidget {
  ///Constructor de WidgetDragAndDropLayer
  const WidgetDragAndDropLayer({super.key, this.props});

  ///WidgetDragAndDropLayerProps
  final WidgetDragAndDropLayerProps? props;

  @override
  WidgetDraggableLayerState createState() => WidgetDraggableLayerState();
}

///WidgetDraggableLayerState manages the status of WidgetDragAndDropLayer
class WidgetDraggableLayerState extends State<WidgetDragAndDropLayer> {
  Offset _offset = Offset.zero;
  final Offset _offsetZero = Offset.zero;


  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final widgetData = widget.props;
    return widgetData == null
        ? SizedBox(
            height: screenSize.height,
            width: screenSize.width,
          )
        : SizedBox(
      height: screenSize.height,
      width: screenSize.width,
      child: Stack(
        children: [
          // Widget que cubre toda la pantalla
          Positioned.fill(
            child: GestureDetector(
              behavior: HitTestBehavior.deferToChild,
                    child: widgetData.content ?? Container(),
            ),
          ),
          // Widget flotante
          Positioned(
                  left: widgetData.floatingFullScreen
                      ? _offsetZero.dx
                      : _offset.dx,
                  top: widgetData.floatingFullScreen
                      ? _offsetZero.dy
                      : _offset.dy,
            child: GestureDetector(
                    onPanUpdate: widgetData.floatingFullScreen
                  ? null
                  : (details) {
                      setState(() {
                        _offset = Offset(
                          _offset.dx + details.delta.dx,
                          _offset.dy + details.delta.dy,
                        );
                      });
                    },
              child: Visibility(
                      visible: widgetData.floatingVisible,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                        height: widgetData.floatingFullScreen
                            ? screenSize.height
                            : null,
                        width: widgetData.floatingFullScreen
                            ? screenSize.width
                            : null,
                        child: widgetData.floatingWidget,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
