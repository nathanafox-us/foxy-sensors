import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sensor_iot/account/change_name_dialog.dart';
import 'package:sensor_iot/account/change_password_dialog.dart';
import 'package:sensor_iot/common/constants/colors.dart';
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
  void didChangeDependencies() {
    super.didChangeDependencies();
    accountDetails = Provider.of<AccountDetails>(context);
    accountDetails?.setUser();
  }

  AccountDetails? accountDetails;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const FoxySensorsAppBar(),
      drawer: const FoxySensorsDrawer(),
      body: Center(
        child: Column(
          children: [
            const Icon(Icons.account_circle_rounded, color: headerColor, size: 200,),
            if (accountDetails != null) ...[
              InkWell(
                onLongPress: () {
                  showDialog(
                    context: context,
                    builder:  (context) => const ChangeNameDialog(),
                  );
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      accountDetails!.name,
                      style: const TextStyle(fontSize: 30,),
                    ),
                    const SizedBox(width: 5,),
                    const Icon(Icons.edit),
                  ],
                ),
              ),
              const SizedBox(height: 5,),
              Text(accountDetails!.email),
              const SizedBox(height: 20,),
            ],
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => const ChangePasswordDialog(),
                );
              },
              child: const Text('Change Password'),
            ),
            const SizedBox(height: 5,),
            ElevatedButton(
              onPressed: Amplify.Auth.signOut,
              child: const Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
