import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class FormInput extends StatefulWidget {
  final Function submitFunction;
  FormInput(
      this.submitFunction(String username,String email,  String password,
          bool isLogIn, BuildContext context));
  @override
  _FormInputState createState() => _FormInputState();
}

class _FormInputState extends State<FormInput> {
  final _keyForm = GlobalKey<FormState>();
  bool _haveAccount = false;
  bool _isVisable = true;
  var username = "";
  var password = "";
  var email = "";
  final elevationBtnStyle = ElevatedButton.styleFrom(
      elevation: 5,
      padding: EdgeInsets.symmetric(vertical: 12),
      onPrimary: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ));
  final outlineBtnStyle = ElevatedButton.styleFrom(
      elevation: 5,
      padding: EdgeInsets.symmetric(vertical: 12),
      onPrimary: Colors.red,
      primary: Colors.white,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.red),
        borderRadius: BorderRadius.circular(20),
      ));
  final neumorphocStyle = NeumorphicStyle(
      color: Colors.white, boxShape: NeumorphicBoxShape.stadium());

  void _onSave() {
    final valid = _keyForm.currentState!.validate();
    if (!valid) {
      print("U R Not Authentecated");
      return;
    }
    _keyForm.currentState!.save();
    widget.submitFunction(
        username.trim(), email.trim(), password.trim(), _haveAccount, context);
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: SafeArea(
        // minimum: EdgeInsets.symmetric(vertical: 50, horizontal: 20),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 70,
                  backgroundImage: AssetImage('assets/images/avataruser.jpg'),
                ),
                Column(
                  children: [
                    //input form
                    Form(
                      key: _keyForm,
                      child: Column(
                        children: [
                          if (!_haveAccount)
                            Neumorphic(
                              style: neumorphocStyle,
                              margin: EdgeInsets.only(top: 20),
                              padding: EdgeInsets.only(left: 10, bottom: 5),
                              child: TextFormField(
                                key: ValueKey('username'),
                                onSaved: (value) {
                                  username = value!;
                                },
                                validator: (value) {
                                  if (value!.isEmpty == true ||
                                      value.length <= 4) {
                                    return "Username must be more than 4 charcter!";
                                  }

                                  return null;
                                },
                                textInputAction: TextInputAction.next,
                                decoration: InputDecoration(
                                  icon: Icon(Icons.person_outline),
                                  border: InputBorder.none,
                                  hintText: "Username",
                                ),
                              ),
                            ),
                          Neumorphic(
                            style: neumorphocStyle,
                            margin: EdgeInsets.only(top: 20),
                            padding: EdgeInsets.only(left: 10, bottom: 5),
                            child: TextFormField(
                              key: ValueKey('email'),
                              onSaved: (value) {
                                email =  value!;
                              },
                              validator: (value) {
                                if (value!.isEmpty ||
                                    !value.contains('@') ||
                                    !value.contains(".")) {
                                  return "Please,Enter valid email address!";
                                }

                                return null;
                              },
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                icon: Icon(Icons.email_outlined),
                                border: InputBorder.none,
                                hintText: "Email",
                              ),
                            ),
                          ),
                          Neumorphic(
                            style: neumorphocStyle,
                            margin: EdgeInsets.only(top: 20),
                            padding: EdgeInsets.only(left: 10, bottom: 5),
                            child: TextFormField(
                              key: ValueKey('password'),
                              onSaved: (value) {
                                password = value!;
                              },
                              validator: (value) {
                                if (value!.isEmpty || value.length <= 5) {
                                  return "Password must be more than 5 charctre";
                                }
                                return null;
                              },
                              textInputAction: TextInputAction.done,
                              obscureText: _isVisable,
                              decoration: InputDecoration(
                                icon: Icon(Icons.lock_open),
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _isVisable = !_isVisable;
                                      });
                                    },
                                    icon: _isVisable
                                        ? Icon(Icons.visibility_off)
                                        : Icon(Icons.visibility)),
                                border: InputBorder.none,
                                hintText: "Password",
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 50),
                    //signUp & logIn buttons
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                onPressed: _onSave,
                                child: Text(
                                  _haveAccount ? "LogIn" : "SignUp",
                                  style: TextStyle(fontSize: 18),
                                ),
                                style: _haveAccount
                                    ? elevationBtnStyle
                                    : outlineBtnStyle,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    _haveAccount = !_haveAccount;
                                  });
                                },
                                child: Text(
                                  _haveAccount
                                      ? "Create new account"
                                      : "Already have an account",
                                  style: TextStyle(fontSize: 18),
                                ),
                                style: _haveAccount
                                    ? outlineBtnStyle
                                    : elevationBtnStyle,
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
