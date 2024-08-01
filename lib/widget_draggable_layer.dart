import 'package:flutter/material.dart';

class WidgetDraggableLayer extends StatefulWidget {
  final Widget floatingWidget;
  final Widget content;
  final bool floatingFullScreen;
  final bool floatingVisible;

  const WidgetDraggableLayer({
    super.key,
    required this.floatingWidget,
    required this.content,
    this.floatingFullScreen = false,
    this.floatingVisible = false,
  });

  @override
  createState() => _WidgetDraggableLayer();
}

class _WidgetDraggableLayer extends State<WidgetDraggableLayer> {
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
                    height:
                        widget.floatingFullScreen ? screenSize.height : null,
                    width: widget.floatingFullScreen ? screenSize.width : null,
                    child: widget.floatingWidget),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
