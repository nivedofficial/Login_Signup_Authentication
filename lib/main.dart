import 'package:flutter/material.dart';
import 'package:innovace/pages/login_screen.dart';


void main() {
  runApp(const Innovace());
}

class Innovace extends StatefulWidget {
  const Innovace({super.key});

  @override
  State<Innovace> createState() => _InnovaceState();
}

class _InnovaceState extends State<Innovace> {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        scrollbarTheme: ScrollbarThemeData(
          thickness:WidgetStateProperty.all(6.0),
          thumbColor: WidgetStateProperty.all(Color(0xffD3F36A)),

        ),
        fontFamily: 'Satoshi',
      ),
      home: const Login(),
    );
  }
}