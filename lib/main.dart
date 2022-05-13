import 'package:aura_web_dashboard/app/locator.dart';
import 'package:aura_web_dashboard/ui/screens/homepage_view.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'AURA Demo',
      home: HomePageView(),
    );
  }
}
