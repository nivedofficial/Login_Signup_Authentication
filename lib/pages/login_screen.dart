import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:innovace/pages/signup_screen.dart';

import '../models/usermodel.dart';
import 'home_screen.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}



class _LoginState extends State<Login> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _usernameError = false;
  bool _passwordError = false;
  bool _isPasswordVisible = false;



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
                  child: Text("Let's Sign you in.",
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.only(left: 35.0),
                  child: Text("Welcome back",
                    style: TextStyle(
                      color: Color(0xff292929),
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.only(left: 35.0),
                  child: Text("You've been missed!",
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
                        color: _usernameError ? Color(0xffFF474C):Colors.black38,
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: EdgeInsets.all(20),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: _usernameError ? Color(0xffFF474C): Color(0xffF2F0F2),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 2,
                          color: _usernameError ? Color(0xffFF474C): Color(0xffC8F533),
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ),

                if (_usernameError)
                  Padding(
                    padding: const EdgeInsets.only(left: 33.0, right: 33.0, top: 5),
                    child: Text(
                      "Please enter your username",
                      style: TextStyle(color: Color(0xffFF474C), fontSize: 12),
                    ),
                  ),

                SizedBox(height: 20),

                // Password TextField
                Padding(
                  padding: const EdgeInsets.only(left: 33.0, right: 33.0),
                  child: TextField(
                    controller: _passwordController,
                    obscureText: !_isPasswordVisible,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: TextStyle(
                        color:_passwordError ? Color(0xffFF474C): Colors.black38,
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: EdgeInsets.all(20),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: _passwordError ? Color(0xffFF474C) : Color(0xffF2F0F2),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 2,
                          color: _passwordError ? Color(0xffFF474C) : Color(0xffC8F533),
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible;
                          });
                        },
                        child: Icon(
                          _isPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.black38,
                        ),
                      ),
                    ),
                  ),
                ),

                if (_passwordError)
                  Padding(
                    padding: const EdgeInsets.only(left: 33.0, right: 33.0, top: 5),
                    child: Text(
                      "Please enter your password",
                      style: TextStyle(color: Color(0xffFF474C), fontSize: 12),
                    ),
                  ),

                SizedBox(height: 35,),

                const Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(left: 40, right: 10.0),
                        child: Divider(
                          color: Color(0xffDEDEDE),
                          thickness: 1.0,
                        ),
                      ),
                    ),
                    Text('OR',
                      style: TextStyle(
                        color: Color(0xffDEDEDE),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(left: 10, right: 40,),
                        child: Divider(
                          color: Color(0xffDEDEDE),
                          thickness: 1.0,
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 32,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      child: SvgPicture.asset('assets/icons/google-logo-search-new-svgrepo-com.svg'),
                      radius: 18,
                      backgroundColor: Colors.white,
                    ),
                    SizedBox(width: 15,),
                    CircleAvatar(
                      child: SvgPicture.asset('assets/icons/facebook-1-svgrepo-com.svg'),
                      radius: 20,
                      backgroundColor: Colors.white,
                    ),
                    SizedBox(width: 15,),
                    CircleAvatar(
                      child: SvgPicture.asset('assets/icons/logo-apple-svgrepo-com.svg'),
                      radius: 18,
                      backgroundColor: Colors.white,
                    ),
                  ],
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
                      Text("Don't have an account ? ",
                        style: TextStyle(
                          color: Colors.black45,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      GestureDetector(
                        onTap:(){
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => Signup()),
                          );
                        },
                        child: Text("Register",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15,),
                  GestureDetector(
                    onTap: () => _login(context),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 33.0, right: 33.0),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Color(0xffD3F36A),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 14, bottom: 14),
                          child: Center(
                            child: Text("Sign In",
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

  Future<void> _login(BuildContext context) async {
    setState(() {
      _usernameError = _usernameController.text.isEmpty;
      _passwordError = _passwordController.text.isEmpty;
    });

    if (_usernameError || _passwordError) {
      return;
    }

    final user = UserModel(
      username: _usernameController.text,
      password: _passwordController.text,
      email: '',
    );

    bool success = await user.login();
    if (success) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Login Successfull'),
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
          content: Text('Invalid Credentials'),
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
    super.dispose();
  }
}
