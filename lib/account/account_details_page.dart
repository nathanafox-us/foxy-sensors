import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sensor_iot/account/change_name_dialog.dart';
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
    accountDetails = Provider.of<AccountDetails>(context);
  }

  AccountDetails? accountDetails;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const FoxySensorsAppBar(),
      drawer: const FoxySensorsDrawer(),
      body: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20,),
            if (accountDetails != null) ...[
              InkWell(
                onLongPress: () {
                  showDialog(
                    context: context,
                    builder:  (context) => const ChangeNameDialog(),
                  );
                },
                child: Text(accountDetails!.name, style: const TextStyle(fontSize: 30),),
              ),
              const SizedBox(height: 5,),
              Text(accountDetails!.email),
              const SizedBox(height: 20,),
            ],
            ElevatedButton(
              onPressed: Amplify.Auth.signOut,
              child: const Text('Logout'),
            ),
            const SizedBox(height: 5,),
            ElevatedButton(
              onPressed: () {
                debugPrint('Change Password Pressed');
              },
              child: const Text('Change Password'),
            ),
            const SizedBox(height: 5,),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Delete Account'),
            )
          ],
              ),
      ),
    );
  }
}
