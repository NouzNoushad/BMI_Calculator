import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class NumberSlider extends StatelessWidget {
  const NumberSlider({
    super.key,
    required this.maxValue,
    required this.minValue,
    required this.width,
    required this.value,
    required this.onChanged,
    required this.scrollController,
    this.selectedFontSize = 30,
    this.unSelectedFontSize = 18,
  });
  final int minValue;
  final int maxValue;
  final double width;
  final int value;
  final ValueChanged<int> onChanged;
  final ScrollController scrollController;
  final double selectedFontSize;
  final double unSelectedFontSize;

  double get itemExtent => width / 5;

  int _indexToValue(int index) => minValue + (index - 1);

  @override
  Widget build(BuildContext context) {
    int itemCount = (maxValue - minValue) + 3;
    return NotificationListener(
      onNotification: _onNotification,
      child: ListView.builder(
        controller: scrollController,
        scrollDirection: Axis.horizontal,
        itemExtent: itemExtent,
        itemCount: itemCount,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          final int itemValue = _indexToValue(index);
          bool isExtra = index == 0 || index == itemCount - 1;

          return isExtra
              ? const SizedBox.shrink()
              : GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () => _animateTo(itemValue, durationMillis: 50),
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      itemValue.toString(),
                      style: itemValue == value
                          ? TextStyle(
                              fontSize: selectedFontSize,
                              color: Colors.white,
                            )
                          : TextStyle(
                              fontSize: unSelectedFontSize,
                              color: Colors.white,
                            ),
                    ),
                  ),
                );
        },
      ),
    );
  }

  int _offsetToMiddleIndex(double offset) => (offset + width / 2) ~/ itemExtent;

  int _offsetToMiddleValue(double offset) {
    int indexOfMiddleElement = _offsetToMiddleIndex(offset);
    int middleValue = _indexToValue(indexOfMiddleElement);
    return middleValue;
  }

  bool _userStoppedScrolling(Notification notification) {
    return notification is UserScrollNotification &&
        notification.direction == ScrollDirection.idle &&
        // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
        scrollController.position.activity is! HoldScrollActivity;
  }

  _animateTo(int valueToSelect, {int durationMillis = 200}) {
    double targetExtent = (valueToSelect - (minValue + 1)) * itemExtent;
    scrollController.animateTo(
      targetExtent,
      duration: Duration(milliseconds: durationMillis),
      curve: Curves.decelerate,
    );
  }

  bool _onNotification(Notification notification) {
    if (notification is ScrollNotification) {
      int middleValue = _offsetToMiddleValue(notification.metrics.pixels);

      if (_userStoppedScrolling(notification)) {
        _animateTo(middleValue);
      }

      if (middleValue != value) {
        onChanged(middleValue);
      }
    }
    return true;
  }
}
