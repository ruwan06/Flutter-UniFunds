import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Background extends StatelessWidget {
  const Background({super.key});

  @override
  Widget build(Object context) {
    return Positioned.fill(
      child: SvgPicture.asset(
        'assets/Background.svg',
        fit: BoxFit.fill,
      ),
    );
  }
}
