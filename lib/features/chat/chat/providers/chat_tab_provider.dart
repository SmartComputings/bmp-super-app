import 'package:flutter/foundation.dart';

class ChatTabProvider extends ChangeNotifier {
  String _selectedTab = 'General';

  String get selectedTab => _selectedTab;

  void selectTab(String tab) {
    if (_selectedTab != tab) {
      _selectedTab = tab;
      notifyListeners();
    }
  }

  @override
  void dispose() {
    super.dispose();
  }
}
