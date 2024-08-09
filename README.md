[![style: very good analysis](https://img.shields.io/badge/style-very_good_analysis-B22C89.svg)](https://pub.dev/packages/very_good_analysis)

<a href="https://codecov.io/gh/rendondeveloper/dragAndDropPluging" >
<img src="https://codecov.io/gh/rendondeveloper/dragAndDropPluging/graph/badge.svg?token=R53K3SBE30"/>
</a>

<h1 class="hash-header">Widget Drag And Drop Layer</h1>
</br>
<p>Allow show y/o hidden a widget floating over the screen also expand this widget in fullscreen.</p>


<p>Get Starting</p>
<pre>
<code class="language-xml hljs" data-highlighted="yes" >          
drag_and_drop_pluging: ^0.0.5
</code>
</pre>

</br>
<p>Example</p>
<img src="https://github.com/user-attachments/assets/08e08a9d-1b38-4a50-86f6-bfad3b82d555" width="300"/>


<p>Example code</p>
<pre>
<code class="language-xml hljs" data-highlighted="yes" >    
WidgetDragAndDropLayer(
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
      )
</code>
</pre>

<p>Properties</p>
<lis>
      <li>floatingFullScreen : Expand or containt the widget fullscreen</li>
      <li>floatingVisible : Show or hidden widget</li>
      <li>floatingWidget : Floating widget</li>      
</lis>