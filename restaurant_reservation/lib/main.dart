import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_reservation/firebase_options.dart';
import 'package:restaurant_reservation/viewmodel/feedback_page_viewmodel.dart';
import 'view/account_details.dart';
import 'view/restaurant_list_page.dart';
import 'view/feedback_page.dart';
import 'view/login_page.dart';
import 'view/welcome_page.dart';
import 'viewmodel/credit_card_viewmodel.dart';
import 'viewmodel/login_viewmodel.dart';
import 'viewmodel/owner_request_list_viewmodel.dart';
import 'viewmodel/reservation_success_viewmodel.dart';
import 'viewmodel/reserve_table_viewmodel.dart';
import 'viewmodel/restaurant_list_viewmodel.dart';
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
import 'model/restaurant.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_reservation/viewmodel/signup_viewmodel.dart';
import 'package:restaurant_reservation/viewmodel/account_details_viewmodel.dart';
import '../model/Customer.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final welcomeViewModel = WelcomeViewModel(context);
    final restaurantProfileViewModel = RestaurantProfileViewModel(model: Restaurant(id: '', name: '', logo:'', desc: '', role: ''));
final customer = Customer(
      id: '1', 
      name: 'John Doe',
      phoneNumber: '123-456-7890',
      pastReserve: ['Reservation 1', 'Reservation 2'],
      username: 'john_doe',
      password: 'password123',
      email: 'john@example.com',
    );
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) =>SignUpViewModel()),
        ChangeNotifierProvider(create: (_)=> SignInViewModel()),
        ChangeNotifierProvider(create: (_)=> CustomerViewModel(customer: customer)),
        ChangeNotifierProvider(create: (_)=> CreditCardViewModel()),
        ChangeNotifierProvider(create: (_)=> FeedbackSuccessViewModel()),
        ChangeNotifierProvider(create: (_)=> OwnerRequestListViewModel()),
        ChangeNotifierProvider(create: (_)=> ReservationSuccessViewModel()),
        ChangeNotifierProvider(create: (_)=> ReserveTableViewModel()),
        ChangeNotifierProvider(create: (_)=> RestaurantListViewModel()),
        ChangeNotifierProvider(create: (_)=> RestaurantProfileViewModel(model: Restaurant(id: '', name: '', logo: '', desc: '', role: ''))),
        ChangeNotifierProvider(create: (_)=> FeedbackViewModel()),
      ],
      child: MaterialApp( initialRoute: '/',
      routes: {
        '/signup': (context) => SignUpPage(),
        '/restaurantList': (context) => RestaurantListPage(),
        '/feedback': (context) => FeedbackPage(),
        '/feedbackSuccess': (context) => FeedbackSuccessPage(viewModel: FeedbackSuccessViewModel()),
        '/accountDetails': (context) => AccountDetailsPage(),
        '/reserveTable': (context) => ReserveTablePage(),
        '/reservationSuccess': (context) => ReservationSuccessPage(),
        '/creditCardPayment': (context) => CreditCardPaymentPage(),
        '/ownerRequestList': (context) => OwnerRequestListPage(),
        '/restaurantProfilePage': (context) => RestaurantProfilePage(viewModel: restaurantProfileViewModel, restaurantId: '',),
        
      },
      debugShowCheckedModeBanner: false,
      home: WelcomePage(viewModel: welcomeViewModel),
    )
    );
  }
}
