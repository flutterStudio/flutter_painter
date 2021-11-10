import 'dart:ui';

import 'package:flutter_painter/src/elements/base.element.dart';

class PathElement extends BaseElement {
  PathElement(int id, List<Offset> points, Paint paint)
      : super(id, points, paint) {
    _generatePaths(points);
  }
  late Path _path;

  Path get path => _path;

  /// Generate path for the element's points
  void _generatePaths(List<Offset> points) {
    _path = Path();
    _path.addPolygon(points, true);
  }
}
