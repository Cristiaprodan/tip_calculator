import 'package:flutter/material.dart';

class TipSlider extends StatelessWidget {
  const TipSlider({
    super.key,
    required double tipPercentege,
    required this.onChanged,
  }) : _tipPercentege = tipPercentege;

  final double _tipPercentege;
  final ValueChanged<double> onChanged;

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: _tipPercentege,
      onChanged: onChanged,
      // onChanged: (value) => {
      // setState(() {
      //   _tipPercentege = value;
      // })
      // },
      min: 0.0,
      max: 0.5,
      divisions: 5,
      label: '${(_tipPercentege * 100).round()}%',
    );
  }
}
