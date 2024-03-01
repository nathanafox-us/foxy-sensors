import 'package:flutter/material.dart';
import 'package:sensor_iot/account/account_details_page.dart';
import 'package:sensor_iot/sensor/sensor_list_page.dart';
import 'package:go_router/go_router.dart';

void main() => runApp(const MyApp());

final GoRouter _router = GoRouter(routes: [
  GoRoute(
    path: '/',
    builder: (context, goRouterState) {
        return const SensorListPage();
    },
  ),
  GoRoute(
    path: '/account',
    builder: (context, goRouterState) {
        return const AccountDetailsPage();
    }
  )
]);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: _router,
    );
  }
}