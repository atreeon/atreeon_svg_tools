// ignore_for_file: avoid_print

import 'package:path_parsing/path_parsing.dart';

/// versionfuture: this isn't used

/// A [PathProxy] that dumps Flutter `Path` commands to the console.
class PathPrinter extends PathProxy {
  @override
  void close() {
    print('Path.close();');
  }

  @override
  void cubicTo(
      double x1,
      double y1,
      double x2,
      double y2,
      double x3,
      double y3,
      ) {
    print('Path.cubicTo($x1, $y1, $x2, $y2, $x3, $y3);');
  }

  @override
  void lineTo(double x, double y) {
    print('Path.lineTo($x, $y);');
  }

  @override
  void moveTo(double x, double y) {
    print('Path.moveTo($x, $y);');
  }
}