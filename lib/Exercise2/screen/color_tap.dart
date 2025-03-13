import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/color_counter.dart';
import '../widgets/color_tap.dart';

class ColorTapsScreen extends StatelessWidget {
  const ColorTapsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorCounters = Provider.of<ColorCounters>(context); 
    return Scaffold(
      appBar: AppBar(title: const Text('Color Taps')),
      body: Column(
        children: [
          ColorTap(type: CardType.red, tapCount: colorCounters.redTapCount, onTap: colorCounters.incrementRed),
          ColorTap(type: CardType.blue, tapCount: colorCounters.blueTapCount, onTap: colorCounters.incrementBlue),
        ],
      ),
    );
  }
}
