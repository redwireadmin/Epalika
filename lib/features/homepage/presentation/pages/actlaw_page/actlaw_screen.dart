import 'package:e_palika/config/themes/colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ActLawPage extends StatelessWidget {
  ActLawPage({super.key});
  List<String> actLaw = [
    'ActLaw1',
    'ActLaw2',
    'ActLaw3',
    'ActLaw4',
    'ActLaw5',
    'ActLaw6',
    'ActLaw7',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.primaryColor,
      appBar: AppBar(title: Text("Act Law")),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              CustomColors.primaryColor1,
              CustomColors.primaryColor,
            ],
          ),
        ),
        child: ListView(
            children: actLaw
                .map((e) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        child: ExpansionTile(
                          title: Text(e),
                          children: [
                            Divider(height: 1),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 20, left: 20, bottom: 20, right: 20),
                              child: Text(
                                  'These acts are legal instruments that codify rules, regulations, and statutes enacted by a legislative body. Each act typically focuses on a specific area of law or addresses a particular legal issue.'),
                            ),
                          ],
                        ),
                      ),
                    ))
                .toList()),
      ),
    );
  }
}
