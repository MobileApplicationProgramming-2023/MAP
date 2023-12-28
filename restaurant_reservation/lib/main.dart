import 'package:flutter/material.dart';
import 'account_details.dart';
import 'signup_page.dart';
import 'restaurant_list_page.dart';
import 'feedback_page.dart';
import 'login_page.dart';
import 'welcomepage.dart';
import 'feedback_success_page.dart';
import 'reserve_table_page.dart';
import 'select_payment_method.dart';
import 'reservation_success_alert.dart';
import 'credit_card_payment.dart';
import 'owner_request_list.dart';
import 'restaurant_profile.dart';
import 'modification_success.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      initialRoute: '/',
      routes: {
        '/login': (context) => const SignInPage(),
        '/signup': (context) => const SignUpPage(),
        '/restaurantList': (context) => RestaurantListPage(),
        '/feedback': (context) => FeedbackPage(),
        '/feedbackSuccess': (context) => FeedbackSuccessPage(),
        '/accountDetails': (context) => AccountDetailsPage(),
        '/reserveTable': (context) => ReserveTablePage(),
        '/reservationSuccess': (context) => ReservationSuccessPage(),
        '/creditCardPayment': (context)=>CreditCardPaymentPage(),
        '/ownerRequestList': (context) => OwnerRequestListPage(),
        '/restaurantProfilePage' :(context) =>RestaurantProfilePage(),
        '/modificationSuccess':(context)=>ModificationSuccess(),
      },
      debugShowCheckedModeBanner: false,
      home: const WelcomePage(),
    );
  }
}
