import 'package:bmi_design/core/utils/extension.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/colors.dart';
import '../../../widget/number_slider.dart';
import 'weight_design.dart';

class BuildBottomSection extends StatefulWidget {
  const BuildBottomSection({super.key});

  @override
  State<BuildBottomSection> createState() => _BuildBottomSectionState();
}

class _BuildBottomSectionState extends State<BuildBottomSection> {
  int age = 50;
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
                      value: age,
                      onChanged: (val) => setState(() => age = val),
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
        const Expanded(flex: 3, child: BuildWeightDesign()),
        Container(
          height: context.height * 0.1,
          width: context.width,
          color: Colors.transparent,
          child: Center(
            child: SizedBox(
              height: context.height * 0.065,
              child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.blueColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      )),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Next',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      )
                    ],
                  )),
            ),
          ),
        ),
      ],
    );
  }
}
