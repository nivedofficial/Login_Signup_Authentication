import 'package:flutter/material.dart';
import 'package:innovace/pages/login_screen.dart';

class HomeScreen extends StatelessWidget {
  final String username;
  const HomeScreen({super.key, required this.username});

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
                          child: Text("Welcome $username",
                                    style: TextStyle(
                                    fontSize: 35,
                                    fontWeight: FontWeight.w800,
                                    ),
                                  ),
                          ),
                        SizedBox(height: 15),

                        Padding(
                              padding: const EdgeInsets.only(left: 35.0),
                              child: Text("Hope you have a "
                                            "good day",
                                        style: TextStyle(
                                        color: Color(0xff292929),
                                        fontSize: 30,
                                        fontWeight: FontWeight.w500,
                                      ),
                                  ),
                          ),
                        SizedBox(height: 60),
                      GestureDetector(
                        onTap: () {
                        Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => Login()
                          ));
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 33.0, right: 33.0),
                          child: Container(
                            width: 150,
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(15)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 14, bottom: 14),
                              child: Center(
                                child: Text("Log out",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ]
                  )
                ]
        )
      )
    );
  }
}
