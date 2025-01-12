import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:giga_pelanggan/module/bantuan/bantuan_view.dart';
import 'package:giga_pelanggan/module/home/home_view.dart';
import 'package:giga_pelanggan/module/profile/profile_view.dart';
import 'package:giga_pelanggan/module/tagihan/tagihan_view.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());

    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 60,
          elevation: 0,
          selectedIndex: controller.slectedIndex.value,
          onDestinationSelected: (index) =>
              controller.slectedIndex.value = index,
          destinations: const [
            NavigationDestination(icon: Icon(Icons.home), label: 'Beranda'),
            NavigationDestination(icon: Icon(Icons.history), label: 'Tagihan'),
            NavigationDestination(icon: Icon(Icons.help), label: 'Bantuan'),
            NavigationDestination(icon: Icon(Icons.people), label: 'Profil'),
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.slectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> slectedIndex = 0.obs;

  final screens = [
    const HomeView(),
    const TagihanView(),
    const BantuanView(),
    const ProfileView(),
  ];
}
