import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';

class NewsMarquee extends StatelessWidget {
  NewsMarquee({super.key});
  final List<String> newsHeadlines = [
    'अमलाबास बजार, छहरा बजार, जुठा बजार, म्यालढाप बजार।',
    'धार्मिक पर्यटन, पर्यापर्यटन, ग्रामिण पर्यटन, खेल पर्यटन, साहसिक पर्यटनको सम्भावना।',
    'कृषि, व्यापार र नोकरी रहेको। खासगरीकन व्यवसायिक रुपमा सुन्तला र टमाटर खेतीका लागि स्थानीय, राष्ट्रिय र अन्तर्राष्ट्रिय क्षेत्रमा प्रख्यात रहेको छ।',
    'क्षेत्री, ब्राह्मण, मगर, मिजार, परियार, विश्वकर्मा, कुमाल, नेवार आदि रहेका ।',
  ];

  @override
  Widget build(BuildContext context) {
    return Marquee(
      text: newsHeadlines.join('   |   '), // Combine headlines with a separator
      style: TextStyle(fontSize: 18.0),
      scrollAxis: Axis.horizontal,
      crossAxisAlignment: CrossAxisAlignment.center,

      blankSpace: 20.0, // Adjust the blank space between repetitions
      velocity: 30.0, // Adjust the scrolling speed
      pauseAfterRound: Duration(seconds: 1), // Pause after each round
      startPadding: 10.0, // Initial padding before scrolling starts
    );
  }
}
