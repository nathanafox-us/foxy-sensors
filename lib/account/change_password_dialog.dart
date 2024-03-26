import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sensor_iot/common/constants/colors.dart';

class ChangePasswordDialog extends StatefulWidget {
  const ChangePasswordDialog({Key? key}) : super(key: key);

  @override
  State<ChangePasswordDialog> createState() => _ChangePasswordDialogState();
}

class _ChangePasswordDialogState extends State<ChangePasswordDialog> {
  final _oldPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  late GlobalKey<ScaffoldMessengerState> _scaffoldMessengerKey;
  bool _validPassword = true;

  @override void dispose() {
    _oldPasswordController.dispose();
    _newPasswordController.dispose();
    super.dispose();
  }

  @override void didChangeDependencies() {
    super.didChangeDependencies();
    _scaffoldMessengerKey = Provider.of<GlobalKey<ScaffoldMessengerState>>(context);
  }

  String? _passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a value for your password';
    }
    else if (value.contains('/') || value.contains('\\')) {
      return 'Prohibited characters: / && \\';
    }
    else {
      return null;
    }
  }

  Future<void> _submitForm() async {
    if (_formKey.currentState?.validate() ?? false) {
      try {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Center(child: Text('Changing your password...')),
              backgroundColor: headerColor,
            )
        );

        setState(() {
          _validPassword = true;
        });

        await Amplify.Auth.updatePassword(
            oldPassword: _oldPasswordController.text,
            newPassword: _newPasswordController.text
        ).then(
          (_) {
            _scaffoldMessengerKey.currentState?.hideCurrentSnackBar();
            _scaffoldMessengerKey.currentState?.showSnackBar(
              const SnackBar(content: Center(child: Text('Successfully changed password')), backgroundColor: Colors.greenAccent,)
            );
          }
        );

        Navigator.of(context).pop();
      } on LimitExceededException {
        _scaffoldMessengerKey.currentState?.hideCurrentSnackBar();
        _scaffoldMessengerKey.currentState?.showSnackBar(
            const SnackBar(content: Center(child: Text('Limit exceeded, try again later!'),), backgroundColor: Colors.redAccent,)
        );

        debugPrintStack();
        debugPrint('Limit exceeded changing password...');

        setState(() {
          _validPassword = false;
        });
      } catch (error) {
        _scaffoldMessengerKey.currentState?.hideCurrentSnackBar();
        _scaffoldMessengerKey.currentState?.showSnackBar(
            const SnackBar(content: Center(child: Text('Failed to change password!'),), backgroundColor: Colors.redAccent,)
        );

        debugPrintStack();
        debugPrint('Error changing password...');
        debugPrint(error.toString());

        setState(() {
          _validPassword = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shadowColor: Colors.transparent,
      title: const Text('Change Password', textAlign: TextAlign.center,),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('What would you like to change your password to?'),
            TextFormField(
              decoration: InputDecoration(
                label: const Text('Old Password'),
                errorText: _validPassword ? null : 'Please enter a value for your password',
              ),
              obscureText: true,
              controller: _oldPasswordController,
              validator: _passwordValidator,
              onFieldSubmitted: (_) {
                _submitForm();
              },
            ),
            TextFormField(
              decoration: InputDecoration(
                label: const Text('New Password'),
                errorText: _validPassword ? null : 'Please enter a value for your password',
              ),
              obscureText: true,
              controller: _newPasswordController,
              validator: _passwordValidator,
              onFieldSubmitted: (_) {
                _submitForm();
              },
            ),
          ],
        ),
      ),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        ElevatedButton(
          onPressed: _submitForm,
          child: const Text('Submit'),
        ),
        ElevatedButton(
          onPressed: Navigator.of(context).pop,
          child: const Text('Cancel'),
        ),
      ],
    );
  }
}
