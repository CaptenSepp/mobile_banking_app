import 'package:flutter/material.dart';
import 'package:vrouter/vrouter.dart';

import '../modules/home/screens/home_page.dart';
import '../modules/home/screens/transaction_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VRouter(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.brown),
      routes: [
        VWidget(
          path: '/',
          widget: HomePage(
          ),
        ),
        VWidget(
          path: '/transactionPage',
          widget: TransactionPage(
          ),
        ),
        VRouteRedirector(path: r'*', redirectTo: '/')
      ],
    );
  }
}
