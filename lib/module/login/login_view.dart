import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:giga_pelanggan/controller/loginController.dart';
import 'package:giga_pelanggan/global/style.dart';
// import 'package:giga_pelanggan/module/navigation_menu.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  LoginViewState createState() => LoginViewState();
}

class LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    LoginController controller = Get.put(LoginController());
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: <Color>[
            Color(0xffb40000),
            Color(0xff8f0000),
            Color(0xffcb2612),
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Image.asset(
                    'assets/icons/logo-landscape.png',
                    width: 150,
                    color: GColors.textWhite,
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  const Text(
                    'Halo Sahabat GIGA',
                    style: TextStyle(
                        fontSize: 25,
                        color: GColors.textWhite,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Silahkan isi form login dibawah untuk melanjutkan',
                    style: TextStyle(color: GColors.textWhite, fontSize: 15),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: GColors.textWhite,
                          borderRadius: BorderRadius.circular(5)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: TextFormField(
                          controller: controller.username,
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'ID Pelanggan '),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: GColors.textWhite,
                          borderRadius: BorderRadius.circular(5)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: TextFormField(
                          controller: controller.password,
                          obscureText: true,
                          decoration: const InputDecoration(
                              border: InputBorder.none, hintText: 'Password'),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: GestureDetector(
                      onTap: () async {
                        await controller.submit();
                      },
                      //  => Get.to(() => const NavigationMenu()),
                      child: Container(
                        decoration: BoxDecoration(
                            color: GColors.textWhite,
                            borderRadius: BorderRadius.circular(5)),
                        child: const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Center(
                            child: Text(
                              'Masuk Aplikasi',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
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
          ),
        ),
      ),
    );
  }
}
