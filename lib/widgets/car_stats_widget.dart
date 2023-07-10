import 'package:flutter/material.dart';

class CarStatsWidget extends StatelessWidget {
  const CarStatsWidget({
    super.key,
    required this.statTitle,
    required this.statValue,
    required this.showBorder,
  });

  final String statTitle;
  final String statValue;
  final bool showBorder;

  @override
  Widget build(BuildContext context) {
    var themeData = Theme.of(context);
    return Container(
      height: 66,
      // padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      decoration: BoxDecoration(
        border: showBorder
            ? Border(
                right: BorderSide(color: Colors.grey.shade400),
              )
            : null,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            statTitle,
            style: themeData.textTheme.bodyMedium!.copyWith(
              color: Colors.grey.shade400,
            ),
          ),
          Text(
            statValue,
            style: themeData.textTheme.bodyLarge!.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.grey.shade700,
            ),
          ),
          const SizedBox(height: 4)
        ],
      ),
    );
  }
}
