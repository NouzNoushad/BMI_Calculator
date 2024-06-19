import 'package:bmi_design/core/utils/extension.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/colors.dart';
import '../../../widget/number_slider.dart';

class BuildBottomSection extends StatefulWidget {
  const BuildBottomSection({super.key});

  @override
  State<BuildBottomSection> createState() => _BuildBottomSectionState();
}

class _BuildBottomSectionState extends State<BuildBottomSection> {
  int weight = 50;
  ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Expanded(
              child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: context.height * 0.08,
                  child: Stack(
                    children: [
                      Center(
                        child: Container(
                          height: context.height * 0.08,
                          width: context.height * 0.08,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              gradient: const LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    AppColors.blueColor,
                                    AppColors.lightBlueColor,
                                  ])),
                        ),
                      ),
                      NumberSlider(
                        scrollController: scrollController,
                        maxValue: 120,
                        minValue: 0,
                        value: weight,
                        onChanged: (val) => setState(() => weight = val),
                        width: MediaQuery.of(context).size.width,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  'Age',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          )),
          Expanded(
              flex: 3,
              child: Container(
                color: Colors.green,
              )),
          Container(
            height: MediaQuery.of(context).size.height * 0.1,
            color: Colors.red,
          ),
        ],
      );
  }
}