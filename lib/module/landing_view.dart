import 'package:flutter/material.dart';
import 'package:giga_pelanggan/module/login/login_view.dart';
import 'package:giga_pelanggan/global/style.dart';

class LandingView extends StatefulWidget {
  const LandingView({super.key});

  @override
  LandingViewState createState() => LandingViewState();
}

class LandingViewState extends State<LandingView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: <Color>[
          Color(0xffb40000),
          Color(0xff8f0000),
          Color(0xffcb2612),
        ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  'assets/icons/1024.png',
                  width: 150,
                  height: 150,
                ),
              ),
              const SizedBox(
                height: 200,
              ),
              const Text(
                'Welcome!',
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const Text(
                'DI GIGA APPLIKASI',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const SizedBox(
                height: 200,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginView()));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: GColors.textWhite,
                        borderRadius: BorderRadius.circular(5)),
                    child: const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Center(
                        child: Text(
                          'JELAJAHI',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
