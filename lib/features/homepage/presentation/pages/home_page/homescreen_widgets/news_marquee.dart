import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';

class NewsMarquee extends StatelessWidget {
  NewsMarquee({super.key});
  final List<String> newsHeadlines = [
    'Breaking News: Palpa is great!',
    'Palpa is famous for Karuwa',
    'This is epalika first version',
    'People of palpa are very friendly',
  ];

  @override
  Widget build(BuildContext context) {
    return Marquee(
      text: newsHeadlines.join('   |   '), // Combine headlines with a separator
      style: TextStyle(fontSize: 16.0),
      scrollAxis: Axis.horizontal,
      crossAxisAlignment: CrossAxisAlignment.center,

      blankSpace: 20.0, // Adjust the blank space between repetitions
      velocity: 30.0, // Adjust the scrolling speed
      pauseAfterRound: Duration(seconds: 1), // Pause after each round
      startPadding: 10.0, // Initial padding before scrolling starts
    );
  }
}
