import 'dart:ui';

import 'package:flutter/cupertino.dart';

class BaseElement {
  int id;
  final Paint paint;
  // Points
  final List<Offset> points;
  final List<Offset>? bounds;

  late Vertices _vertices;
  Vertices get vertices => _vertices;

  final VertexMode _vertexMode;

  BaseElement(this.id, this.points, this.paint,
      {this.bounds, VertexMode vertexMode = VertexMode.triangleStrip})
      : _vertexMode = vertexMode {
    _generateVertices(points);
  }

  void _generateVertices(List<Offset> points) {
    _vertices = Vertices(_vertexMode, points);
  }
}
