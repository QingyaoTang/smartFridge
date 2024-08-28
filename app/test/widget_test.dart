// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:app/get_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

void main() {
  runApp(GetMaterialApp(
    title: 'login APP',
    initialRoute: '/login',
    getPages: pages,
  ));
}
