
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:herhaven_admin/sidebar_controller.dart';
import 'package:sidebarx/sidebarx.dart';

import '../colors.dart';



class ExampleSidebarX extends StatefulWidget {
  @override
  State<ExampleSidebarX> createState() => _ExampleSidebarXState();
}

class _ExampleSidebarXState extends State<ExampleSidebarX> {

  // void _showLogoutDialog() {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         backgroundColor: backgroundColor,
  //         title: Text('Logout'),
  //         content: Text('Are you sure you want to logout?'),
  //         actions: <Widget>[
  //           CustomButton(
  //             color: Colors.transparent,
  //             width: 100,
  //             height: 40,
  //             text: 'No',
  //             textColor: Colors.red,
  //             onPressed: () {
  //               sidebarController.selectedindex.value = 0;
  //
  //               Navigator.of(context).pop();
  //             },
  //           ),
  //           CustomButton(
  //             width: 100,
  //             height: 40,
  //             text: 'Yes',
  //             onPressed: () async {
  //               // await FirebaseAuth.instance.signOut();
  //               // Navigator.of(context).pop();
  //               // Navigator.of(context).pushReplacement(
  //               //   MaterialPageRoute(builder: (context) => LoginPage()),
  //               // );
  //             },
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }

  final SidebarController sidebarController = Get.put(SidebarController());

  @override
  Widget build(BuildContext context) {
    print('hellosidebarController${sidebarController.selectedindex.value}');
    // final setNameProvider=Provider.of<GetHeadingNurseName>(context,listen: false);
    return GetBuilder<SidebarController>(
        builder: (sidebarController) {
          return SidebarX(

            controller: sidebarController.controller,
            theme: SidebarXTheme(
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: pink, // Main background color
                borderRadius: BorderRadius.circular(20),
              ),
              hoverColor: purple.withOpacity(0.3),
              textStyle: TextStyle(
                color: text1, // Unselected text color
                fontSize: 16,
              ),
              selectedTextStyle: TextStyle(
                color: primaryColor, // Selected text uses primary cream
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              hoverTextStyle: TextStyle(
                fontSize: 16,
                color: blue, // On hover
                fontWeight: FontWeight.w600,
              ),
              itemTextPadding: const EdgeInsets.only(left: 10),
              selectedItemTextPadding: const EdgeInsets.only(left: 10),
              itemDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: purple), // Border for unselected items
              ),
              selectedItemDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                  colors: [primaryColor, blue.withOpacity(0.3)],
                ),
                border: Border.all(color: blue),
                boxShadow: [
                  BoxShadow(
                    color: black.withOpacity(0.3),
                    blurRadius: 12,
                  ),
                ],
              ),
              iconTheme: IconThemeData(
                color: iconcolor,
                size: 20,
              ),
              selectedIconTheme: IconThemeData(
                color: primaryColor,
                size: 22,
              ),
            ),

            extendedTheme: SidebarXTheme(
              width: 220,
              decoration: BoxDecoration(
                color: pink, // Extended also uses pink background
              ),
            ),

            footerDivider: Divider(),
            headerBuilder: (context, extended) {
              return Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Obx(
                        () =>
                    sidebarController.showsidebar.value == true
                        ? Align(
                        alignment: Alignment.topRight,
                        child: Icon(
                          Icons.clear_sharp,
                          color: primaryColorKom,
                        ))
                        : SizedBox.shrink(),
                  ),
                  Get.width <= 1440
                      ? SizedBox(
                    height: 100,
                    width: 500,
                    child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Image.asset('assets/images/logo.png')),
                  )
                      : Get.width > 1440 && Get.width <= 2550
                      ? SizedBox(
                    height: 100,
                    width: 500,
                    child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Image.asset('assets/images/logo.png')),
                  )
                      : SizedBox(
                    height: 80,
                    width: 220,
                    child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Image.asset('assets/images/logo.png')),
                  ),
                ],
              );
            },
            items: [
              SidebarXItem(
                  onTap: () {
                    sidebarController.selectedindex.value = 0;

                  },
                  iconBuilder: (selected, hovered) {
                    return Icon(
                      Icons.home,
                      color: Colors.transparent,
                    );
                  },
                  label: 'User Data'),
              SidebarXItem(
                  onTap: () {
                    sidebarController.selectedindex.value = 1;

                  },
                  iconBuilder: (selected, hovered) {
                    return Icon(
                      Icons.home,
                      color: Colors.transparent,
                    );
                  },
                  label: 'Bookings'),
              SidebarXItem(
                  onTap: () {
                    sidebarController.selectedindex.value = 2;


                  },
                  iconBuilder: (selected, hovered) {
                    return Icon(
                      Icons.home,
                      color: Colors.transparent,
                    );
                  },
                  label: 'Events'),
              SidebarXItem(
                  onTap: () {
                    sidebarController.selectedindex.value = 0;
                    sidebarController.controller =SidebarXController(selectedIndex: 0, extended: true);sidebarController.update();
                    //
                 //   _showLogoutDialog();

                  },
                  iconBuilder: (selected, hovered) {
                    return Icon(
                      Icons.home,
                      color: Colors.transparent,
                    );
                  },
                  label: 'Log out'),

            ],
          );
        });
  }
}