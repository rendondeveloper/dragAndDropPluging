import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

///WidgetDragAndDropLayer Is a widget that allows you to have a floating widget 
///that can be dragged across the screen
class WidgetDragAndDropLayer extends StatefulWidget {

  ///Constructor de WidgetDragAndDropLayer
  const WidgetDragAndDropLayer({
    super.key,    
    this.floatingFullScreen = false,
    this.floatingVisible = false,
    this.floatingWidget,
    this.content,
  });

  ///Widget floating
  final Widget? floatingWidget;

  ///Content of screen)
  final Widget? content;

  ///Indicates whether the floating widget takes up the entire screen
  final bool floatingFullScreen;

  ///Indicates whether the floating widget is visible
  final bool floatingVisible;

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

    return SizedBox(
      height: screenSize.height,
      width: screenSize.width,
      child: Stack(
        children: [
          // Widget que cubre toda la pantalla
          Positioned.fill(
            child: GestureDetector(
              behavior: HitTestBehavior.deferToChild,
              child: widget
                  .content, // Vacío para que detecte gestos en toda la pantalla
            ),
          ),
          // Widget flotante
          Positioned(
            left: widget.floatingFullScreen ? _offsetZero.dx : _offset.dx,
            top: widget.floatingFullScreen ? _offsetZero.dy : _offset.dy,
            child: GestureDetector(
              onPanUpdate: widget.floatingFullScreen
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
                visible: widget.floatingVisible,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  height: widget.floatingFullScreen ? screenSize.height : null,
                  width: widget.floatingFullScreen ? screenSize.width : null,
                  child: widget.floatingWidget,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
