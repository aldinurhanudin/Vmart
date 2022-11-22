import 'package:flutter/material.dart';

import 'ui/pages/pages.dart';

void main(List<String> args) => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, routes: {
      '/': (context) => SplashPage(),
      '/sign-in': (context) => SignInPage(),
      '/sign-up': (context) => SignUpPage(),
      '/home': (context) => MainPage(),
      '/detail-chat': (context)=> DetailChatPage(),
      '/edit-profile': (context)=> EditProfilePage(),
      '/product': (context)=> ProductPage(),
      '/cart': (context)=> CartPage(),
      '/checkout': (context) => CheckoutPage(),
      '/checkout-success': (context) => CheckoutSuccessPage(),

    });
  }
}
