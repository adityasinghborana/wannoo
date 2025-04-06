import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wannoo/category_places/presentation_layer/filters_controller.dart';

class FilterSlider extends StatefulWidget {
  final int max;
  final int min;

  const FilterSlider({super.key, required this.min, required this.max});

  @override
  State<FilterSlider> createState() => _FilterSliderState();
}

class _FilterSliderState extends State<FilterSlider> {
  late double _currentValue;

  @override
  void initState() {
    super.initState();
    _currentValue = widget.min.toDouble();
  }

  @override
  Widget build(BuildContext context) {
    final FiltersController filtersController = Get.find();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            showValueIndicator: ShowValueIndicator.always,
            valueIndicatorShape: const PaddleSliderValueIndicatorShape(),
            valueIndicatorTextStyle: const TextStyle(
              color: Colors.white,
            ),
          ),
          child: Slider(
            value: _currentValue,
            min: widget.min.toDouble(),
            max: widget.max.toDouble() + 10,
            label: _currentValue.round().toString(),
            onChanged: (value) {
              filtersController.budget.value = value;
              setState(() {
                _currentValue = value;
              });
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('${widget.min}', style: const TextStyle(fontSize: 14)),
              Text('${widget.max + 10}', style: const TextStyle(fontSize: 14)),
            ],
          ),
        ),
      ],
    );
  }
}
