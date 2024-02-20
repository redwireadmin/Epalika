import 'package:e_palika/config/themes/colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class RegistrationService extends StatelessWidget {
  RegistrationService({super.key});
  List<String> registrationServices = [
    'RegistrationService1',
    'RegistrationService2',
    'RegistrationService3',
    'RegistrationService4',
    'RegistrationService5',
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
          children: registrationServices
              .map((e) => Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: Container(
                      decoration: BoxDecoration(color: CustomColors.appWhite),
                      child: ExpansionTile(
                        title: Text(e),
                        childrenPadding: EdgeInsets.all(10),
                        children: [
                          Divider(height: 1),
                          Text(
                              'Registration is a procedure where individuals provide information to create an account or become a member of a system, service, or organization. This process is commonly used in various contexts, such as online platforms, events, educational institutions, and more. The goal of registration is to collect essential information about users, enabling the system or organization to identify and communicate with them effectively.'),
                        ],
                      ),
                    ),
                  ))
              .toList()),
    );
  }
}
