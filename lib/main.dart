import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sensor_iot/account/account_details_page.dart';
import 'package:sensor_iot/amplifyconfiguration.dart';
import 'package:sensor_iot/common/constants/colors.dart';
import 'package:sensor_iot/models/account_details.dart';
import 'package:sensor_iot/models/foxy_sensor_list.dart';
import 'package:sensor_iot/sensor/foxy_sensor.dart';
import 'package:sensor_iot/sensor/sensor_detail_page.dart';
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
  ),
  GoRoute(
    path: '/sensor/:sid',
    builder: (context, goRouterState) {
      return SensorDetailPage(sid: goRouterState.pathParameters['sid']!);
    }
  )
]);

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  Future<void> _configureAmplify() async {
    try {
      await Amplify.addPlugin(AmplifyAuthCognito());
      await Amplify.configure(amplifyconfig);
      debugPrint('Successfully configured');
    } on Exception catch (e) {
      debugPrint('Error configuring Amplify: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    _configureAmplify();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldMessengerState> rootScaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

    return Authenticator(
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => FoxySensorList(),),
          ChangeNotifierProvider(create: (_) => AccountDetails(),),
          Provider(create: (_) => rootScaffoldMessengerKey),
        ],
        child: MaterialApp.router(
          title: 'Foxy Sensors',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: headerColor),
            useMaterial3: true,
            scaffoldBackgroundColor: appBackgroundColor,
            appBarTheme: const AppBarTheme(
              backgroundColor: headerColor,
              scrolledUnderElevation: 0,
            ),
          ),
          scaffoldMessengerKey: rootScaffoldMessengerKey,
          builder: Authenticator.builder(),
          routerConfig: _router,
        ),
      ),
    );
  }
}