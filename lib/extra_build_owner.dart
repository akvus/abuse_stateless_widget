import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final size = measureWidget(const SizedBox(width: 640, height: 480));

  // Just displays the size calculated above.
  runApp(
    WidgetsApp(
      title: 'BuildOwner Sample',
      color: const Color(0xff000000),
      builder: (BuildContext context, Widget? child) {
        return Scaffold(
          body: Center(
            child: Text(size.toString()),
          ),
        );
      },
    ),
  );
}

Size measureWidget(Widget widget) {
  final pipelineOwner = PipelineOwner();
  final rootView = pipelineOwner.rootNode = MeasurementView();
  final buildOwner = BuildOwner(focusManager: FocusManager());

  final element = RenderObjectToWidgetAdapter<RenderBox>(
    container: rootView,
    debugShortDescription: '[root]',
    child: widget,
  ).attachToRenderTree(buildOwner);

  try {
    rootView.scheduleInitialLayout();
    pipelineOwner.flushLayout();

    return rootView.size;
  } finally {
    // Clean up.
    element.update(RenderObjectToWidgetAdapter<RenderBox>(container: rootView));
    buildOwner.finalizeTree();
  }
}

class MeasurementView extends RenderBox
    with RenderObjectWithChildMixin<RenderBox> {
  @override
  void performLayout() {
    assert(child != null);

    child!.layout(const BoxConstraints(), parentUsesSize: true);
    size = child!.size;
  }

  @override
  void debugAssertDoesMeetConstraints() => true;
}
