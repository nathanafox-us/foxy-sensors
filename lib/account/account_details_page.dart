import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sensor_iot/common/ui/foxy_sensors_app_bar.dart';
import 'package:sensor_iot/common/ui/foxy_sensors_drawer.dart';
import 'package:sensor_iot/models/account_details.dart';

class AccountDetailsPage extends StatefulWidget {
  const AccountDetailsPage({Key? key}) : super(key: key);

  @override
  State<AccountDetailsPage> createState() => _AccountDetailsPageState();
}

class _AccountDetailsPageState extends State<AccountDetailsPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final accountDetails = Provider.of<AccountDetails>(context);

    return Scaffold(
      appBar: const FoxySensorsAppBar(),
      drawer: const FoxySensorsDrawer(),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 10,),
            const Icon(Icons.account_circle_rounded, color: Colors.green, size: 200),
            const SizedBox(height: 10,),
            Text(accountDetails.name),
            const SizedBox(height: 10,),
            Text(accountDetails.email),
            const SizedBox(height: 10,),
            ElevatedButton(
              onPressed: Amplify.Auth.signOut,
              child: const Text('Logout'),
            ),
            ElevatedButton(
              onPressed: () {
                debugPrint('Change Password Pressed');
              },
              child: const Text('Change Password'),
            )
          ],
        ),
      ),
    );
  }
}
