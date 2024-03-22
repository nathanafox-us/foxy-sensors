import 'package:flutter/material.dart';

class ChangeNameDialog extends StatefulWidget {
  const ChangeNameDialog({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ChangeNameDialogState();
}

class _ChangeNameDialogState extends State<ChangeNameDialog> {
  _ChangeNameDialogState();

  final _nameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override void dispose() {
    _nameController.dispose();
    super.dispose();
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
            ),
          )
        ],
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            if (_formKey.currentState?.validate() ?? false) {
              debugPrint('Changing name...');
            }
          },
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
