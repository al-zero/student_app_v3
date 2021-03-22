import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:student_app_v3/widgets/loading.dart';
import 'package:student_app_v3/widgets/provider_widget.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
import 'package:student_app_v3/widgets/snake_button.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

final primaryColor = const Color(0XFF75A2EA);

enum AuthFormType { signIn, signUp, reset , anonymous}

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

  // Initially password is obscure
  bool _obscureText = true;

  // Loading animation
  bool loading = false;

  // Toggles the password show status
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  final formKey = GlobalKey<FormState>();
  String _email, _password, _name, _warning, _confirmPassword;
  bool isLoading = false;

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
        // loading
        setState(() {
          loading = true;
        });
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
          loading = false;
          _warning = e.message;
        });
      }
    }
  }

  // Handling the anonymous user
  Future submitAnonymous() async {
    final auth = Provider.of(context).auth;
    await auth.signInAnonymously();
    Navigator.of(context).pushReplacementNamed('/home');
  }


  // Main Container

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery
        .of(context)
        .size
        .width;
    final _height = MediaQuery
        .of(context)
        .size
        .height;

    // if user is anonymous
    if (authFormType == AuthFormType.anonymous) {
      submitAnonymous();

    } else {
      return loading? Loading() : new Scaffold(
        backgroundColor: Colors.lightBlue[50],

        body: SingleChildScrollView(
          child: Container(
            // TODO : add opacity background picture
            color: Colors.lightBlue[50],
            height: MediaQuery
                .of(context)
                .size
                .height,
            width: MediaQuery
                .of(context)
                .size
                .width,
            child: new SafeArea(
              child: Center(
                child: new Column(
                  children: <Widget>[
                    SizedBox(height: _height * 0.01),
                    // displaying errors
                    showAlert(),
                    SizedBox(height: _height * 0.02),
                    // TODO : change the image
                    // invoking the header of the login/sign screen
                    buildTextHeader(),
                    SizedBox(height: _height * 0.01),
                   Image.asset(
                      "images/midlands.jpg",
                      // "images/midlands.jpeg",
                      // "images/msu.JPG",
                      //"images/msu.jpeg",
                     // "images/edited.jpg",
                      height: _height * 0.15,
                      width: _width * 100.0,
                    ),
                    // Snake Button

                    Padding(
                      padding: const EdgeInsets.only(right:20.0, left: 20.0, top: 10.0),
                      child: SnakeButton(
                        child: Text('Our Hands Our Minds Our Destiny'),
                        borderColor: Colors.yellowAccent,
                        borderWidth: 3,
                        duration: const Duration(seconds: 3),
                        onTap: (){
                          print('on tap');
                        },
                      ),

                    ),
                    SizedBox(height: _height * 0.01),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Form(
                        key: formKey,
                        child: new Column(
                          children: builtInputs() + buildButtons(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    }
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
        decoration: buildEmailSignUpInputDecoration("Email"),
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
          decoration: buildUsernameSignUpInputDecoration("Name"),
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
        decoration: buildEmailSignUpInputDecoration("Email"),
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
        decoration: buildPasswordSignUpInputDecoration("Password"),
        obscureText: _obscureText,
        onSaved: (value) => _password = value,
      ),
    );
    textFields.add(
      SizedBox(height: 20.0),
    );
    // if were in the sign up state add  the Confirm Password TextFormField below the other fields
    if (authFormType == AuthFormType.signUp) {
      textFields.add(
        TextFormField(
          validator: (confirmation) {
            return confirmation.isEmpty
                ? "Please Confirm Your Password "
                : validationEqual(confirmation, _password)
                    ? null
                    : 'Password did not match';
          }, // invoking the validation function
          style: TextStyle(fontSize: 22.0),
          decoration:
              buildConfirmPasswordSignUpInputDecoration("Confirm Password"),
          onSaved: (value) => _name = value,
        ),
      );

      textFields.add(
        SizedBox(height: 5.0),
      );
    }

    return textFields;
  }

  // Username Input TextField decorations
  InputDecoration buildUsernameSignUpInputDecoration(String hint) {
    return InputDecoration(
        hintText: hint,
        prefixIcon: Icon(
          Icons.person_outline,
          color: Colors.blue[300],
        ),
        filled: true,
        fillColor: Colors.white,
        focusColor: Colors.white,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: Colors.blue[400],
            width: 2.0,
          ),
        ),
        contentPadding: const EdgeInsets.only(
          left: 14.0,
          bottom: 10.0,
          top: 10.0,
        ));
  }

  // Email Input TextField decorations
  InputDecoration buildEmailSignUpInputDecoration(String hint) {
    return InputDecoration(
      //labelText: "Email",
        hintText: hint,
        prefixIcon: Icon(Icons.mail_outline, color: Colors.blue[300]),
        filled: true,
        fillColor: Colors.white,
        focusColor: Colors.white,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: Colors.blue[400],
            width: 2.0,
          ),
        ),
        contentPadding: const EdgeInsets.only(
          left: 14.0,
          bottom: 10.0,
          top: 10.0,
        ));
  }

  // Password Input TextField decorations
  InputDecoration buildPasswordSignUpInputDecoration(String hint) {
    return InputDecoration(
        hintText: hint,
        prefixIcon: Icon(Icons.lock_outline, color: Colors.blue[300]),
        suffixIcon: IconButton(
          icon: Icon(
            // Based on _obscureText state choose the icon
            _obscureText ? Icons.visibility_off : Icons.visibility,
            color: Colors.blue[500],
          ),
          color: Colors.blue[300],
          onPressed: () {
            _toggle();
            // TODO : add functionality
          },
        ),
        filled: true,
        fillColor: Colors.white,
        focusColor: Colors.white,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: Colors.blue[400],
            width: 2.0,
          ),
        ),
        contentPadding: const EdgeInsets.only(
          left: 14.0,
          bottom: 10.0,
          top: 10.0,
        ));
  }

  // Confirm Password Input TextField decorations
  InputDecoration buildConfirmPasswordSignUpInputDecoration(String hint) {
    return InputDecoration(
        hintText: hint,
        prefixIcon: Icon(Icons.lock_outline, color: Colors.blue[300]),
        suffixIcon: IconButton(
          icon: Icon(
            // Based on _obscureText state choose the icon
            _obscureText ? Icons.visibility_off : Icons.visibility,
            color: Colors.blue[500],
          ),
          color: Colors.blue[300],
          onPressed: () {
            _toggle();
          },
        ),
        filled: true,
        fillColor: Colors.white,
        focusColor: Colors.white,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: Colors.blue[400],
            width: 2.0,
          ),
        ),
        contentPadding: const EdgeInsets.only(
          left: 14.0,
          bottom: 10.0,
          top: 10.0,
        ));
  }
  // Handling Buttons

  List<Widget> buildButtons() {
    String _switchButtonText, _newFormState, _submitButtonText;
    bool _showForgotPassword = false;
    bool _showSocials = true;

    if (authFormType == AuthFormType.signIn) {
      _switchButtonText = "Create An Account";
      _newFormState = "signUp";
      _submitButtonText = "Sign In";
      _showForgotPassword = true;
    } else if (authFormType == AuthFormType.reset) {
      _switchButtonText = "Return to Sign In";
      _newFormState = "signIn";
      _submitButtonText = "Submit";
      _showSocials = false;
    } else {
      _switchButtonText = "Already have an account? Sign In ";
      _newFormState = "signIn";
      _submitButtonText = "Sign Up";
    }
    return [
      SizedBox(
        height: MediaQuery.of(context).size.height * 0.01,
      ),
      Container(
        width: MediaQuery.of(context).size.width * 0.7,
        child: RaisedButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
          color: Colors.blue,
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
      ),
      buildSocialIcons(_showSocials),
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

  Widget buildSocialIcons (bool visible){
    final _auth = Provider.of(context).auth;
    return Visibility(
      child: Column(
        children: [
          Divider(color: Colors.white),
          SizedBox(height: 5.0),
          GoogleSignInButton(
            onPressed: () async {
              try{
                await _auth.signInWithGoogle();
                Navigator.of(context).pushReplacementNamed('/home');
              }catch(e){
                setState(() {
                  _warning = e.message;
                  print(_warning);
                });
              }
            },
          )
        ],
      ),
      visible: visible,
    );
  }
}

// TextFields validators classes

// Validating Name
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

// Validating Email
class EmailValidator {
  static String validate(String value) {
    if (value.isEmpty) {
      return "Please Enter Your Email ";
    }
    return null;
  }
}

// Validating Password
class PasswordValidator {
  static String validate(String value) {
    if (value.isEmpty) {
      return "Please Enter Your Password";
    }
    return null;
  }
}

// Validating Confirm Password
class ConfirmPasswordValidator {
  static String validate(String value) {
    if (value.isEmpty) {
      return "Please Confirm Your Password";
    }
  }
}

// Validating if Password and Confirm Password are a match
bool validationEqual(String currentValue, String checkValue) {
  if (currentValue == checkValue) {
    return true;
  } else {
    return false;
  }
}
