import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:student_app_v3/widgets/provider_widget.dart';

final primaryColor = const Color(0XFF75A2EA);

enum AuthFormType { signIn, signUp, reset }

class SignUpView extends StatefulWidget {
  final AuthFormType authFormType;

  SignUpView({Key key, @required this.authFormType}) : super(key: key);

  @override
  _SignUpViewState createState() =>
      _SignUpViewState(authFormType: this.authFormType);
}

class _SignUpViewState extends State<SignUpView> {
  AuthFormType authFormType;
  _SignUpViewState({this.authFormType});

  final formKey = GlobalKey<FormState>();
  String _email, _password, _name, _warning;

  void switchFormState(String state) {
    formKey.currentState.reset();
    if (state == 'signUp') {
      setState(() {
        authFormType = AuthFormType.signUp;
      });
    } else {
      setState(() {
        authFormType = AuthFormType.signIn;
      });
    }
  }

  //checking validation
  bool validate() {
    final form = formKey.currentState;
    form.save();
    if (form.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }

// Submitting after validating to firebase
  void submit() async {
    if (validate()) {
      try {
        final auth = Provider.of(context).auth;
        if (authFormType == AuthFormType.signIn) {
          String uid =
              await auth.signInUserWithEmailAndPassword(_email, _password);
          print("Signed In With ID $uid");
          Navigator.of(context).pushReplacementNamed('/home');
        } else if (authFormType == AuthFormType.reset) {
          await auth.sendPasswordResetEmail(_email);
          print('Password reset email sent ');
          _warning = "A password reset link has been sent to $_email";

          setState(() {
            authFormType = AuthFormType.signIn;
          });
        } else {
          String uid = await auth.createUserWithEmailAndPassword(
              _email, _password, _name);
          print("Signed Up With New ID $uid");
          Navigator.of(context).pushReplacementNamed('/home');
        }
      } catch (e) {
        print(e);
        setState(() {
          _warning = e.message;
        });
      }
    }
  }
 // Main Container

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;

    return new Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
/*
            decoration: BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("images/midlands.jpg"),
                  ),
            ),*/
        // TODO : add opacity background picture
        color: Colors.white70,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: new SafeArea(
          child: Center(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: _height * 0.05),
                // TODO : change the image
                /*
              Image.asset(
                  "images/midlands.jpg",
                  height: _height * 0.3,
                  width: _width * 100.0,
              ),
              */
                buildTextHeader(),
                SizedBox(height: _height * 0.05),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Form(
                    key: formKey,
                    child: new Column(
                      children: builtInputs() + buildButtons(),
                    ),
                  ),
                ),
                SizedBox(height: _height * 0.25),
                showAlert(), // displaying errors
                SizedBox(height: _height * 0.025),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // error container when failed to post to firebase
  Widget showAlert() {
    if (_warning != null) {
      return Container(
        color: Colors.red,
        width: double.infinity,
        padding: EdgeInsets.all(8.0),
        child: new Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Icon(
                Icons.error_outline,
              ),
            ),
            Expanded(
              child: AutoSizeText(
                _warning,
                maxLines: 3,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  setState(() {
                    _warning = null;
                  });
                },
              ),
            ),
          ],
        ),
      );
    }
    return SizedBox(
      height: 0,
    );
  }

  // selecting the header to be displayed depending on the state

  AutoSizeText buildTextHeader() {
    String _headerText;
    if (authFormType == AuthFormType.signUp) {
      _headerText = "Create An Account";
    } else if (authFormType == AuthFormType.reset) {
      _headerText = "Reset Password";
    } else {
      _headerText = "Sign In";
    }
    return AutoSizeText(
      _headerText,
      maxLines: 1,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 35.0,
        color: Colors.black,
      ),
    );
  }

// handling the text inputs

  List<Widget> builtInputs() {
    List<Widget> textFields = [];

    // reset text email text field
    if (authFormType == AuthFormType.reset) {
      textFields.add(TextFormField(
        validator: EmailValidator.validate,
        style: TextStyle(fontSize: 22.0),
        decoration: buildSignUpInputDecoration("Email"),
        onSaved: (value) => _email = value,
      ));
      textFields.add(SizedBox(
        height: 20.0,
      ));
      return textFields;
    }

    // if were in the sign up state add name
    if (authFormType == AuthFormType.signUp) {
      textFields.add(
        TextFormField(
          validator: NameValidator.validate, // invoking the validation function
          style: TextStyle(fontSize: 22.0),
          decoration: buildSignUpInputDecoration("Name"),
          onSaved: (value) => _name = value,
        ),
      );
      textFields.add(
        SizedBox(height: 20.0),
      );
    }

    // add email & password
    textFields.add(
      TextFormField(
        validator: EmailValidator.validate, // invoking the validation function
        style: TextStyle(fontSize: 22.0),
        decoration: buildSignUpInputDecoration("Email"),
        onSaved: (value) => _email = value,
      ),
    );
    textFields.add(
      SizedBox(height: 20.0),
    );
    textFields.add(
      TextFormField(
        validator:
            PasswordValidator.validate, // invoking the validation function
        style: TextStyle(fontSize: 22.0),
        decoration: buildSignUpInputDecoration("Password"),
        obscureText: true,
        onSaved: (value) => _password = value,
      ),
    );
    return textFields;
  }

  // Input TextField decorations
  InputDecoration buildSignUpInputDecoration(String hint) {
    return InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: Colors.white,
        focusColor: Colors.white,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blueAccent,
            width: 2.0,
          ),
        ),
        contentPadding: const EdgeInsets.only(
          left: 14.0,
          bottom: 10.0,
          top: 10.0,
        ));
  }

  // Buttons

  List<Widget> buildButtons() {
    String _switchButtonText, _newFormState, _submitButtonText;
    bool _showForgotPassword = false;

    if (authFormType == AuthFormType.signIn) {
      _switchButtonText = "Create An Account";
      _newFormState = "signUp";
      _submitButtonText = "Sign In";
      _showForgotPassword = true;
    } else if (authFormType == AuthFormType.reset) {
      _switchButtonText = "Return to Sign In";
      _newFormState = "signIn";
      _submitButtonText = "Submit";
    } else {
      _switchButtonText = "Already have an account? Sign In ";
      _newFormState = "signIn";
      _submitButtonText = "Sign Up";
    }
    return [
      SizedBox(
        height: MediaQuery.of(context).size.height * 0.05,
      ),
      Container(
        width: MediaQuery.of(context).size.width * 0.7,
        child: RaisedButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
          color: Colors.black12,
          textColor: Colors.white,
          child: new Padding(
            padding: const EdgeInsets.all(8.0),
            child: new Text(
              _submitButtonText,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w200,
              ),
            ),
          ),
          onPressed: submit,
        ),
      ),
      showForgotPassword(_showForgotPassword), // invoking the Forgot password
      FlatButton(
        child: new Text(
          _switchButtonText,
          style: TextStyle(color: Colors.black),
        ),
        onPressed: () {
          switchFormState(_newFormState);
        },
      )
    ];
  }

  // Forgot password button
  Widget showForgotPassword(bool visible) {
    return Visibility(
      child: FlatButton(
        child: new Text(
          "Forgot Password?",
          style: TextStyle(color: Colors.black),
        ),
        onPressed: () {
          setState(() {
            authFormType = AuthFormType.reset;
          });
        },
      ),
      visible: visible,
    );
  }
}

// TextFields validators classes

class NameValidator {
  static String validate(String value) {
    if (value.isEmpty) {
      return "Please Enter Your Name";
    }
    if (value.length < 3) {
      return "Name must be at least 3 characters long";
    }
    if (value.length > 50) {
      return "Name must be less than 50 characters long";
    }
    return null;
  }
}

class EmailValidator {
  static String validate(String value) {
    if (value.isEmpty) {
      return "Please Enter Your Email ";
    }
    return null;
  }
}

class PasswordValidator {
  static String validate(String value) {
    if (value.isEmpty) {
      return "Please Enter Your Password";
    }
    return null;
  }
}
