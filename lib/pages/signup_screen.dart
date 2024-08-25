import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:innovace/pages/login_screen.dart';

import '../models/usermodel.dart';
import 'home_screen.dart';


class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}



class _SignupState extends State<Signup> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  bool _usernameError = false;
  bool _emailError = false;
  bool _passwordError = false;
  bool _confirmPasswordError = false;
  bool _passwordMatchError=false;
  bool _isSubmitClicked = false;

  bool hasUpperCase = false;
  bool hasSpecialCharacter = false;
  bool hasNumber = false;
  bool hasValidPassword=false;


  void _checkPasswordConstraints(String password) {
    setState(() {
      hasUpperCase = password.isNotEmpty && password[0] == password[0].toUpperCase();
      hasSpecialCharacter = password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
      hasNumber = password.contains(RegExp(r'[0-9]'));

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xffF6F6EF),
      body: SafeArea(
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 50,),
                Padding(
                  padding: const EdgeInsets.only(left: 35.0),
                  child: Text("Let's Get Started!",
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.only(left: 35.0),
                  child: Text("Create an account to continue",
                    style: TextStyle(
                      color: Color(0xff292929),
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(height: 60),

                // Username TextField
                Padding(
                  padding: const EdgeInsets.only(left: 33.0, right: 33.0),
                  child: TextField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                      labelText: 'Username',
                      labelStyle: TextStyle(
                        color: _usernameError ? Color(0xffFF474C):  Colors.black38,
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: EdgeInsets.all(20),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: _usernameError ? Color(0xffFF474C) : Color(0xffF2F0F2),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 2,
                          color: _usernameError ? Color(0xffFF474C) : Color(0xffC8F533),
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ),

                if (_usernameError)
                  Padding(
                    padding: const EdgeInsets.only(left: 50.0, right: 33.0, top: 8),
                    child: Text(
                      "Please enter your username",
                      style: TextStyle(color:Color(0xffFF474C), fontSize: 12),
                    ),
                  ),

                SizedBox(height: 20),

                // Email TextField
                Padding(
                  padding: const EdgeInsets.only(left: 33.0, right: 33.0),
                  child: TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: TextStyle(
                        color: _emailError ? Color(0xffFF474C) :  Colors.black38,
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: EdgeInsets.all(20),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: _emailError ? Color(0xffFF474C) : Color(0xffF2F0F2),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 2,
                          color: _emailError ? Color(0xffFF474C): Color(0xffC8F533),
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ),

                if (_emailError)
                  Padding(
                    padding: const EdgeInsets.only(left: 50.0, right: 33.0, top: 8),
                    child: Text(
                      "Please enter a valid email",
                      style: TextStyle(color: Color(0xffFF474C), fontSize: 12),
                    ),
                  ),




                SizedBox(height: 20),

                // Password TextField
                Padding(
                  padding: const EdgeInsets.only(left: 33.0, right: 33.0),
                  child: TextField(
                    controller: _passwordController,
                    onChanged: _checkPasswordConstraints,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: TextStyle(
                        color: _passwordError ? Color(0xffFF474C):  Colors.black38,
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: EdgeInsets.all(20),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: _passwordError ? Color(0xffFF474C):  Color(0xffF2F0F2),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 2,
                          color: _passwordError ? Color(0xffFF474C): Color(0xffC8F533),
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),

                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 50.0, right: 33.0, top: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (!hasUpperCase)
                        Text(
                          "•  Must start with a capital letter",
                          style: TextStyle(
                              color: (_isSubmitClicked && !hasUpperCase)?Color(0xffFF474C):Colors.black38,
                              fontSize: 12),
                        ),
                      if (!hasSpecialCharacter)
                        Text(
                          "•  Must contain a special character",
                          style: TextStyle(
                              color: (_isSubmitClicked && !hasSpecialCharacter)?Color(0xffFF474C):Colors.black38,
                              fontSize: 12),
                        ),
                      if (!hasNumber)
                        Text(
                          "•  Must contain a number",
                          style: TextStyle(
                              color: (_isSubmitClicked && !hasNumber)?Color(0xffFF474C):Colors.black38,
                              fontSize: 12),
                        ),
                    ],
                  ),
                ),




                SizedBox(height: 20),

                // Confirm Password TextField
                Padding(
                  padding: const EdgeInsets.only(left: 33.0, right: 33.0),
                  child: TextField(
                    controller: _confirmPasswordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Confirm Password',
                      labelStyle: TextStyle(
                        color: _confirmPasswordError ? Color(0xffFF474C):   Colors.black38,
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: EdgeInsets.all(20),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: _confirmPasswordError ? Color(0xffFF474C): Color(0xffF2F0F2),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 2,
                          color: _confirmPasswordError ? Color(0xffFF474C) : Color(0xffC8F533),
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),

                    ),
                  ),
                ),
                if (_confirmPasswordError)
                  Padding(
                    padding: const EdgeInsets.only(left: 50.0, right: 33.0, top: 8),
                    child: Text(
                      "Please confirm your password",
                      style: TextStyle(color: Color(0xffFF474C), fontSize: 12),
                    ),
                  ),

              ],
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already have an account? ",
                        style: TextStyle(
                            color: Colors.black45,
                            fontWeight: FontWeight.w500
                        ),),

                      GestureDetector(
                        onTap: (){
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => Login()),
                          );
                        },
                        child: Text("Login",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                          ),),
                      ),
                    ],
                  ),

                  SizedBox(height: 15,),

                  GestureDetector(
                    onTap: () => _signup(context),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 33.0, right: 33.0),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Color(0xffD3F36A),
                            borderRadius: BorderRadius.circular(15)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 14, bottom: 14),
                          child: Center(
                            child: Text("Sign Up",
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30,)
          ],
        ),
      ),
    );
  }

  Future<void> _signup(BuildContext context) async {
    setState(() {
      _isSubmitClicked = true;
      _usernameError = _usernameController.text.isEmpty;
      _emailError = !isValidEmail(_emailController.text);
      _passwordError = _passwordController.text.isEmpty;
      _confirmPasswordError = _confirmPasswordController.text.isEmpty;
      _passwordMatchError= (_passwordController.text != _confirmPasswordController.text);
      hasValidPassword=hasUpperCase && hasSpecialCharacter && hasNumber;

    });

    if (_passwordMatchError)
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Password do not match'),
          backgroundColor: Color(0xffFF474C),
          margin: EdgeInsets.only(left: 33, bottom: 150.0, right: 33),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      );

    if (_usernameError || _emailError || _passwordError ||
        _confirmPasswordError || _passwordMatchError || !hasValidPassword) {
      return;
    }

    final user = UserModel(
      username: _usernameController.text,
      email: _emailController.text,
      password: _passwordController.text,
    );

    String success = await user.signup();
    if (success=="Success") {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Account Created'),
          backgroundColor: Colors.green,
          margin: EdgeInsets.only(left: 33, bottom: 150.0, right: 33),
          behavior: SnackBarBehavior.floating,
          duration: Duration(seconds: 2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      );
      Future.delayed(Duration(seconds: 3), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(
              username: _usernameController.text,
            ),
          ),
        );
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('$success'),
          backgroundColor: Color(0xffFF474C),
          margin: EdgeInsets.only(left: 33, bottom: 150.0, right: 33),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      );
    }
  }
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _emailController.dispose();
    super.dispose();
  }
}

bool isValidEmail(String email) {
  final emailRegex = RegExp(
      r'^(?!\.)[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$'
  );
  return emailRegex.hasMatch(email);
}
