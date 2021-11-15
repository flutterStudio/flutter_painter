import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_painter/src/elements/path.element.dart';

import '../elements/base.element.dart';

enum DrawMode { filled, stripped }

class CanvasController {
  static CanvasController _instance = CanvasController._internal();
  factory CanvasController.instance() => _instance;
  CanvasController._internal() {
    _elements = {};
    _elementsStream = StreamController();

    addElement(
        Colors.amber, [Offset(100, 100), Offset(200, 200), Offset(100, 150)],
        drawMode: DrawMode.stripped);
    addElement(
        Colors.red, [Offset(500, 100), Offset(100, 500), Offset(300, 150)]);
  }

  late StreamController<List<BaseElement>> _elementsStream;
  Stream<List<BaseElement>> get elementsStream => _elementsStream.stream;
  late Map<int, BaseElement> _elements;

  void handleClick(Offset position) {
    PathElement? clickedElement = _elements.values.firstWhere(
        (element) => element is PathElement && element.path.contains(position),
        orElse: null) as PathElement;

    clickedElement.onClickUp(position);
    _rebuild();
  }

  ///
  /// Create a simple element using a [color] and a list of [points].
  void addElement(Color color, List<Offset> points,
      {DrawMode drawMode = DrawMode.filled}) {
    int id = _generateId();
    BaseElement element = PathElement(
      id,
      points,
      Paint()..color = color,
    );
    _elements[id] = element;
    _elementsStream.sink.add(_elements.values.toList());
  }

  ///
  /// Generates a unique id for each element.
  int _generateId() {
    int id = 0;
    for (int i = 0; i <= _elements.length; i++) {
      if (_elements[i] == null) {
        id = i;
        break;
      }
    }
    return id;
  }

  /// Checks if the given point is inside any of the elements.
  ///
  /// ** return **
  ///   the element
  // BaseElement _belongsToElement(Offset point) {}

  void dispose() {
    _elementsStream.close();
  }

  void _rebuild() {
    _elementsStream.sink.add(_elements.values.toList());
  }
}
