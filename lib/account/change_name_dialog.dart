import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sensor_iot/common/constants/colors.dart';

class ChangeNameDialog extends StatefulWidget {
  const ChangeNameDialog({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ChangeNameDialogState();
}

class _ChangeNameDialogState extends State<ChangeNameDialog> {
  final _nameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  late GlobalKey<ScaffoldMessengerState>_scaffoldMessengerKey;

  @override void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override void didChangeDependencies() {
    super.didChangeDependencies();
    _scaffoldMessengerKey = Provider.of<GlobalKey<ScaffoldMessengerState>>(context);
  }

  String? _nameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a value for your name';
    }
    else if (value.contains('/') || value.contains('\\')) {
      return 'Prohibited characters: / && \\';
    }
    else {
      return null;
    }
  }

  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      try {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Center(child: Text('Changing your name...')),
              backgroundColor: headerColor,
            )
        );

        final result = Amplify.Auth.updateUserAttribute(
            userAttributeKey: AuthUserAttributeKey.name,
            value: _nameController.text
        );
        _handleUpdateUserAttributeResult(result);

        Navigator.of(context).pop();
      } catch (error) {
        ScaffoldMessenger.maybeOf(context)?.showSnackBar(
          const SnackBar(content: Center(child: Text('Failed to change name!'),), backgroundColor: Colors.redAccent,)
        );

        debugPrintStack();
        debugPrint('Error changing name...');
      }
    }
  }
  // This function is copied from official docs:
  // https://docs.amplify.aws/flutter/build-a-backend/auth/managing-attributes/
  Future<void> _handleUpdateUserAttributeResult(Future<UpdateUserAttributeResult> result_f,) async {
    final result = await result_f;

    switch (result.nextStep.updateAttributeStep) {
      case AuthUpdateAttributeStep.confirmAttributeWithCode:
        //final codeDeliveryDetails = result.nextStep.codeDeliveryDetails!;
        //_handleCodeDelivery(codeDeliveryDetails);
        break;
      case AuthUpdateAttributeStep.done:
        _scaffoldMessengerKey.currentState?.hideCurrentSnackBar();
        _scaffoldMessengerKey.currentState?.showSnackBar(
          const SnackBar(
            content: Center(child: Text('Successfully changed name')),
            backgroundColor: Colors.greenAccent,
          )
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shadowColor: Colors.transparent,
      title: const Text('Change Name', textAlign: TextAlign.center,),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('What would you like to change your display name to?'),
          Form(
            key: _formKey,
            child: TextFormField(
              controller: _nameController,
              validator: _nameValidator,
              onFieldSubmitted: (_) {
                _submitForm();
              },
            ),
          )
        ],
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
