
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:herhaven_admin/sidebar.dart';
import 'package:herhaven_admin/sidebar_controller.dart';

import 'User_Details.dart';


class HomeMain extends StatefulWidget {
  const HomeMain({super.key});

  @override
  State<HomeMain> createState() => _HomeMainState();
}

class _HomeMainState extends State<HomeMain> {
  final SidebarController sidebarController = Get.put(SidebarController());
  @override
  Widget build(BuildContext context) {
    final width=MediaQuery.of(context)!.size.width;
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          if(sidebarController.showsidebar.value ==true) {
            sidebarController.showsidebar.value =false;
          }
        },
        child: Stack(
          children: [
            Row(
              children: [
                width>=768?ExampleSidebarX():SizedBox.shrink(),
                Expanded(
                    child: Obx(() => sidebarController.selectedindex.value == 0
                        ? UserDetails()
                        : sidebarController.selectedindex.value == 1
                        ? UserDetails()
                        : sidebarController.selectedindex.value == 2
                        ? UserDetails()
                        : UserDetails()))
              ],
            ),
            Obx(()=>sidebarController.showsidebar.value == true? ExampleSidebarX():SizedBox.shrink(),)

          ],
        ),
      ),
    );
  }
}
