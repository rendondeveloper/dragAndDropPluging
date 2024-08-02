Creating package to show floating widget and allow see in full screen the same widget.

## Features

Example the project

<img src="https://github.com/user-attachments/assets/08e08a9d-1b38-4a50-86f6-bfad3b82d555" width="300"/>

## Getting started

You need add :  ```drag_and_drop_pluging: ^0.0.1```

## Usage

Example of implementation

```dart
Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            heroTag: "showWidget",
            child: Icon(isVisibleButton
                ? Icons.visibility_off
                : Icons.visibility),
            onPressed: () {
              setState(() {
                isVisibleButton = !isVisibleButton;
              });
            },
          ),
        ],
      ),
      appBar: AppBar(
        title: const Text("Example"),
      ),
      body: WidgetDraggableLayer(
        floatingFullScreen: isFullScreen,
        floatingVisible: isVisibleButton,
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
      ),
    );
```

## Additional information
You can find all code in this [repository](https://github.com/rendondeveloper/dragAndDropPluging).
