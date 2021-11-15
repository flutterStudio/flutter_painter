import 'package:flutter/cupertino.dart';

abstract class SinglePointCallBack {
  void onClickDown(Offset position);
  void onClickUp(Offset position);
  void onLongPress(Offset position);
  void onDoubleClick(Offset position);
  void onHover(Offset position);
}
