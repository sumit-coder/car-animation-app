import 'package:flutter/material.dart';

import 'car_stats_widget.dart';

class CardInfoWidget extends StatelessWidget {
  const CardInfoWidget({
    super.key,
    required this.carName,
    required this.year,
    required this.hp,
    required this.speed,
  });
  final String carName;
  final String year;
  final String hp;
  final String speed;

  @override
  Widget build(BuildContext context) {
    return Container(
      // clipBehavior: Clip.antiAlias,
      height: 100,
      margin: const EdgeInsets.all(12),
      // padding: EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        // borderRadius: BorderRadius.circular(24),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
        // boxShadow: cardShadow,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            spreadRadius: 0.5,
            blurRadius: 0.5,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                // color: Colors.red,
                border: Border(
                  right: BorderSide(color: Colors.grey.shade400),
                ),
              ),
              child: Center(
                child: Text(
                  'Porsche ' + carName,
                  maxLines: 1,
                  style: const TextStyle(color: Colors.black54, fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          const SizedBox(height: 4),
          Divider(height: 1, thickness: 1, color: Colors.grey.shade400),
          // Text(
          //   listOfData[index]['name'],
          // ),
          Container(
            // height: 100,
            width: double.maxFinite,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: CarStatsWidget(
                    statTitle: 'Year',
                    statValue: year,
                    showBorder: true,
                  ),
                ),
                Expanded(
                  child: CarStatsWidget(
                    statTitle: 'HP',
                    statValue: hp,
                    showBorder: true,
                  ),
                ),
                Expanded(
                  child: CarStatsWidget(
                    statTitle: 'Speed',
                    statValue: speed,
                    showBorder: false,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
