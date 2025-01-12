import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:giga_pelanggan/models/user.dart';
import 'package:dio/dio.dart';
import 'package:giga_pelanggan/module/navigation_menu.dart';

class LoginController extends GetxController {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  String message = "";

  static String? nomor;
  static String? otp;
  static String? pelanggan;
  static String? accesstoken;
  static String? id;

  Future<void> submit() async {
    User user =
        User(username: username.text.trim(), password: password.text.trim());
    bool validateResult = validateUser(user);
    if (validateResult) {
      bool result = await authenticateUser(user);
      if (result) {
        Get.offAll(() => const NavigationMenu());
        // print(result);
      } else {
        await showMessage(
            context: Get.context!,
            titel: "Oppss..",
            message: "Username atau Password salah");
      }
    } else {
      await showMessage(
          context: Get.context!, titel: "Peringatan", message: message);
    }
  }

  bool validateUser(User user) {
    if (user.username == null && user.password == null) {
      message = "Username dan Password tidak boleh kosong";
      return false;
    }
    if (user.username.toString().isEmpty) {
      message = "Username tidak boleh kosong";
      return false;
    }
    if (user.password.toString().isEmpty) {
      message = "Password tidak boleh kosong";
      return false;
    }
    return true;
  }

  Future<bool> authenticateUser(User user) async {
    Dio dio = Dio();
    String apiUrl = "https://rest1.cianjurwifi.com/api/v2/plg/login-pelanggan";

    try {
      Map<String, dynamic> data = {
        "username": username.text.trim(),
        "password": password.text.trim()
      };

      final response = await dio.post(apiUrl, data: data);

      Map obj = response.data;
      if (obj["status"] == false) return false;
      nomor = obj["nomor"];
      otp = obj["otp"];
      pelanggan = obj["pelanggan"];
      accesstoken = obj["access_token"];
      id = obj["id"].toString();
      return true;
    } catch (e) {
      return false;
    }
  }

  showMessage(
      {required BuildContext context,
      required String titel,
      required String message}) {
    showCupertinoDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: Text(titel),
            content: Text(message),
            actions: [
              CupertinoDialogAction(
                child: const Text("OK"),
                onPressed: () {
                  Get.back();
                },
              )
            ],
          );
        });
  }
}
