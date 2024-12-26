import 'package:flutter/material.dart';
import 'package:giga_pelanggan/widget/home_widget/curve_edge.dart';

class GCurvedEdgesWidget extends StatelessWidget {
  const GCurvedEdgesWidget({
    super.key,
    this.child,
  });

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(clipper: GCustomeCurvedEdges(), child: child);
  }
}
