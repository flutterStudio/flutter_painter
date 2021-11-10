import 'dart:ui';

import 'package:flutter/cupertino.dart';

class BaseElement {
  int id;
  final Paint paint;
  // Points
  final List<Offset> points;
  final List<Offset>? bounds;

  late Vertices _vertices;
  late Path _path;

  Vertices get vertices => _vertices;
  Path get path => _path;

  final VertexMode _vertexMode;
  VertexMode get vertexMode => _vertexMode;

  BaseElement(this.id, this.points, this.paint,
      {this.bounds, VertexMode vertexMode = VertexMode.triangleFan})
      : _vertexMode = vertexMode {
    _generateVertices(points);
    _generatePaths(points);
  }

  /// Generate vertices for the element's points
  void _generateVertices(List<Offset> points) {
    _vertices = Vertices(_vertexMode, points);
  }

  /// Generate path for the element's points
  void _generatePaths(List<Offset> points) {
    _path = Path();
    _path.addPolygon(points, true);
  }
}
