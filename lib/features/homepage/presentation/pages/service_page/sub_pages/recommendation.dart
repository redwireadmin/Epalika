import 'package:flutter/material.dart';

// ignore: must_be_immutable
class RecommendationService extends StatelessWidget {
  RecommendationService({super.key});
  List<String> recommendationServices = [
    'RecommendationService1',
    'RecommendationService2',
    'RecommendationService3',
    'RecommendationService4',
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
          children: recommendationServices
              .map((e) => Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: Card(
                      child: ExpansionTile(
                        title: Text(e),
                        childrenPadding: EdgeInsets.all(10),
                        children: [
                          Divider(height: 1),
                          Text(
                              'Recommendation is a procedure where individuals provide information to create an account or become a member of a system, service, or organization. This process is commonly used in various contexts, such as online platforms, events, educational institutions, and more. The goal of registration is to collect essential information about users, enabling the system or organization to identify and communicate with them effectively.'),
                        ],
                      ),
                    ),
                  ))
              .toList()),
    );
  }
}
