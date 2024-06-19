import 'package:bmi_design/core/utils/extension.dart';
import 'package:flutter/material.dart';

import 'weight_painter.dart';

class BuildWeightDesign extends StatefulWidget {
  const BuildWeightDesign({super.key});

  @override
  State<BuildWeightDesign> createState() => _BuildWeightDesignState();
}

class _BuildWeightDesignState extends State<BuildWeightDesign> {
  @override
  Widget build(BuildContext context) {
    return Align(
      child: Container(
        width: context.width * 0.8,
        height: context.height * 0.38,
        color: Colors.transparent,
        child: CustomPaint(
          painter: WeightPainter(),
        ),
      ),
    );
  }
}
