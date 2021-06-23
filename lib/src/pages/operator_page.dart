import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:cool_stepper/cool_stepper.dart';
import 'package:emulator/src/shared_prefs/shared_preferences.dart';

class OperatorPage extends StatefulWidget {
  OperatorPage({Key? key}) : super(key: key);

  @override
  _OperatorPageState createState() => _OperatorPageState();
}

class _OperatorPageState extends State<OperatorPage> {
  final _formKey = GlobalKey<FormState>();
  String? selectedRole = 'Operator';

  // Default data
  String _operatorNameCtrl = 'huawei1';
  String _operatorPassCtrl = 'huawei123';
  String _operatorPassCheckCtrl = 'huawei123';
  String _operatorUsrCtrl = 'weihuzu';
  String _permission = 'Operator';
  String _operatorReenter = '2';
  String _operatorAppended = 'Test information';

  final prefs = new PreferenciasUsuario();

  @override
  void initState() {
    super.initState();
    final _operatorNameCtrl =
        new TextEditingController(text: prefs.operatorName);
    final _operatorPassCtrl =
        new TextEditingController(text: prefs.operatorPass);
    final _operatorPassCheckCtrl =
        new TextEditingController(text: prefs.operatorPassCheck);
    final _operatorUsrCtrl = new TextEditingController(text: prefs.operatorUsr);
    final _operatorReenter =
        new TextEditingController(text: prefs.operatorReenter);
    final _operatorAppended =
        new TextEditingController(text: prefs.operatorAppended);
    final _operatorRepeatCtrl = new TextEditingController();
  }

  // @override
  // void dispose() {
  //   _operatorNameCtrl.dispose();
  //   _operatorPassCtrl.dispose();
  //   _operatorPassCheckCtrl.dispose();
  //   _operatorUsrCtrl.dispose();
  //   _operatorReenter.dispose();
  //   _operatorAppended.dispose();
  //   _operatorRepeatCtrl.dispose();
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
        title: 'Operator Setup',
        subtitle: '',
        content: TextField(
            decoration: InputDecoration(
              hintText: 'User Name(length<6,15>):',
              errorStyle: TextStyle(color: Colors.white),
            ),
            maxLength: 15,
            controller: _operatorNameCtrl,
            onChanged: (value) {
              prefs.operatorName = value;
            }),
        validation: () {
          if (!_formKey.currentState!.validate()) {
            return 'Fill form correctly';
          }
          return null;
        },
      ),
      CoolStep(
        title: 'Operator Setup',
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
          controller: _operatorPassCtrl,
        ),
        validation: () {
          if (!_formKey.currentState!.validate()) {
            return 'Fill form correctly';
          }
          return null;
        },
      ),
      CoolStep(
        title: 'Operator Setup',
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
              controller: _operatorPassCheckCtrl,
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
        title: 'Operator Setup',
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
          controller: _operatorUsrCtrl,
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
        title: 'Operator Setup',
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
        title: 'Operator Setup',
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
          controller: _operatorReenter,
        ),
        validation: () {
          if (!_formKey.currentState!.validate()) {
            return 'Fill form correctly';
          }
          return null;
        },
      ),
      CoolStep(
        title: 'Operator Setup',
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
          controller: _operatorAppended,
        ),
        validation: () {
          if (!_formKey.currentState!.validate()) {
            return 'Fill form correctly';
          }
          return null;
        },
      ),
      CoolStep(
        title: 'Operator Setup',
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
                }
                // else if (value == 'y') {
                //   _operatorNameCtrl.clear();
                //   _operatorPassCtrl.clear();
                //   _operatorPassCheckCtrl.clear();
                //   _operatorUsrCtrl.clear();
                //   _operatorReenterCtrl.clear();
                //   _operatorAppendedCtrl.clear();
                //   _operatorRepeatCtrl.clear();
                //   return null;
                // } else if (value == 'n') {
                //   print(_operatorNameCtrl.text);
                //   print(_operatorPassCtrl.text);
                //   print(_operatorPassCheckCtrl.text);
                //   print(_operatorUsrCtrl.text);
                //   print(_operatorReenterCtrl.text);
                //   print(_operatorAppendedCtrl.text);
                //   print(_operatorRepeatCtrl.text);
                //   return null;
                // }
                return null;
              },
              controller: _operatorRepeatCtrl,
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
