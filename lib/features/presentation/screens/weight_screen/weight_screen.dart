import 'package:flutter/material.dart';

import '../../../../core/utils/colors.dart';
import 'components/bottom_section.dart';
import 'components/top_section.dart';

class BMIWeightScreen extends StatefulWidget {
  const BMIWeightScreen({super.key});

  @override
  State<BMIWeightScreen> createState() => _BMIWeightScreenState();
}

class _BMIWeightScreenState extends State<BMIWeightScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: BuildTopSection(),
            ),
            Expanded(
              flex: 2,
              child: BuildBottomSection(),
            ),
          ],
        ),
      ),
    );
  }
}
