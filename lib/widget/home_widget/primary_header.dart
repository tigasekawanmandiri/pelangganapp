import 'package:flutter/material.dart';
import 'package:giga_pelanggan/widget/home_widget/circular_container.dart';
import 'package:giga_pelanggan/widget/home_widget/curve_edge_widget.dart';

import '../../global/style.dart';

class GPrimaryHeader extends StatelessWidget {
  const GPrimaryHeader({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GCurvedEdgesWidget(
      child: Container(
        color: GColors.primaryColor,
        padding: const EdgeInsets.all(0),
        child: SizedBox(
          height: 300,
          child: Stack(
            children: [
              Positioned(
                  top: -150,
                  right: -250,
                  child: GCircularContainer(
                      backgroundColor: GColors.textWhite.withOpacity(0.1))),
              Positioned(
                  top: 50,
                  right: -350,
                  child: GCircularContainer(
                      backgroundColor: GColors.textWhite.withOpacity(0.1))),
            ],
          ),
        ),
      ),
    );
  }
}
