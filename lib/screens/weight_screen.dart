import 'package:flutter/material.dart';

import 'weight_slider.dart';

const Color backgroundColor = Color.fromRGBO(54, 52, 80, 1);
const Color darkBackgroundColor = Color.fromRGBO(34, 33, 57, 1);
const Color blueColor = Color.fromRGBO(101, 85, 226, 1);
const Color lightBlueColor = Color.fromRGBO(146, 132, 250, 1);

class BMIWeightScreen extends StatefulWidget {
  const BMIWeightScreen({super.key});

  @override
  State<BMIWeightScreen> createState() => _BMIWeightScreenState();
}

class _BMIWeightScreenState extends State<BMIWeightScreen> {
  int weight = 50;
  ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: buildTopSection(),
            ),
            Expanded(
              flex: 2,
              child: buildBottomSection(),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBottomSection() => Column(
        children: [
          Expanded(
              child: WeightSlider(
            scrollController: scrollController,
            maxValue: 130,
            minValue: 10,
            value: weight,
            onChanged: (val) => setState(() => weight = val),
            width: MediaQuery.of(context).size.width,
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

  Widget buildTopSection() => Column(
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
                                color: darkBackgroundColor,
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
                                color: darkBackgroundColor,
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
