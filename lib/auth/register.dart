import 'package:flutter/gestures.dart';
import 'package:foodboard/constants.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import 'package:foodboard/utils/auth_service.dart';

import 'package:foodboard/components/main_button.dart';
import 'package:foodboard/auth/login.dart';
import 'package:foodboard/home.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _showPassword = false;

  void _togglePassword() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage("assets/images/auth.jpg"),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.5), BlendMode.darken),
            )),
          ),
          Column(
            children: [
              Expanded(
                  child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.08),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: 'FOOD',
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          color: light_green,
                          fontSize: 45,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                              text: 'BOARD',
                              style: TextStyle(
                                color: Colors.white,
                              )),
                        ],
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    Text(
                      "Got food? Share it with someone who doesn't.",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          fontSize: 24),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              )),
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.08,
                    vertical: MediaQuery.of(context).size.height * 0.04),
                height: MediaQuery.of(context).size.height * 0.65,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20.0),
                      topLeft: Radius.circular(20.0)),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Create Account",
                        style: TextStyle(
                            fontWeight: FontWeight.w800,
                            color: dark_green,
                            fontSize: 28),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        labelText: "Email Address",
                        labelStyle: TextStyle(
                            color: dark_grey,
                            fontWeight: FontWeight.w600,
                            fontSize: 22),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        hintText: "Enter email address",
                        hintStyle: TextStyle(height: 2, fontSize: 16),
                        suffixIcon: Icon(
                          Icons.mail,
                          color: dark_green,
                          size: 28,
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: const BorderSide(color: dark_green),
                        ),
                      ),
                    ),
                    TextField(
                      obscureText: !_showPassword,
                      controller: _passwordController,
                      decoration: InputDecoration(
                        labelText: "Password",
                        labelStyle: TextStyle(
                            color: dark_grey,
                            fontWeight: FontWeight.w600,
                            fontSize: 22),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        hintText: "Enter password",
                        hintStyle: TextStyle(height: 2, fontSize: 16),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            _togglePassword();
                          },
                          child: Icon(
                            _showPassword ? Ionicons.eye : Ionicons.eye_off,
                            color: dark_green,
                            size: 28,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: const BorderSide(color: dark_green),
                        ),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                    MainButton(
                      press: () {
                        context.read<AuthenticationService>().signUp(
                              email: _emailController.text.trim(),
                              password: _passwordController.text.trim(),
                            );
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Home(),
                          ),
                          (route) => false,
                        );
                      },
                      text: "Sign Up",
                      gradient: LinearGradient(
                        colors: <Color>[
                          light_green,
                          dark_green,
                        ],
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.05),
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text: 'By creating an account, you agree to our ',
                          style: TextStyle(
                            color: dark_grey,
                            fontSize: 15,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Terms and Conditions',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                              ),
                              recognizer: TapGestureRecognizer()..onTap = () {},
                            ),
                            TextSpan(text: "."),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    Divider(thickness: 1.5),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    RichText(
                      text: TextSpan(
                        text: 'Already have an account? ',
                        style: TextStyle(
                          color: dark_grey,
                          fontSize: 15,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Sign In',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: light_green,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Login()),
                                );
                              },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
