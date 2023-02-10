import 'package:etiya_project/pages/covid_page.dart';
import 'package:flutter/material.dart';

import 'constants/navigator/app_router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _approuter = AppRouter();
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: _approuter.delegate(),
      routeInformationParser: _approuter.defaultRouteParser(),
      title: 'Etiya App',
      debugShowCheckedModeBanner: false,
    );
    /* return MaterialApp(
      title: 'Etiya App',
      debugShowCheckedModeBanner: false,
      home: CovidPage(),
    ); */
  }
}
