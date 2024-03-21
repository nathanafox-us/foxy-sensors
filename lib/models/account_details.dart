import 'dart:collection';

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/cupertino.dart';

class AccountDetails extends ChangeNotifier {
  List<AuthUserAttribute>? _currentUser;

  UnmodifiableListView<AuthUserAttribute> get currentUser => UnmodifiableListView(_currentUser ?? []);
  String get name => _currentUser?.firstWhere((attr) => attr.userAttributeKey == AuthUserAttributeKey.name).value ?? "ERR_NAME";
  String get email => _currentUser?.firstWhere((attr) => attr.userAttributeKey == AuthUserAttributeKey.email).value ?? "ERR_EMAIL";

  AccountDetails() {
    setUser();
  }

  Future<void> setUser() async {
    _currentUser = await Amplify.Auth.fetchUserAttributes();
    notifyListeners();
  }
}