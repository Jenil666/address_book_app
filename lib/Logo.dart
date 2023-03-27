import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Logo extends StatefulWidget {
  const Logo({Key? key}) : super(key: key);

  @override
  State<Logo> createState() => _LogoState();
}

class _LogoState extends State<Logo> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3),() {
      Navigator.pushReplacementNamed(context, 'home');
    },);
    return SafeArea(child: Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Text("Jenil",style: GoogleFonts.babylonica(fontSize: 50,color: Colors.white),),
      ),
    ));
  }
}
