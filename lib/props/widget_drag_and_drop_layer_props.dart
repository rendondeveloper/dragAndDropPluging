import 'package:flutter/material.dart';

///WidgetDragAndDropLayer Is a widget that allows you to have a floating widget
class WidgetDragAndDropLayerProps {
  
  ///Constructor de WidgetDragAndDropLayer
  WidgetDragAndDropLayerProps({
    required this.floatingWidget,
    required this.content,
    required this.floatingFullScreen,
    required this.floatingVisible,
  });

  ///Widget floating
  final Widget? floatingWidget;

  ///Content of screen
  final Widget? content;

  ///Indicates whether the floating widget takes up the entire screen
  final bool floatingFullScreen;

  ///Indicates whether the floating widget is visible
  final bool floatingVisible;
}
