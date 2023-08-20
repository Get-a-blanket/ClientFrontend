import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'dart:html';
// import 'package:flutter_html/flutter_html.dart';
// import 'package:html/parser.dart' as htmlparser;
// import 'package:html/dom.dart' as dom;


class MapWidget extends StatefulWidget {
  const MapWidget({super.key});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".
  @override
  State<MapWidget> createState() => _MapWidget();
}

class _MapWidget extends State<MapWidget> {
  String viewID = "map-widget";

  @override
  Widget build(BuildContext context) {
    // return Html(data: "<iframe "
    //   "width='${MediaQuery.of(context).size.width}' "
    //   "height='${MediaQuery.of(context).size.height}' "
    //   "src='/assets/map_widget.html' >"
    //   "</iframe>",
    // );
    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
        viewID,
        (int id) => IFrameElement()
          ..style.width = "100%"
          ..style.height = "100%"
          ..src = '/assets/assets/map_widget.html'
          ..style.border = 'none');
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: HtmlElementView(
        viewType: viewID,
      ),
    );
  }
}
