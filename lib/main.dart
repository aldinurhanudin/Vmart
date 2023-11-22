import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vmart/providers/providers.dart';
import 'package:vmart/ui/pages/home/education_page/education_page.dart';
import 'package:vmart/ui/pages/home/education_page/games/games.dart';
import 'package:vmart/ui/pages/home/education_page/quiz_page/quiz_page.dart';
import 'package:vmart/ui/widgets/home_page/checkout_widget/address/add_address.dart';
import 'package:vmart/ui/widgets/home_page/profile/my_order_widget/order_complited_notifier.dart';
import 'package:vmart/ui/widgets/sign_in_widget/forgot_password_widget.dart';
import 'package:vmart/ui/widgets/widgets.dart';

import 'controller/education_controller/video_notifier.dart';
import 'ui/pages/pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProductProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => WishlistProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CartProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => TransactionProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => PageProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => VideoNotifier(),
        ),
        ChangeNotifierProvider(
          create: (_) => OrderCompletedNotifier(),
        ),
      ],
      child: MaterialApp(debugShowCheckedModeBanner: false, routes: {
        '/': (context) => SplashPage(),
        '/sign-in': (context) => SignInPage(),
        '/sign-up': (context) => SignUpPage(),
        '/home': (context) => MainPage(),
        '/edit-profile': (context) => EditProfilePage(),
        '/cart': (context) => CartPage(),
        '/checkout': (context) => CheckoutPage(),
        '/checkout-success': (context) => CheckoutSuccessPage(),
        '/chat': (context) => ChatPage(),
        '/myorder': (context) => MyOrder(),
        '/addresslist': (context) => AddressList(),
        '/addAddress': (context) => AddAddress(),
        '/selectdelivery': (context) => SelectDelivery(),
        '/education': (context) => EducationPage(),
        '/quiz': (context) => QuizPage(),
        '/games': (context) => Games(),
        '/forgotPassword': (context) => ForgotPassword(),
      }),
    );
  }
}
