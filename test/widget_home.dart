import 'package:drag_and_drop_pluging/widget_draggable_layer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isVisibleButton = false;
  bool isFullScreen = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            heroTag: 'showWidget',
            child: Icon(isVisibleButton
                ? Icons.refresh
                : Icons.remove_from_queue_sharp,
            ),
            onPressed: () {
              setState(() {
                isVisibleButton = !isVisibleButton;
              });
            },
          ),
          FloatingActionButton(
            heroTag: 'showFullScreen',
            child: const Icon(Icons.fullscreen),
            onPressed: () {
              setState(() {
                isFullScreen = !isFullScreen;
              });
            },
          ),
        ],
      ),
      appBar: AppBar(
        title: const Text('Hello'),
      ),
      body: WidgetDraggableLayer(
        floatingFullScreen: isFullScreen,
        floatingVisible: isVisibleButton,
        floatingWidget: ColoredBox(
          color: Colors.red,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Button Uno'),
                ),
                const SizedBox(
                  height: 16,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Button dos'),
                ),
              ],
            ),
          ),
        ),
        content: Container(),
      ),
    );
  }
}
