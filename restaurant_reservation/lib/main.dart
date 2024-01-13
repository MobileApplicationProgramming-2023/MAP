import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'view/account_details.dart';
import 'view/restaurant_list_page.dart';
import 'view/feedback_page.dart';
import 'view/login_page.dart';
import 'view/welcome_page.dart';
import 'viewmodel/welcome_viewmodel.dart';
import 'view/feedback_success_page.dart';
import 'view/reserve_table_page.dart';
import 'view/reservation_success_alert.dart';
import 'view/credit_card_payment.dart';
import 'view/owner_request_list.dart';
import 'view/restaurant_profile.dart';
import 'view/signup_page.dart';
import 'viewmodel/feedback_success_viewmodel.dart';
import 'viewmodel/restaurant_profile_viewmodel.dart';
import 'model/restaurant_profile_model.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final welcomeViewModel = WelcomeViewModel(context);
    final restaurantProfileViewModel = RestaurantProfileViewModel(model: RestaurantProfileModel(name: '', information: ''));
    

    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/login': (context) => SignInPage(),
        '/signup': (context) => SignUpPage(),
        '/restaurantList': (context) => RestaurantListPage(),
        '/feedback': (context) => FeedbackPage(),
        '/feedbackSuccess': (context) => FeedbackSuccessPage(viewModel: FeedbackSuccessViewModel()),
        '/accountDetails': (context) => AccountDetailsPage(),
        '/reserveTable': (context) => ReserveTablePage(),
        '/reservationSuccess': (context) => ReservationSuccessPage(),
        '/creditCardPayment': (context) => CreditCardPaymentPage(),
        '/ownerRequestList': (context) => OwnerRequestListPage(),
        '/restaurantProfilePage': (context) => RestaurantProfilePage(viewModel: restaurantProfileViewModel),
        
      },
      debugShowCheckedModeBanner: false,
      home: WelcomePage(viewModel: welcomeViewModel),
    );
  }
}
