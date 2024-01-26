import 'package:get/get_navigation/src/root/internacionalization.dart';

class Language extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'login': 'Login',
          'signup': 'Sign Up',
          'email/phone': 'Email / Phone Number',
          'password': 'Password',
          'name': 'Name',
          'email': 'Email Address',
          'phone': 'Phone Number',
          'birthday': 'Birthday',
          'alreadyHasAccount': 'Already have an account? ',
          'dontHaveAccount': 'Don\'t have an account? ',
          'forgotPassword': 'Forgot password?',
        },
        'np_NP': {
          'login': 'लग - इन',
          'signup': 'साइन अप',
          'email/phone': 'इमेल / फोन नम्बर',
          'password': 'पासवर्ड',
          'name': 'नाम',
          'email': 'इ - मेल',
          'phone': 'फोन नम्बर',
          'birthday': 'जन्मदिन',
          'alreadyHasAccount': 'पहिले नै खाता छ? ',
          'dontHaveAccount': 'खाता छैन? ',
          'forgotPassword': 'पासवर्ड भुल्नु भयो?',
        }
      };
}
