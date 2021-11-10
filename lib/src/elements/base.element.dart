import 'dart:ui';

import 'package:flutter/cupertino.dart';

class BaseElement {
  int id;
  final Paint paint;
  // Points
  final List<Offset> points;

  late Vertices _vertices;

  Vertices get vertices => _vertices;

  final VertexMode _vertexMode;
  VertexMode get vertexMode => _vertexMode;

  BaseElement(this.id, this.points, this.paint,
      {VertexMode vertexMode = VertexMode.triangleFan,
      bool useVertices = false})
      : _vertexMode = vertexMode {
    if (useVertices) _generateVertices(points);
  }

  /// Generate vertices for the element's points
  void _generateVertices(List<Offset> points) {
    _vertices = Vertices(_vertexMode, points);
  }
}
