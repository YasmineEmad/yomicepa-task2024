import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yomicepa_mobile_task/providers/user_provider.dart';
import 'package:yomicepa_mobile_task/screens/login_screen.dart';
import 'package:yomicepa_mobile_task/screens/return_requests_screen.dart';

void main() {
  runApp(ChangeNotifierProvider(create: (context) => UserProvider(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<UserProvider>(context);

    return MaterialApp(
      theme: ThemeData(useMaterial3: false),
      debugShowCheckedModeBanner: false,
      initialRoute: provider.token != '' ? ReturnRequestsScreen.routeName : LoginScreen.routeName,
      routes: {
        LoginScreen.routeName: (context) => const LoginScreen(),
      },
    );
  }
}
