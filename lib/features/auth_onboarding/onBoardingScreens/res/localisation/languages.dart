import 'package:get/get.dart';

class Languages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': {'hello': 'Hello', 'welcome': 'Welcome to our app'},
    'ur_PK': {'hello': 'Hola', 'welcome': 'Bienvenido a nuestra aplicación'},
    // Add more languages here
  };
}
