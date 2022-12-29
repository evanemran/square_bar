import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

import 'colors.dart';

class SquareBar extends StatefulWidget {
  const SquareBar({super.key, this.title = "Loading", this.size = 100, this.duration = const Duration(milliseconds: 500)});

  final String title;
  final double size;
  final Duration duration;

  @override
  State<SquareBar> createState() => _SquareBarState();
}

class _SquareBarState extends State<SquareBar> {

  List<Color> colors = [
    AppColors.g1,
    AppColors.g2,
    AppColors.g3,
    // AppColors.g4,
    // AppColors.g5,
  ];

  Timer? timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(widget.duration, (Timer t) => setState(() {

    }));
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Random random = Random();
    // getColor(int index) {
    //   if(index == 4) {
    //     return AppColors.g1;
    //   }
    //   else {
    //     return colors[random.nextInt(colors.length)];
    //   }
    // }

    return SizedBox(
      width: widget.size,
      height: widget.size,
      child: GridView.count(
        crossAxisCount: 3,
        crossAxisSpacing: 2.0,
        mainAxisSpacing: 2.0,
        childAspectRatio: 1,
        shrinkWrap: true,
        children: List.generate(9, (index) {
          return AnimatedContainer(
            color: colors[random.nextInt(colors.length)], duration: widget.duration,
          );
        }),),
    );
  }
}