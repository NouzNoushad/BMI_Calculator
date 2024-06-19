import 'package:flutter/material.dart';

import '../../../../../core/utils/colors.dart';

class BuildTopSection extends StatelessWidget {
  const BuildTopSection({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'BMI Calculator',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Expanded(
                      child: Column(
                    children: [
                      Expanded(
                          flex: 2,
                          child: Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: AppColors.darkBackgroundColor,
                                border:
                                    Border.all(width: 2, color: Colors.white30),
                              ),
                              child: Image.asset('assets/male_half_size.png'))),
                      const Expanded(
                          child: Center(
                              child: Text(
                        'Male',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      )))
                    ],
                  )),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: Column(
                    children: [
                      Expanded(
                          flex: 2,
                          child: Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: AppColors.darkBackgroundColor,
                                border:
                                    Border.all(width: 2, color: Colors.white30),
                              ),
                              child:
                                  Image.asset('assets/female_half_size.png'))),
                      const Expanded(
                          child: Center(
                              child: Text(
                        'Female',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      )))
                    ],
                  )),
                ],
              ),
            ),
          )
        ],
      );
  }
}