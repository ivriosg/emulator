import 'package:shared_preferences/shared_preferences.dart';

class PreferenciasUsuario {
  static final PreferenciasUsuario _instancia =
      new PreferenciasUsuario.internal();

  factory PreferenciasUsuario() {
    return _instancia;
  }

  PreferenciasUsuario.internal();

  SharedPreferences? _prefs;

  initPrefs() async {
    this._prefs = await SharedPreferences.getInstance();
  }

  // Admin Name
  String get adminName {
    return _prefs!.getString('adminName') ?? '';
  }

  set adminName(String value) {
    _prefs!.setString('adminName', value);
  }

  // Admin Password
  String get adminPass {
    return _prefs!.getString('adminPass') ?? '';
  }

  set adminPass(String value) {
    _prefs!.setString('adminPass', value);
  }

  // Admin Password Check
  String get adminPassCheck {
    return _prefs!.getString('adminPassCheck') ?? '';
  }

  set adminPassCheck(String value) {
    _prefs!.setString('adminPassCheck', value);
  }

  // Admin User
  String get adminUsr {
    return _prefs!.getString('adminUsr') ?? '';
  }

  set adminUsr(String value) {
    _prefs!.setString('adminUsr', value);
  }

  // Admin Reenter Number
  String get adminReenter {
    return _prefs!.getString('adminReenter') ?? '';
  }

  set adminReenter(String value) {
    _prefs!.setString('adminReenter', value);
  }

  // Admin Appended
  String get adminAppended {
    return _prefs!.getString('adminAppended') ?? '';
  }

  set adminAppended(String value) {
    _prefs!.setString('adminAppended', value);
  }

  /*    Operator Profile    */
  // Operator Name
  String get operatorName {
    return _prefs!.getString('operatorName') ?? '';
  }

  set operatorName(String value) {
    _prefs!.setString('operatorName', value);
  }

  // Operator Password
  String get operatorPass {
    return _prefs!.getString('operatorPass') ?? '';
  }

  set operatorPass(String value) {
    _prefs!.setString('operatorPass', value);
  }

  // Operator Password Check
  String get operatorPassCheck {
    return _prefs!.getString('operatorPassCheck') ?? '';
  }

  set operatorPassCheck(String value) {
    _prefs!.setString('operatorPassCheck', value);
  }

  // Operator User
  String get operatorUsr {
    return _prefs!.getString('operatorUsr') ?? '';
  }

  set operatorUsr(String value) {
    _prefs!.setString('operatorUsr', value);
  }

  // Operator Reenter Number
  String get operatorReenter {
    return _prefs!.getString('operatorReenter') ?? '';
  }

  set operatorReenter(String value) {
    _prefs!.setString('operatorReenter', value);
  }

  // Operator Appended
  String get operatorAppended {
    return _prefs!.getString('operatorAppended') ?? '';
  }

  set operatorAppended(String value) {
    _prefs!.setString('operatorAppended', value);
  }
}
