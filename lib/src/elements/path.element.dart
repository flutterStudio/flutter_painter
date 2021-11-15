import 'dart:ui';

import 'package:flutter_painter/src/callback/single_point.callback.dart';
import 'package:flutter_painter/src/elements/base.element.dart';

class PathElement extends BaseElement with SinglePointCallBack {
  PathElement(int id, List<Offset> points, Paint paint)
      : super(id, points, paint) {
    _generatePaths(points);
  }
  late Path _path;
  late Rect? _boundries;

  Path? _boundriesPath;

  Path get path => _path;
  Path? get boundries => _boundriesPath;

  /// Generate path for the element's points
  void _generatePaths(List<Offset> points) {
    _path = Path();
    _path.addPolygon(points, true);
    _boundries = _path.getBounds();
  }

  @override
  void onClickDown(Offset position) {}

  @override
  void onClickUp(Offset position) {
    _boundries = path.getBounds();
    _boundriesPath = Path()..addRect(path.getBounds());
  }

  @override
  void onDoubleClick(Offset position) {}

  @override
  void onLongPress(Offset position) {}

  @override
  void onHover(Offset position) {
    _boundries = path.getBounds();
    _boundriesPath = Path()..addRect(path.getBounds());
  }
}
