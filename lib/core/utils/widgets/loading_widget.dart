import 'package:flutter/material.dart';
import 'package:plants_project/core/utils/colors/colors.dart';

class LoadingWidget extends StatelessWidget {
  final Color color;
  const LoadingWidget({super.key, this.color = primary});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 16),
      child: Center(
        child: CircularProgressIndicator(color: color),
      ),
    );
  }
}
