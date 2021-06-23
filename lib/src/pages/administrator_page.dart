import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:cool_stepper/cool_stepper.dart';
import 'package:emulator/src/shared_prefs/shared_preferences.dart';

class AdministratorPage extends StatefulWidget {
  AdministratorPage({Key? key}) : super(key: key);

  @override
  _AdministratorPageState createState() => _AdministratorPageState();
}

class _AdministratorPageState extends State<AdministratorPage> {
  final _formKey = GlobalKey<FormState>();
  String? selectedRole = 'Administrator';

  final prefs = new PreferenciasUsuario();

  @override
  void initState() {
    super.initState();
    final _adminNameCtrl = TextEditingController(text: prefs.adminName);
    final _adminPassCtrl = TextEditingController(text: prefs.adminPass);
    final _adminPassCheckCtrl =
        TextEditingController(text: prefs.adminPassCheck);
    final _adminUsrCtrl = TextEditingController(text: prefs.adminUsr);
    final _adminReenterCtrl = TextEditingController(text: prefs.adminReenter);
    final _adminAppendedCtrl = TextEditingController(text: prefs.adminAppended);
    final _adminRepeatCtrl = TextEditingController();
  }

  // @override
  // void dispose() {
  //   _adminNameCtrl.dispose();
  //   _adminPassCtrl.dispose();
  //   _adminPassCheckCtrl.dispose();
  //   _adminUsrCtrl.dispose();
  //   _adminReenterCtrl.dispose();
  //   _adminAppendedCtrl.dispose();
  //   _adminRepeatCtrl.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        key: _formKey,
        child: CoolStepper(
          showErrorSnackbar: false,
          onCompleted: () {
            print('Steps completed!');
          },
          steps: _steps(),
          config: CoolStepperConfig(
            titleTextStyle: TextStyle(
              color: Colors.white,
            ),
            ofText: '-',
            backText: 'BACK',
            nextText: 'NEXT',
            finalText: 'END',
          ),
        ),
      ),
    );
  }

  _steps() {
    return [
      CoolStep(
        title: 'Admin Setup',
        subtitle: '',
        content: TextFormField(
          decoration: InputDecoration(
            hintText: 'User Name(length<6,15>):',
            errorStyle: TextStyle(color: Colors.white),
          ),
          maxLength: 15,
          validator: (value) {
            if (value!.isEmpty) {
              return 'Name is required';
            } else if (value.length > 6) {
              return 'The lenght must be greater than 6 characters.';
            }
            return null;
          },
          controller: _adminNameCtrl,
        ),
        validation: () {
          if (!_formKey.currentState!.validate()) {
            return 'Fill form correctly';
          }
          return null;
        },
      ),
      CoolStep(
        title: 'Admin Setup',
        subtitle: '',
        content: TextFormField(
          obscureText: true,
          decoration: InputDecoration(
            hintText: 'User Password(length<6,15>)',
          ),
          maxLength: 15,
          validator: (value) {
            if (value!.isEmpty) {
              return 'Password is required';
            }
            return null;
          },
          controller: _adminPassCtrl,
        ),
        validation: () {
          if (!_formKey.currentState!.validate()) {
            return 'Fill form correctly';
          }
          return null;
        },
      ),
      CoolStep(
        title: 'Admin Setup',
        subtitle: '',
        content: Column(
          children: [
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Confirm Password(length<6,15>):',
              ),
              maxLength: 15,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Password is required';
                }
                return null;
              },
              controller: _adminPassCheckCtrl,
            ),
          ],
        ),
        validation: () {
          if (!_formKey.currentState!.validate()) {
            return 'Fill form correctly';
          }
          return null;
        },
      ),
      CoolStep(
        title: 'Admin Setup',
        subtitle: '',
        content: TextFormField(
          decoration: InputDecoration(
            hintText: 'User profile name(<=15 chars)[root]:',
          ),
          maxLength: 15,
          validator: (value) {
            if (value!.isEmpty) {
              return 'User profile is required.';
            } else if (value.length < 15) {
              return 'The lenght must be less o equal to 15 characters.';
            }
            return null;
          },
          controller: _adminUsrCtrl,
        ),
        validation: () {
          if (!_formKey.currentState!.validate()) {
            return 'Fill form correctly';
          }
          return null;
        },
      ),
      // Select role
      CoolStep(
        title: 'Admin Setup',
        subtitle: '',
        content: Container(
          child: Row(
            children: [
              Text('User\'s Level:'),
              _buildSelector(
                context: context,
                name: 'Common User',
              ),
              SizedBox(width: 5.0),
              _buildSelector(
                context: context,
                name: 'Operator',
              ),
              SizedBox(width: 5.0),
              _buildSelector(
                context: context,
                name: 'Administrator',
              ),
            ],
          ),
        ),
        validation: () {
          return null;
        },
      ),
      CoolStep(
        title: 'Admin Setup',
        subtitle: '',
        content: TextFormField(
          decoration: InputDecoration(
            hintText: 'Permitted Reenter Number(0--4):',
            errorStyle: TextStyle(color: Colors.white),
          ),
          keyboardType: TextInputType.number,
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp('[0-4]+')),
          ],
          validator: (value) {
            if (value!.isEmpty) {
              return 'Only numbers from 0 to 4';
            }
            return null;
          },
          controller: _adminReenterCtrl,
        ),
        validation: () {
          if (!_formKey.currentState!.validate()) {
            return 'Fill form correctly';
          }
          return null;
        },
      ),
      CoolStep(
        title: 'Admin Setup',
        subtitle: '',
        content: TextFormField(
          decoration: InputDecoration(
            hintText: 'User\'s Appended Info(<=30 chars):',
          ),
          maxLength: 30,
          validator: (value) {
            if (value!.isEmpty) {
              return 'User name is required';
            }
            return null;
          },
          controller: _adminAppendedCtrl,
        ),
        validation: () {
          if (!_formKey.currentState!.validate()) {
            return 'Fill form correctly';
          }
          return null;
        },
      ),
      CoolStep(
        title: 'Admin Setup',
        subtitle: '',
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Adding user successfully'),
            SizedBox(height: 20.0),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Repeat this operation? (y/n)[n]:',
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'The response is required';
                } else if (value == 'y') {
                  _adminNameCtrl.clear();
                  _adminPassCtrl.clear();
                  _adminPassCheckCtrl.clear();
                  _adminUsrCtrl.clear();
                  _adminReenterCtrl.clear();
                  _adminAppendedCtrl.clear();
                  _adminRepeatCtrl.clear();
                  return null;
                } else if (value == 'n') {
                  print(_adminNameCtrl.text);
                  print(_adminPassCtrl.text);
                  print(_adminPassCheckCtrl.text);
                  print(_adminUsrCtrl.text);
                  print(_adminReenterCtrl.text);
                  print(_adminAppendedCtrl.text);
                  print(_adminRepeatCtrl.text);
                  return null;
                }
                return null;
              },
              controller: _adminRepeatCtrl,
            ),
          ],
        ),
        validation: () {
          if (!_formKey.currentState!.validate()) {
            return 'Fill form correctly';
          }
          return null;
        },
      ),
    ];
  }

  Widget _buildSelector({
    BuildContext? context,
    required String name,
  }) {
    final isActive = name == selectedRole;

    return Expanded(
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          color: isActive ? Theme.of(context!).primaryColor : null,
          border: Border.all(
            width: 0,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: RadioListTile(
          value: name,
          activeColor: Colors.white,
          groupValue: selectedRole,
          onChanged: (String? v) {
            setState(() {
              selectedRole = v;
            });
          },
          title: Text(
            name,
            style: TextStyle(
              color: isActive ? Colors.white : null,
            ),
          ),
        ),
      ),
    );
  }
}
