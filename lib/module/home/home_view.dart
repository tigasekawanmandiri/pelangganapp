import 'package:flutter/material.dart';
import 'package:giga_pelanggan/widget/home_widget/primary_header.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            GPrimaryHeader(
              child: Container(),
            ),
          ],
        ),
      ),
    );
  }
}
