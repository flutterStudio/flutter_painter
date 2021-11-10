import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_painter/src/controller/canvas.controller.dart';
import 'package:flutter_painter/src/elements/base.element.dart';

class DrawCanvas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<BaseElement>>(
      builder: (context, snapshot) => CustomPaint(
        isComplex: true,
        painter: LayerPainter(elements: snapshot.data),
      ),
      stream: CanvasController.instance().elementsStream,
    );
  }
}

class LayerPainter extends CustomPainter {
  List<BaseElement>? elements;

  LayerPainter({this.elements});

  @override
  void paint(Canvas canvas, Size size) {
    for (BaseElement element in elements!) {
      canvas.drawVertices(element.vertices, BlendMode.color, element.paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
