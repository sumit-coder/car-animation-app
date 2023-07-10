import 'package:card_swiper/card_swiper.dart';
import 'package:cars_by_porsche/utilities/fucntions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'data/cars_data.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    showBottomNavRail(false);
  }

  int activeIndex = 0;

  bool fromBack = false;
  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    var themeData = Theme.of(context);
    return Scaffold(
      backgroundColor: const Color(0xFFA7B4BE),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              color: Colors.grey,
              margin: const EdgeInsets.symmetric(vertical: 24),
              child: const Text(
                "Porsche Collection",
                // style: TextStyle(color: Colors.red, fontSize: 24),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
            ),
            Container(
              height: 450,
              width: double.maxFinite,
              child: Swiper(
                onIndexChanged: (value) {
                  if (value > activeIndex) {
                    _pageController.nextPage(duration: 400.ms, curve: Curves.decelerate);
                    fromBack = false;
                  }
                  if (value < activeIndex) {
                    _pageController.previousPage(duration: 400.ms, curve: Curves.decelerate);
                    fromBack = true;
                  }
                  activeIndex = value;
                  setState(() {});
                },
                itemBuilder: (BuildContext context, int index) {
                  return SwipeCard(
                    onTap: () {},
                    isActive: activeIndex == index,
                    fromBack: fromBack,
                    title: listOfData[index]['name'],
                    image: listOfData[index]['image'],
                  );
                },
                itemCount: listOfData.length,
                loop: false,
                index: 0,
                itemWidth: 324.0,
                itemHeight: 420,
                layout: SwiperLayout.STACK,
                physics: const BouncingScrollPhysics(),
              ),
            ),
            Container(
              height: 148,
              child: PageView.builder(
                itemCount: listOfData.length,
                controller: _pageController,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
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
                                'Porsche ' + listOfData[index]['name'],
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
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                child: CarStatsWidget(
                                  statTitle: 'Year',
                                  statValue: '2023',
                                  showBorder: true,
                                ),
                              ),
                              Expanded(
                                child: CarStatsWidget(
                                  statTitle: 'HP',
                                  statValue: '2010',
                                  showBorder: true,
                                ),
                              ),
                              Expanded(
                                child: CarStatsWidget(
                                  statTitle: 'Speed',
                                  statValue: '241',
                                  showBorder: false,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

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

class SwipeCard extends StatefulWidget {
  const SwipeCard({
    super.key,
    required this.title,
    required this.onTap,
    required this.image,
    required this.isActive,
    required this.fromBack,
  });
  final String title;
  final String image;
  final Function onTap;
  final bool isActive;
  final bool fromBack;

  @override
  State<SwipeCard> createState() => _SwipeCardState();
}

class _SwipeCardState extends State<SwipeCard> {
  bool isSwiped = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: const Color(0xFFDEDEDE),
        borderRadius: BorderRadius.circular(12),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(
            width: 350,
            height: 220,
            child: Visibility(
              visible: widget.isActive,
              child: Image.network(
                widget.image,
                fit: BoxFit.fitHeight,
              ),
            ),
          )
              .animate(target: widget.isActive ? 1 : 0)
              // car will come form left or right
              .moveX(begin: widget.fromBack ? -300 : 300, delay: 110.ms, duration: 250.ms, curve: Curves.easeOutCirc)
              .then(delay: 600.ms)
              // then move car forward
              .moveX(end: 100)
              .then()
              // then zoom in 2x
              .scaleXY(end: 2, delay: 200.ms, duration: 1000.ms)
              .then()
              // then move while zoomed in 2x
              .moveX(end: -400, duration: 2000.ms)
              .then()
              // then zoomed view end zoom out back to original size
              .scaleXY(end: 0.5, delay: 300.ms, duration: 500.ms)
              .then()
              .moveX(end: 100, duration: 1000.ms),
          Container(
            padding: const EdgeInsets.all(24),
            color: Colors.grey.shade100,
            width: double.maxFinite,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  maxLines: 1,
                  style: const TextStyle(color: Colors.black87, fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                const Text(
                  "\$2,00,000 and Above",
                  style: TextStyle(color: Colors.black54, fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
