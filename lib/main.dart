import 'dart:io';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:admin/constants.dart';
import 'package:admin/controllers/MenuController.dart' as menu;
import 'package:admin/screens/main/components/custom_appbar.dart';
import 'package:admin/screens/main/components/custom_drawer.dart';
import 'package:admin/screens/main/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'responsive.dart';
import 'screens/main/mobile.dashboard.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: ThemeData.light().copyWith(
        scaffoldBackgroundColor: creamColor,
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
            .apply(bodyColor: Colors.black),
        canvasColor: snowColor,
      ),
      dark: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: bgColor,
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
            .apply(bodyColor: Colors.white),
        canvasColor: secondaryColor,
      ),
      initial: AdaptiveThemeMode.light,
      builder: (theme, darkTheme) => GetMaterialApp(
        builder: Platform.isIOS || Platform.isAndroid
            ? null
            : (context, child) {
                return Overlay(
                  initialEntries: [
                    OverlayEntry(
                      builder: (context) {
                        return Scaffold(
                          appBar: CustomAppbar(),
                          drawer: CustomDrawer(),
                          body: child,
                        );
                      },
                    ),
                  ],
                );
              },
        title: 'Adaptive Theme Demo',
        theme: theme,
        darkTheme: darkTheme,
        debugShowCheckedModeBanner: false,
        home: MultiProvider(
          providers: [
            ChangeNotifierProvider<menu.MenuController>(
              create: (context) => menu.MenuController(),
            ),
          ],
          child: PlatformWrapper(),
        ),
      ),
    );
    // return MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   title: 'Flutter Admin Panel',
    //   theme: ThemeData.dark().copyWith(
    //     scaffoldBackgroundColor: bgColor,
    //     textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
    //         .apply(bodyColor: Colors.white),
    //     canvasColor: secondaryColor,
    //   ),
    //   home: MultiProvider(
    //     providers: [
    //       ChangeNotifierProvider(
    //         create: (context) => MenuController(),
    //       ),
    //     ],
    //     child: MainScreen(),
    //   ),
    // );
  }
}

class PlatformWrapper extends StatefulWidget {
  const PlatformWrapper({super.key});

  @override
  State<PlatformWrapper> createState() => _PlatformWrapperState();
}

class _PlatformWrapperState extends State<PlatformWrapper> {
  @override
  Widget build(BuildContext context) {
    return (Responsive.isDesktop(context)) ? MainScreen() : Dashboard();
  }
}
