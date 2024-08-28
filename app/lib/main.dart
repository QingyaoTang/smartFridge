import 'package:app/get_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(GetMaterialApp(
    title: 'login APP',
    initialRoute: '/home',
    getPages: pages,
  ));
}
