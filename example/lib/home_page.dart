import 'package:flutter/material.dart';
import 'package:widget_drag_and_drop_layer/props/widget_drag_and_drop_layer_props.dart';
import 'package:widget_drag_and_drop_layer/widget_drag_and_drop_layer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isVisibleButton = false, isFullScreen = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            heroTag: "showWidget",
            child:
                Icon(isVisibleButton ? Icons.visibility_off : Icons.visibility),
            onPressed: () {
              setState(() {
                isVisibleButton = !isVisibleButton;
              });
            },
          ),
        ],
      ),
      appBar: AppBar(
        title: const Text("Hello"),
      ),
      body: WidgetDragAndDropLayer(
        props: WidgetDragAndDropLayerProps(
          floatingWidget: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(isFullScreen ? 0 : 16),
              color: Colors.red.shade200,
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isFullScreen = !isFullScreen;
                      });
                    },
                    child: const Text("Button Uno"),
                  ),
                ],
              ),
            ),
          ),
          content: Container(),
          floatingFullScreen: isFullScreen,
          floatingVisible: isVisibleButton,
        ),       
      ),
    );
  }
}
