import 'package:bmi_design/core/utils/extension.dart';
import 'package:bmi_design/features/presentation/widget/number_slider.dart';
import 'package:flutter/material.dart';

import 'weight_painter.dart';

class BuildWeightDesign extends StatefulWidget {
  const BuildWeightDesign({super.key});

  @override
  State<BuildWeightDesign> createState() => _BuildWeightDesignState();
}

class _BuildWeightDesignState extends State<BuildWeightDesign> {
  ScrollController scrollController = ScrollController();
  int weight = 50;
  @override
  Widget build(BuildContext context) {
    return Align(
      child: Container(
        width: context.width * 0.8,
        height: context.height * 0.38,
        color: Colors.transparent,
        child: Stack(
          children: [
            CustomPaint(
              painter: WeightPainter(
                value: weight
              ),
              size: Size(
                context.width * 0.8,
                context.height * 0.38,
              ),
            ),
            Positioned(
              top: 15,
              left: 0,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(200),
                  topRight: Radius.circular(200),
                ),
                child: Container(
                  height: context.height * 0.08,
                  width: context.width * 0.8,
                  color: Colors.transparent,
                  child: NumberSlider(
                      maxValue: 130,
                      minValue: 10,
                      selectedFontSize: 35,
                      unSelectedFontSize: 20,
                      width: context.width * 0.8,
                      value: weight,
                      onChanged: (val) => setState(() => weight = val),
                      scrollController: scrollController),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
